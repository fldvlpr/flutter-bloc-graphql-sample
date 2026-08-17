import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/data/models/post.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc_graphql_sample/core/di/injection.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/bloc/post_form/post_form_bloc.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/bloc/post_form/post_form_event.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/bloc/post_form/post_form_state.dart';

class PostFormPage extends StatelessWidget {
  final String? postId; // null = Create, value = Edit
  final Post? post;

  const PostFormPage({super.key, this.postId, this.post});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PostFormBloc(postRepository: getIt()),
      child: PostFormView(postId: postId, post: post),
    );
  }
}

class PostFormView extends StatefulWidget {
  final String? postId;
  final Post? post;

  const PostFormView({super.key, this.postId, this.post});

  @override
  State<PostFormView> createState() => _PostFormViewState();
}

class _PostFormViewState extends State<PostFormView> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();

  bool get isEditing => widget.postId != null;

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (widget.post != null) {
      _titleController.text = widget.post!.title ?? '';
      _bodyController.text = widget.post!.body ?? '';
    }
  }

  void _onSubmit() {
    if (!_formKey.currentState!.validate()) return;

    if (isEditing) {
      context.read<PostFormBloc>().add(
        PostFormEvent.update(
          id: widget.postId!,
          title: _titleController.text,
          body: _bodyController.text, // Add this
        ),
      );
    } else {
      context.read<PostFormBloc>().add(
        PostFormEvent.create(
          title: _titleController.text,
          body: _bodyController.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isEditing ? 'Edit Post' : 'Create Post')),
      body: BlocListener<PostFormBloc, PostFormState>(
        listener: (context, state) {
          state.when(
            initial: () {},
            loading: () {},
            success: (_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    isEditing
                        ? 'Post updated successfully'
                        : 'Post created successfully',
                  ),
                ),
              );
              context.pop();
            },
            deleted: () {},
            failure: (message) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Error: $message')));
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) => (value == null || value.isEmpty)
                      ? 'Title is required'
                      : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _bodyController,
                  decoration: const InputDecoration(
                    labelText: 'Body',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 5,
                  validator: (value) => (value == null || value.isEmpty)
                      ? 'Body is required'
                      : null,
                ),
                const SizedBox(height: 24),
                BlocBuilder<PostFormBloc, PostFormState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => _buildSubmitButton(),
                      loading: () => const CircularProgressIndicator(),
                      success: (_) => _buildSubmitButton(),
                      deleted: () => _buildSubmitButton(),
                      failure: (_) => _buildSubmitButton(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _onSubmit,
        child: Text(isEditing ? 'Update' : 'Create'),
      ),
    );
  }
}
