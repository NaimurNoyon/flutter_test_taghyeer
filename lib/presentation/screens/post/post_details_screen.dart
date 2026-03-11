import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../domain/entities/post.dart';

class PostDetailsScreen extends StatelessWidget {
  const PostDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Post post = Get.arguments as Post;

    return Scaffold(
      appBar: AppBar(title: Text(post.title ?? "")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(
              post.title ?? "",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(post.body ?? ""),
            const SizedBox(height: 16),
            Text("Tags: ${post.tags.join(", ")}"),
            Text("Views: ${post.views ?? 0}"),
            Text("Likes: ${post.reactions?.likes ?? 0}"),
            Text("Dislikes: ${post.reactions?.dislikes ?? 0}"),
            Text("User ID: ${post.userId ?? 0}"),
          ],
        ),
      ),
    );
  }
}
