import '../../domain/entities/post.dart';
import '../../domain/repositories/post_repository.dart';
import '../datasource/post_remote_datasource.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;

  PostRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Post>> getPosts({int limit = 10, int skip = 0}) async {
    return await remoteDataSource.getPosts(limit: limit, skip: skip);
  }
}
