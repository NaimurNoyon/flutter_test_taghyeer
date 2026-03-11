import '../entities/post.dart';

abstract class PostRepository {
  Future<List<Post>> getPosts({int limit = 10, int skip = 0});
}
