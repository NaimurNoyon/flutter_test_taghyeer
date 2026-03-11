import '../entities/post.dart';
import '../repositories/post_repository.dart';

class GetPosts {
  final PostRepository repository;

  GetPosts(this.repository);

  Future<List<Post>> call({int limit = 10, int skip = 0}) async {
    return await repository.getPosts(limit: limit, skip: skip);
  }
}
