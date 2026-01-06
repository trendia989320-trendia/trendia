import 'package:flutter/material.dart';
import '../../config/app_theme.dart';
import 'chat_detail_screen.dart';
import '../explore/dating_screen.dart';

// ============ CHAT SCREEN (WHATSAPP/INSTAGRAM STYLE) ============
class ChatScreenV2 extends StatefulWidget {
  const ChatScreenV2({Key? key}) : super(key: key);

  @override
  State<ChatScreenV2> createState() => _ChatScreenV2State();
}

class _ChatScreenV2State extends State<ChatScreenV2> {
  late TextEditingController _searchController;

  final List<Map<String, dynamic>> _chats = [
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
    {
      'avatar': '👨‍💼',
      'name': '@startup_hero',
      'lastMessage': 'Meeting at 3 PM tomorrow?',
      'timestamp': '1d',
      'unread': 0,
      'online': false,
    },
    {
      'avatar': '👩‍💻',
      'name': '@flutter_dev',
      'lastMessage': 'Flutter 4.0 is amazing! 🚀',
      'timestamp': '1d',
      'unread': 2,
      'online': true,
    },
    {
      'avatar': '🧑‍🎨',
      'name': '@design_ninja',
      'lastMessage': 'Love your creative style!',
      'timestamp': '2d',
      'unread': 0,
      'online': true,
    },
    {
      'avatar': '👩‍🔬',
      'name': '@data_scientist',
      'lastMessage': 'Interesting dataset you shared',
      'timestamp': '2d',
      'unread': 1,
      'online': false,
    },
    {
      'avatar': '🧑‍🚀',
      'name': '@rocket_dev',
      'lastMessage': 'When are you free? 📞',
      'timestamp': '2d',
      'unread': 0,
      'online': true,
    },
    {
      'avatar': '👨‍⚕️',
      'name': '@health_tech',
      'lastMessage': 'Your health app is great! 💪',
      'timestamp': '3d',
      'unread': 2,
      'online': false,
    },
    {
      'avatar': '👩‍🏫',
      'name': '@education_pro',
      'lastMessage': 'Can I feature your course?',
      'timestamp': '3d',
      'unread': 0,
      'online': true,
    },
    {
      'avatar': '🧑‍🍳',
      'name': '@foodtech_guru',
      'lastMessage': 'Awesome food photography! 📸',
      'timestamp': '4d',
      'unread': 1,
      'online': false,
    },
    {
      'avatar': '👩‍💼',
      'name': '@business_coach',
      'lastMessage': 'Let\'s discuss your startup',
      'timestamp': '4d',
      'unread': 3,
      'online': true,
    },
    {
      'avatar': '🧑‍💻',
      'name': '@code_wizard',
      'lastMessage': 'That solution is brilliant! ⚡',
      'timestamp': '4d',
      'unread': 0,
      'online': false,
    },
    {
      'avatar': '👨‍🎬',
      'name': '@video_creator',
      'lastMessage': 'Your editing skills are top-notch',
      'timestamp': '5d',
      'unread': 2,
      'online': true,
    },
    {
      'avatar': '👩‍🎤',
      'name': '@music_artist',
      'lastMessage': 'Love your musical journey 🎵',
      'timestamp': '5d',
      'unread': 0,
      'online': false,
    },
    {
      'avatar': '🧑‍✈️',
      'name': '@travel_blogger',
      'lastMessage': 'Where should I visit next? 🌍',
      'timestamp': '6d',
      'unread': 1,
      'online': true,
    },
    {
      'avatar': '👨‍🏋️',
      'name': '@fitness_guru',
      'lastMessage': 'Keep pushing! You got this 💪',
      'timestamp': '6d',
      'unread': 0,
      'online': false,
    },
    {
      'avatar': '👩‍🌾',
      'name': '@eco_warrior',
      'lastMessage': 'Great environmental initiative!',
      'timestamp': '6d',
      'unread': 2,
      'online': true,
    },
    {
      'avatar': '🧑‍🎓',
      'name': '@research_scholar',
      'lastMessage': 'Your research paper was excellent',
      'timestamp': '1w',
      'unread': 0,
      'online': false,
    },
    {
      'avatar': '👩‍🔧',
      'name': '@devops_expert',
      'lastMessage': 'Pipeline looks good! ✅',
      'timestamp': '1w',
      'unread': 1,
      'online': true,
    },
    {
      'avatar': '🧑‍💡',
      'name': '@innovation_hub',
      'lastMessage': 'Your idea is game-changing! 🔥',
      'timestamp': '1w',
      'unread': 3,
      'online': false,
    },
    {
      'avatar': '👨‍🎨',
      'name': '@creative_mind',
      'lastMessage': 'Collaboration sounds perfect!',
      'timestamp': '1w',
      'unread': 0,
      'online': true,
    },
    {
      'avatar': '👩‍💰',
      'name': '@finance_expert',
      'lastMessage': 'Portfolio looks impressive! 📈',
      'timestamp': '1w',
      'unread': 2,
      'online': false,
    },
    {
      'avatar': '🧑‍🏢',
      'name': '@corporate_leader',
      'lastMessage': 'Let\'s sync up on the strategy',
      'timestamp': '2w',
      'unread': 0,
      'online': true,
    },
  ];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: AppColors.lightCard,
        elevation: 0,
        title: Text(
          'Messages',
          style: AppTypography.heading3.copyWith(
            color: AppColors.lightText,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt_outlined, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.people_alt, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DatingScreenV2()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.add_circle_outline, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Container(
              height: 42,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: TextField(
                controller: _searchController,
                style: AppTypography.bodySmall.copyWith(
                  color: Colors.black,
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                  hintText: 'Search messages...',
                  hintStyle: AppTypography.bodySmall.copyWith(
                    color: Colors.black87,
                    fontSize: 14,
                  ),
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: Colors.black87,
                    size: 20,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                ),
                cursorColor: Colors.black,
              ),
            ),
          ),
          // Chat List
          Expanded(
            child: ListView.separated(
              itemCount: _chats.length,
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Divider(color: Colors.black, height: 1),
              ),
              itemBuilder: (context, index) {
                final chat = _chats[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 8,
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ChatDetailScreenV2(chat: chat),
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 8,
                        ),
                        child: Row(
                          children: [
                            // Avatar with Online Status
                            Stack(
                              children: [
                                Container(
                                  width: 56,
                                  height: 56,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black.withOpacity(0.08),
                                    border: Border.all(
                                      color: Colors.black.withOpacity(0.15),
                                      width: 1,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      chat['avatar'],
                                      style: const TextStyle(fontSize: 24),
                                    ),
                                  ),
                                ),
                                if (chat['online'])
                                  Positioned(
                                    right: 0,
                                    bottom: 0,
                                    child: Container(
                                      width: 16,
                                      height: 16,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black,
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            const SizedBox(width: 12),
                            // Chat Details
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    chat['name'],
                                    style: AppTypography.subtitle2.copyWith(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    chat['lastMessage'],
                                    style: AppTypography.bodySmall.copyWith(
                                      color: Colors.black87,
                                      fontSize: 12,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            // Timestamp and Unread Badge
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  chat['timestamp'],
                                  style: AppTypography.captionSmall.copyWith(
                                    color: Colors.black87,
                                    fontSize: 11,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                if (chat['unread'] > 0)
                                  Container(
                                    width: 24,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black,
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${chat['unread']}',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}




