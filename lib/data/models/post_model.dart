import '../../domain/entities/post.dart';

class PostModel extends Post {
  PostModel({
    required super.id,
    super.title,
    super.body,
    super.tags,
    super.reactions,
    super.views,
    super.userId,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json["id"] ?? 0,
      title: json["title"] ?? "",
      body: json["body"] ?? "",
      tags: (json["tags"] != null) ? List<String>.from(json["tags"]) : [],
      reactions: json["reactions"] != null
          ? Reactions(
              likes: json["reactions"]["likes"] ?? 0,
              dislikes: json["reactions"]["dislikes"] ?? 0,
            )
          : null,
      views: json["views"] ?? 0,
      userId: json["userId"] ?? 0,
    );
  }
}
