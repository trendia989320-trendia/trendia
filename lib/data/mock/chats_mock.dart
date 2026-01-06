/// Mock Chat Data
/// Contains static chat and message data for messaging feature
class MockChatsData {
  static final List<Map<String, dynamic>> chats = [
    {
      'avatar': '👨',
      'name': '@johndoe',
      'lastMessage': 'That sounds great! Let me know 🎉',
      'timestamp': 'now',
      'unread': 2,
      'online': true,
    },
    {
      'avatar': '👩',
      'name': '@sarahcodes',
      'lastMessage': 'I loved your latest video 💯',
      'timestamp': '5m',
      'unread': 0,
      'online': true,
    },
    {
      'avatar': '🧑',
      'name': '@rajpatel',
      'lastMessage': 'Can we collaborate on the project?',
      'timestamp': '12m',
      'unread': 1,
      'online': false,
    },
    {
      'avatar': '👩‍🦰',
      'name': '@emmaw',
      'lastMessage': 'See you at the event tomorrow! 📅',
      'timestamp': '2h',
      'unread': 0,
      'online': true,
    },
    {
      'avatar': '🧑',
      'name': '@dev_vibes',
      'lastMessage': 'Thanks for the feedback!',
      'timestamp': '5h',
      'unread': 0,
      'online': false,
    },
    {
      'avatar': '👨',
      'name': '@coder_life',
      'lastMessage': 'Check out my new post 📱',
      'timestamp': '8h',
      'unread': 3,
      'online': true,
    },
    {
      'avatar': '👩',
      'name': '@tech_queen',
      'lastMessage': 'Let\'s grab coffee soon ☕',
      'timestamp': '10h',
      'unread': 0,
      'online': false,
    },
    {
      'avatar': '🧑',
      'name': '@web_master',
      'lastMessage': 'Your design is amazing! 🎨',
      'timestamp': '12h',
      'unread': 1,
      'online': true,
    },
  ];

  static final List<Map<String, dynamic>> chatMessages = [
    {'isMe': false, 'message': 'Hey! How are you? 👋', 'timestamp': '10:30 AM'},
    {
      'isMe': true,
      'message': 'Hey! I\'m doing great! How about you?',
      'timestamp': '10:31 AM',
    },
    {
      'isMe': false,
      'message': 'Pretty good! Just finished a new project 🎉',
      'timestamp': '10:32 AM',
    },
    {
      'isMe': false,
      'message': 'Would love to hear your thoughts on it',
      'timestamp': '10:32 AM',
    },
    {
      'isMe': true,
      'message': 'That\'s amazing! Tell me more about it 📱',
      'timestamp': '10:33 AM',
    },
    {
      'isMe': false,
      'message': 'It\'s a Flutter app with dark theme and amazing UI 🚀',
      'timestamp': '10:34 AM',
    },
    {
      'isMe': true,
      'message': 'Wow! Sounds incredible! Can I check it out?',
      'timestamp': '10:35 AM',
    },
    {
      'isMe': false,
      'message': 'Sure! Let\'s have a video call to discuss it',
      'timestamp': '10:36 AM',
    },
    {
      'isMe': true,
      'message': 'Perfect! When are you free?',
      'timestamp': '10:37 AM',
    },
    {
      'isMe': false,
      'message': 'How about tomorrow at 3 PM?',
      'timestamp': '10:38 AM',
    },
    {
      'isMe': true,
      'message': 'Sounds good! See you then! 😊',
      'timestamp': '10:39 AM',
    },
  ];

  static final List<String> datingMessages = [
    'Hey! Thanks for the rose 🌹',
    'How are you doing?',
    'Would love to know more about you 💕',
    'What\'s your favorite thing to do?',
    'Let\'s grab coffee sometime ☕',
    'You seem amazing!',
    'I really enjoy talking to you 🥰',
  ];
}
