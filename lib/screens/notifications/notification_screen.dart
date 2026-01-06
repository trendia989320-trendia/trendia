import 'package:flutter/material.dart';
import '../../config/app_theme.dart';

// ============ NOTIFICATION SCREEN (INSTAGRAM STYLE) ============
class NotificationScreenV2 extends StatefulWidget {
  const NotificationScreenV2({Key? key}) : super(key: key);

  @override
  State<NotificationScreenV2> createState() => _NotificationScreenV2State();
}

class _NotificationScreenV2State extends State<NotificationScreenV2> {
  final List<Map<String, dynamic>> _notifications = [
    {
      'avatar': '👨',
      'name': '@johndoe',
      'action': 'liked your post',
      'postImage': '🎬',
      'timestamp': '2m ago',
      'icon': Icons.favorite_rounded,
      'color': Colors.red,
    },
    {
      'avatar': '👩',
      'name': '@sarahcodes',
      'action': 'started following you',
      'postImage': null,
      'timestamp': '15m ago',
      'icon': Icons.person_add_rounded,
      'color': Colors.blue,
    },
    {
      'avatar': '🧑',
      'name': '@rajpatel',
      'action': 'commented: Amazing work!',
      'postImage': '📚',
      'timestamp': '1h ago',
      'icon': Icons.message_rounded,
      'color': Colors.cyan,
    },
    {
      'avatar': '👩‍🦰',
      'name': '@emmaw',
      'action': 'shared your video',
      'postImage': '🚀',
      'timestamp': '3h ago',
      'icon': Icons.share_rounded,
      'color': Colors.green,
    },
    {
      'avatar': '🧑',
      'name': '@dev_vibes',
      'action': 'viewed your story',
      'postImage': null,
      'timestamp': '5h ago',
      'icon': Icons.visibility_rounded,
      'color': Colors.purple,
    },
    {
      'avatar': '👨',
      'name': '@coder_life',
      'action': 'liked your post',
      'postImage': '💻',
      'timestamp': '8h ago',
      'icon': Icons.favorite_rounded,
      'color': Colors.red,
    },
    {
      'avatar': '👩',
      'name': '@tech_queen',
      'action': 'started following you',
      'postImage': null,
      'timestamp': '10h ago',
      'icon': Icons.person_add_rounded,
      'color': Colors.blue,
    },
    {
      'avatar': '🧑',
      'name': '@web_master',
      'action': 'commented: Love this! 🔥',
      'postImage': '🌐',
      'timestamp': '12h ago',
      'icon': Icons.message_rounded,
      'color': Colors.cyan,
    },
    {
      'avatar': '👨‍💼',
      'name': '@startup_hero',
      'action': 'shared your reel',
      'postImage': '📊',
      'timestamp': '1d ago',
      'icon': Icons.share_rounded,
      'color': Colors.green,
    },
    {
      'avatar': '👩‍💻',
      'name': '@flutter_dev',
      'action': 'viewed your story',
      'postImage': null,
      'timestamp': '1d ago',
      'icon': Icons.visibility_rounded,
      'color': Colors.purple,
    },
    {
      'avatar': '🧑‍🎨',
      'name': '@design_ninja',
      'action': 'liked your post',
      'postImage': '🎨',
      'timestamp': '2d ago',
      'icon': Icons.favorite_rounded,
      'color': Colors.red,
    },
    {
      'avatar': '👩‍🔬',
      'name': '@data_scientist',
      'action': 'started following you',
      'postImage': null,
      'timestamp': '2d ago',
      'icon': Icons.person_add_rounded,
      'color': Colors.blue,
    },
    {
      'avatar': '🧑‍🚀',
      'name': '@rocket_dev',
      'action': 'commented: Incredible!',
      'postImage': '🚀',
      'timestamp': '2d ago',
      'icon': Icons.message_rounded,
      'color': Colors.cyan,
    },
    {
      'avatar': '👨‍⚕️',
      'name': '@health_tech',
      'action': 'shared your video',
      'postImage': '❤️',
      'timestamp': '3d ago',
      'icon': Icons.share_rounded,
      'color': Colors.green,
    },
    {
      'avatar': '👩‍🏫',
      'name': '@education_pro',
      'action': 'viewed your story',
      'postImage': null,
      'timestamp': '3d ago',
      'icon': Icons.visibility_rounded,
      'color': Colors.purple,
    },
    {
      'avatar': '🧑‍🍳',
      'name': '@foodtech_guru',
      'action': 'liked your post',
      'postImage': '🍔',
      'timestamp': '4d ago',
      'icon': Icons.favorite_rounded,
      'color': Colors.red,
    },
    {
      'avatar': '👩‍💼',
      'name': '@business_coach',
      'action': 'started following you',
      'postImage': null,
      'timestamp': '4d ago',
      'icon': Icons.person_add_rounded,
      'color': Colors.blue,
    },
    {
      'avatar': '🧑‍💻',
      'name': '@code_wizard',
      'action': 'commented: Perfect code!',
      'postImage': '⚡',
      'timestamp': '4d ago',
      'icon': Icons.message_rounded,
      'color': Colors.cyan,
    },
    {
      'avatar': '👨‍🎬',
      'name': '@video_creator',
      'action': 'shared your reel',
      'postImage': '🎥',
      'timestamp': '5d ago',
      'icon': Icons.share_rounded,
      'color': Colors.green,
    },
    {
      'avatar': '👩‍🎤',
      'name': '@music_artist',
      'action': 'viewed your story',
      'postImage': null,
      'timestamp': '5d ago',
      'icon': Icons.visibility_rounded,
      'color': Colors.purple,
    },
    {
      'avatar': '🧑‍✈️',
      'name': '@travel_blogger',
      'action': 'liked your post',
      'postImage': '✈️',
      'timestamp': '6d ago',
      'icon': Icons.favorite_rounded,
      'color': Colors.red,
    },
    {
      'avatar': '👨‍🏋️',
      'name': '@fitness_guru',
      'action': 'started following you',
      'postImage': null,
      'timestamp': '6d ago',
      'icon': Icons.person_add_rounded,
      'color': Colors.blue,
    },
    {
      'avatar': '👩‍🌾',
      'name': '@eco_warrior',
      'action': 'commented: Great initiative!',
      'postImage': '🌱',
      'timestamp': '6d ago',
      'icon': Icons.message_rounded,
      'color': Colors.cyan,
    },
    {
      'avatar': '🧑‍🎓',
      'name': '@research_scholar',
      'action': 'shared your post',
      'postImage': '📖',
      'timestamp': '1w ago',
      'icon': Icons.share_rounded,
      'color': Colors.green,
    },
    {
      'avatar': '👩‍🔧',
      'name': '@devops_expert',
      'action': 'viewed your story',
      'postImage': null,
      'timestamp': '1w ago',
      'icon': Icons.visibility_rounded,
      'color': Colors.purple,
    },
    {
      'avatar': '🧑‍💡',
      'name': '@innovation_hub',
      'action': 'liked your post',
      'postImage': '💡',
      'timestamp': '1w ago',
      'icon': Icons.favorite_rounded,
      'color': Colors.red,
    },
    {
      'avatar': '👨‍🎨',
      'name': '@creative_mind',
      'action': 'started following you',
      'postImage': null,
      'timestamp': '1w ago',
      'icon': Icons.person_add_rounded,
      'color': Colors.blue,
    },
    {
      'avatar': '👩‍💰',
      'name': '@finance_expert',
      'action': 'commented: Useful tips!',
      'postImage': '💰',
      'timestamp': '1w ago',
      'icon': Icons.message_rounded,
      'color': Colors.cyan,
    },
    {
      'avatar': '🧑‍🏢',
      'name': '@corporate_leader',
      'action': 'shared your reel',
      'postImage': '🏢',
      'timestamp': '2w ago',
      'icon': Icons.share_rounded,
      'color': Colors.green,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: AppColors.lightCard,
        elevation: 0,
        title: Text(
          'Activity',
          style: AppTypography.heading3.copyWith(
            color: AppColors.lightText,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        itemCount: _notifications.length,
        itemBuilder: (context, index) {
          final notif = _notifications[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 8,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Avatar with Status
                      Stack(
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black.withOpacity(0.1),
                              border: Border.all(
                                color: Colors.black.withOpacity(0.2),
                                width: 1,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                notif['avatar'],
                                style: const TextStyle(fontSize: 22),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                              width: 14,
                              height: 14,
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
                      // Notification Content
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: notif['name'],
                                    style: AppTypography.subtitle2.copyWith(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' ${notif['action']}',
                                    style: AppTypography.bodySmall.copyWith(
                                      color: Colors.black87,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              notif['timestamp'],
                              style: AppTypography.captionSmall.copyWith(
                                color: Colors.black87,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}




