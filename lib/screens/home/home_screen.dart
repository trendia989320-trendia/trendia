import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import '../../config/app_theme.dart';
import '../../data/models/models_index.dart';
import '../../data/mock/mock_data_index.dart';
import '../../widgets/common/post_card.dart';
import '../notifications/notification_screen.dart';
import '../messaging/chat_list_screen.dart';

// ============ HOME SCREEN V2 ============
class HomeScreenV2 extends StatefulWidget {
  const HomeScreenV2({Key? key}) : super(key: key);

  @override
  State<HomeScreenV2> createState() => _HomeScreenV2State();
}

class _HomeScreenV2State extends State<HomeScreenV2> {
  late List<Post> _posts;
  late List<User> _stories;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _posts = MockPostsData.mockPosts
        .map(
          (p) => Post(
            id: p.id,
            author: p.author,
            title: p.title,
            description: p.description,
            imageUrl: p.imageUrl,
            type: p.type,
            likes: p.likes,
            comments: p.comments,
            shares: p.shares,
            createdAt: p.createdAt,
            isLiked: false,
          ),
        )
        .toList();

    _stories = MockUsersData.mockUsers;
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildStoryCircle(User user) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Container(
            width: 85,
            height: 85,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 0, 0, 0),
                  const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsets.all(3),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.lightCard,
                border: Border.all(color: AppColors.lightCard, width: 3),
              ),
              child: CircleAvatar(
                backgroundColor: AppColors.lightDivider,
                child: Text(user.avatar, style: const TextStyle(fontSize: 24)),
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: 85,
            child: Text(
              user.username.length > 8
                  ? '${user.username.substring(0, 8)}..'
                  : user.username,
              style: AppTypography.caption.copyWith(
                color: AppColors.lightText,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddStory() {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Container(
            width: 85,
            height: 85,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
              border: Border.all(color: Colors.black, width: 1),
            ),
            child: const Icon(Icons.add, color: Color(0xFF1F1F1F), size: 36),
          ),
          const SizedBox(height: 8),
          Text(
            'Your Story',
            style: AppTypography.caption.copyWith(
              color: const Color(0xFF1F1F1F),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: Stack(
        children: [
          // Scrollable Content (Behind Fixed Header)
          RefreshIndicator(
            onRefresh: () async {
              await Future.delayed(const Duration(seconds: 1));
            },
            child: ListView(
              controller: _scrollController,
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 80,
              ),
              children: [
                // Stories Section
                Container(
                  height: 135,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 8,
                  ),
                  color: const Color(0xFFFAFAFA),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildAddStory(),
                      ..._stories.map(_buildStoryCircle),
                    ],
                  ),
                ),

                // Posts - Full Screen
                ..._posts.map(
                  (post) => PremiumPostCard(
                    post: post,
                    onLike: () {
                      setState(() {
                        post.isLiked = !post.isLiked;
                      });
                    },
                    onComment: () {
                      // Handle comment
                    },
                    onShare: () {
                      // Handle share
                    },
                  ),
                ),
              ],
            ),
          ),
          // Fixed Header at Top
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              color: const Color(0xFFFAFAFA),
              child: SafeArea(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Dynamic Island Container
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            const Color.fromARGB(255, 155, 255, 194),
                            const Color.fromARGB(255, 141, 223, 255),
                            const Color.fromARGB(255, 172, 137, 255),
                            const Color.fromARGB(255, 251, 148, 255),
                          ],
                        ),
                        border: Border.all(
                          color: const Color(0xFF1F1F1F).withOpacity(0.08),
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.06),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Text(
                            'Trendia',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF1F1F1F),
                              letterSpacing: 1.2,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      ),
                    ),
                    // Left and Right Content (Overlaid on Island)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Points Badge (Left)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xFFFFD700).withOpacity(0.15),
                              border: Border.all(
                                color: const Color(0xFFFFD700).withOpacity(0.3),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Color(0xFFFFD700),
                                  size: 14,
                                ),
                                const SizedBox(width: 4),
                                ShaderMask(
                                  shaderCallback: (bounds) => LinearGradient(
                                    colors: [
                                      const Color(0xFFFFD700),
                                      const Color(0xFFFFA500),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ).createShader(bounds),
                                  child: Text(
                                    '2850',
                                    style: GoogleFonts.outfit(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Right Action Icons
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.water_drop_outlined,
                                  size: 20,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const NotificationScreenV2(),
                                    ),
                                  );
                                },
                                color: const Color.fromARGB(255, 0, 0, 0),
                                constraints: const BoxConstraints(
                                  minWidth: 36,
                                  minHeight: 36,
                                ),
                                padding: EdgeInsets.zero,
                              ),
                              const SizedBox(width: 4),
                              IconButton(
                                icon: const Icon(
                                  Icons.message_outlined,
                                  size: 20,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ChatScreenV2(),
                                    ),
                                  );
                                },
                                color: const Color.fromARGB(255, 0, 0, 0),
                                constraints: const BoxConstraints(
                                  minWidth: 36,
                                  minHeight: 36,
                                ),
                                padding: EdgeInsets.zero,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
