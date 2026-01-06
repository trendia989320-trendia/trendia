import '../models/models_index.dart';
import 'users_mock.dart';

/// Mock Posts Data Service
/// Contains static mock data for posts/content
class MockPostsData {
  static final List<Post> mockPosts = [
    // Learn Reels
    Post(
      id: '1',
      author: MockUsersData.mockUsers[0],
      title: 'Flutter Basics',
      description: '',
      imageUrl: null,
      type: PostType.learn,
      likes: 523,
      comments: 87,
      shares: 45,
      createdAt: DateTime.now().subtract(const Duration(hours: 2)),
      isLiked: false,
    ),
    Post(
      id: '2',
      author: MockUsersData.mockUsers[1],
      title: 'Web Development',
      description: '',
      imageUrl: null,
      type: PostType.learn,
      likes: 892,
      comments: 156,
      shares: 203,
      createdAt: DateTime.now().subtract(const Duration(hours: 5)),
      isLiked: false,
    ),
    Post(
      id: '3',
      author: MockUsersData.mockUsers[2],
      title: 'Machine Learning Guide',
      description: '',
      imageUrl: null,
      type: PostType.learn,
      likes: 1245,
      comments: 234,
      shares: 567,
      createdAt: DateTime.now().subtract(const Duration(hours: 8)),
      isLiked: false,
    ),
    Post(
      id: '4',
      author: MockUsersData.mockUsers[3],
      title: 'State Management',
      description: '',
      imageUrl: null,
      type: PostType.learn,
      likes: 2450,
      comments: 345,
      shares: 1200,
      createdAt: DateTime.now().subtract(const Duration(hours: 12)),
      isLiked: false,
    ),
    // Fun Reels
    Post(
      id: '5',
      author: MockUsersData.mockUsers[0],
      title: 'When you finally fix the bug',
      description: 'Finally! 🎉',
      imageUrl: null,
      type: PostType.fun,
      likes: 3200,
      comments: 456,
      shares: 789,
      createdAt: DateTime.now().subtract(const Duration(hours: 3)),
      isLiked: false,
    ),
    Post(
      id: '6',
      author: MockUsersData.mockUsers[1],
      title: 'Stack overflow at 3 AM',
      description: 'The struggle is real 😅',
      imageUrl: null,
      type: PostType.fun,
      likes: 2890,
      comments: 234,
      shares: 567,
      createdAt: DateTime.now().subtract(const Duration(hours: 6)),
      isLiked: false,
    ),
  ];
}
