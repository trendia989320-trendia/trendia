/// Notification Type Enum
enum NotificationType { like, comment, follow, share, mention }

/// Notification Model
/// Represents a notification in the application
class AppNotification {
  final String id;
  final String title;
  final String message;
  final DateTime timestamp;
  final NotificationType type;
  bool isRead;

  AppNotification({
    required this.id,
    required this.title,
    required this.message,
    required this.timestamp,
    required this.type,
    this.isRead = false,
  });
}
