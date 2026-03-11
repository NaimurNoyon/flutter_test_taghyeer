class Post {
  final int id;
  final String? title;
  final String? body;
  final List<String> tags;
  final Reactions? reactions;
  final int? views;
  final int? userId;

  Post({
    required this.id,
    this.title,
    this.body,
    this.tags = const [],
    this.reactions,
    this.views,
    this.userId,
  });
}

class Reactions {
  final int? likes;
  final int? dislikes;

  Reactions({this.likes, this.dislikes});
}
