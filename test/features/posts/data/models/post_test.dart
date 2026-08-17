import 'package:flutter_bloc_graphql_sample/features/posts/data/models/post.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Post Model", () {
    test("should parse from JSON correct way", () {
      // 1. Arrange: create the raw fake JSON map you expect from the API
      final jsonMap = {'id': '1', 'title': 'Test Title', 'body': 'Test Body'};

      // 2. Act: Execute the fromJson Method
      final post = Post.fromJson(jsonMap);

      // 3. Assert: Verify the Dart object has the exact fields as we expect or not
      expect(post, isA<Post>());
      expect(post.id, '1');
      expect(post.title, 'Test Title');
      expect(post.body, 'Test Body');
    });

    test("should handle null fields safely", () {
      // 1. Arrange: An API response where some fields are missing or null
      final jsonMap = {'id': '2'};

      // 2. Act: call the fromJson method
      final post = Post.fromJson(jsonMap);

      // 3. Assert: Since our freezed model allows null fields, app should not crash
      expect(post.id, '2');
      expect(post.title, null);
      expect(post.body, null);
    });
  });
}
