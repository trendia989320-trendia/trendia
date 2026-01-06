import 'user_model.dart';

/// Post Type Enum
enum PostType { fun, learn }

/// Post Model
/// Represents a post/content in the Trendia application
class Post {
  final String id;
  final User author;
  final String title;
  final String description;
  final String? imageUrl;
  final PostType type;
  final int likes;
  final int comments;
  final int shares;
  final DateTime createdAt;
  bool isLiked;

  Post({
    required this.id,
    required this.author,
    required this.title,
    required this.description,
    this.imageUrl,
    required this.type,
    required this.likes,
    required this.comments,
    required this.shares,
    required this.createdAt,
    this.isLiked = false,
  });
}
