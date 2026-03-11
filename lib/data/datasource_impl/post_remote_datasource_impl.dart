import '../../constants/app_urls.dart';
import '../../core/services/network_caller.dart';
import '../datasource/post_remote_datasource.dart';
import '../models/post_model.dart';

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final NetworkCaller networkCaller;

  PostRemoteDataSourceImpl(this.networkCaller);

  @override
  Future<List<PostModel>> getPosts({int limit = 10, int skip = 0}) async {
    final response = await networkCaller.getRequest(
      AppUrls.posts(limit: limit, skip: skip),
    );

    if (response.success) {
      final List data = response.data["posts"];
      return data.map((e) => PostModel.fromJson(e)).toList();
    } else {
      throw Exception(response.message);
    }
  }
}
