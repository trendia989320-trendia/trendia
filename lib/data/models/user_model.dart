/// User Model
/// Represents a user in the Trendia application
class User {
  final String id;
  final String name;
  final String username;
  final String avatar;
  final String bio;
  final int followers;
  final int following;
  final int learnScore;
  final double timeSpent;
  final bool datingEnabled;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.avatar,
    required this.bio,
    required this.followers,
    required this.following,
    required this.learnScore,
    required this.timeSpent,
    this.datingEnabled = false,
  });
}
