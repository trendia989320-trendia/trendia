import 'user_model.dart';

/// Chat Model
/// Represents a conversation between users
class Chat {
  final String id;
  final User user;
  final String lastMessage;
  final DateTime timestamp;
  final int unreadCount;

  Chat({
    required this.id,
    required this.user,
    required this.lastMessage,
    required this.timestamp,
    required this.unreadCount,
  });
}

/// Message Model
/// Represents a single message in a chat
class Message {
  final String id;
  final User sender;
  final String content;
  final DateTime timestamp;
  final bool isRead;

  Message({
    required this.id,
    required this.sender,
    required this.content,
    required this.timestamp,
    required this.isRead,
  });
}
