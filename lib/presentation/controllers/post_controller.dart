import 'package:get/get.dart';

import '../../domain/entities/post.dart';
import '../../domain/usecases/get_posts.dart';

class PostController extends GetxController {
  final GetPosts getPostsUseCase;

  PostController(this.getPostsUseCase);

  List<Post> posts = [];
  bool isLoading = true;
  bool isPaginationLoading = false;
  bool isError = false;
  bool isEmpty = false;

  int skip = 0;
  final int limit = 10;

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  void fetchPosts() async {
    try {
      if (skip == 0) {
        isLoading = true;
      } else {
        isPaginationLoading = true;
      }
      isError = false;
      update();

      final newPosts = await getPostsUseCase(limit: limit, skip: skip);

      if (newPosts.isEmpty && skip == 0) {
        isEmpty = true;
      } else {
        posts.addAll(newPosts);
        skip += limit;
      }
    } catch (e) {
      isError = true;
    } finally {
      isLoading = false;
      isPaginationLoading = false;
      update();
    }
  }

  void refreshPosts() {
    posts.clear();
    skip = 0;
    isEmpty = false;
    fetchPosts();
  }
}
