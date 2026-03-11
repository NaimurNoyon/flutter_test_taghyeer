import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/routes/app_routes.dart';
import '../../controllers/post_controller.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        final controller = Get.find<PostController>();
        if (!controller.isPaginationLoading && !controller.isError) {
          controller.fetchPosts();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Posts")),
      body: GetBuilder<PostController>(
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.isError) {
            return Center(
              child: ElevatedButton(
                onPressed: controller.refreshPosts,
                child: const Text("Retry"),
              ),
            );
          }

          if (controller.isEmpty) {
            return const Center(child: Text("No posts found"));
          }

          return ListView.separated(
            controller: _scrollController,
            itemCount:
                controller.posts.length +
                (controller.isPaginationLoading ? 1 : 0),
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemBuilder: (context, index) {
              if (index < controller.posts.length) {
                final post = controller.posts[index];
                return ListTile(
                  title: Text(post.title ?? ""),
                  subtitle: Text(
                    (post.body ?? "").length > 50
                        ? "${post.body!.substring(0, 50)}..."
                        : (post.body ?? ""),
                  ),
                  onTap: () {
                    Get.toNamed(AppRoutes.postDetailsScreen, arguments: post);
                  },
                );
              } else {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            },
          );
        },
      ),
    );
  }
}
