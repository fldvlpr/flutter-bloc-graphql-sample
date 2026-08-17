import 'package:flutter_bloc_graphql_sample/core/network/graphql_client.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/data/providers/post_provider.dart';
import 'package:flutter_bloc_graphql_sample/features/posts/data/repositories/post_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  // 1. Register the GraphQL Client (Singleton — created once, reused everywhere)
  getIt.registerLazySingleton<GraphQLClient>(() => GraphQLConfig.getClient());

  // 2. Register the Data Provider (depends on GraphQL Client)
  getIt.registerLazySingleton<PostProvider>(
    () => PostProvider(client: getIt()),
  );

  // 3. Register the Repository (depends on Data Provider)
  getIt.registerLazySingleton<PostRepository>(
    () => PostRepository(provider: getIt()),
  );
}
