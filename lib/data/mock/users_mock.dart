import '../models/models_index.dart';

/// Mock Users Data Service
/// Contains static mock data for users in the application
class MockUsersData {
  static final List<User> mockUsers = [
    User(
      id: '1',
      name: 'John Doe',
      username: '@johndoe',
      avatar: '👨',
      bio: 'Flutter Developer | Love to Learn & Share',
      followers: 2450,
      following: 580,
      learnScore: 4250,
      timeSpent: 125.5,
    ),
    User(
      id: '2',
      name: 'Sarah Ahmed',
      username: '@sarahcodes',
      avatar: '👩',
      bio: 'Web Designer | Entrepreneur',
      followers: 3200,
      following: 420,
      learnScore: 5680,
      timeSpent: 182.3,
    ),
    User(
      id: '3',
      name: 'Raj Patel',
      username: '@rajpatel',
      avatar: '🧑',
      bio: 'Data Scientist | ML Enthusiast',
      followers: 1950,
      following: 650,
      learnScore: 6420,
      timeSpent: 210.8,
    ),
    User(
      id: '4',
      name: 'Emma Wilson',
      username: '@emmaw',
      avatar: '👩‍🦰',
      bio: 'Content Creator | Life Coach',
      followers: 4100,
      following: 220,
      learnScore: 7200,
      timeSpent: 245.2,
    ),
  ];
}
