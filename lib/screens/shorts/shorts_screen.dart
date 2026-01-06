import 'package:flutter/material.dart';
import 'dart:ui';
import '../../config/app_theme.dart';
import '../../data/models/models_index.dart';

// ============ SHOTS SCREEN V2 ============
class ShotsScreenV2 extends StatefulWidget {
  final VoidCallback? onBack;

  const ShotsScreenV2({Key? key, this.onBack}) : super(key: key);

  @override
  State<ShotsScreenV2> createState() => _ShotsScreenV2State();
}

class _ShotsScreenV2State extends State<ShotsScreenV2>
    with TickerProviderStateMixin {
  late List<Post> _funReels;
  late List<Post> _learnReels;
  bool _isFunSelected = true;
  late AnimationController _animationController;

  final List<Map<String, dynamic>> _funData = [
    {
      'emoji': '🚀',
      'username': '@coder_life',
      'title': 'When you finally fix the bug',
      'likes': 1240,
      'comments': 89,
      'shares': 456,
    },
    {
      'emoji': '💻',
      'username': '@dev_vibes',
      'title': 'Stack overflow at 3 AM',
      'likes': 2100,
      'comments': 156,
      'shares': 782,
    },
    {
      'emoji': '🎮',
      'username': '@game_dev_bro',
      'title': 'Building games is hard',
      'likes': 890,
      'comments': 67,
      'shares': 345,
    },
    {
      'emoji': '🔥',
      'username': '@tech_memes',
      'title': 'JavaScript be like...',
      'likes': 3500,
      'comments': 234,
      'shares': 1200,
    },
    {
      'emoji': '😂',
      'username': '@debug_life',
      'title': 'Console.log debugging',
      'likes': 1670,
      'comments': 120,
      'shares': 590,
    },
    {
      'emoji': '🎯',
      'username': '@startup_fail',
      'title': 'My startup in 2 days',
      'likes': 2340,
      'comments': 198,
      'shares': 875,
    },
  ];

  final List<Map<String, dynamic>> _learnData = [
    {
      'emoji': '📚',
      'username': '@learn_flutter',
      'title': 'Flutter Widget Tree Basics',
      'likes': 2890,
      'comments': 145,
      'shares': 678,
    },
    {
      'emoji': '🎓',
      'username': '@web_dev_pro',
      'title': 'React Hooks Explained',
      'likes': 3420,
      'comments': 267,
      'shares': 1045,
    },
    {
      'emoji': '💡',
      'username': '@code_mastery',
      'title': 'Clean Code Principles',
      'likes': 4100,
      'comments': 312,
      'shares': 1456,
    },
    {
      'emoji': '🔐',
      'username': '@security_tips',
      'title': 'API Security Best Practices',
      'likes': 2780,
      'comments': 189,
      'shares': 823,
    },
    {
      'emoji': '⚡',
      'username': '@performance',
      'title': 'Optimize Your Code',
      'likes': 3560,
      'comments': 234,
      'shares': 934,
    },
    {
      'emoji': '🎨',
      'username': '@ui_design_pro',
      'title': 'Material Design 3 Guide',
      'likes': 3890,
      'comments': 278,
      'shares': 1123,
    },
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _funReels = _funData
        .map(
          (data) => Post(
            id: _funData.indexOf(data).toString(),
            author: User(
              id: _funData.indexOf(data).toString(),
              name: data['username'],
              username: data['username'],
              avatar: data['emoji'],
              bio: 'Content Creator',
              followers: 1000,
              following: 500,
              learnScore: 0,
              timeSpent: 0,
            ),
            title: data['title'],
            description: data['title'],
            imageUrl: data['emoji'],
            type: PostType.fun,
            likes: data['likes'],
            comments: data['comments'],
            shares: data['shares'],
            createdAt: DateTime.now(),
            isLiked: false,
          ),
        )
        .toList();

    _learnReels = _learnData
        .map(
          (data) => Post(
            id: _learnData.indexOf(data).toString(),
            author: User(
              id: _learnData.indexOf(data).toString(),
              name: data['username'],
              username: data['username'],
              avatar: data['emoji'],
              bio: 'Educator',
              followers: 2000,
              following: 300,
              learnScore: 1000,
              timeSpent: 100,
            ),
            title: data['title'],
            description: data['title'],
            imageUrl: data['emoji'],
            type: PostType.learn,
            likes: data['likes'],
            comments: data['comments'],
            shares: data['shares'],
            createdAt: DateTime.now(),
            isLiked: false,
          ),
        )
        .toList();
  }

  Widget _buildReelItem(Post post, bool isFun) {
    bool _isPlaying = true;

    return StatefulBuilder(
      builder: (context, setState) => Container(
        color: AppColors.lightBg,
        child: Stack(
          children: [
            // Background Gradient - Light theme
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.lightCard,
                    AppColors.lightBg,
                    AppColors.lightDivider,
                  ],
                ),
              ),
            ),

            // Main Content Column
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                // Spacer Top
                const Spacer(flex: 3),

                // Center Content - Emoji with Tap Area
                GestureDetector(
                  onTap: () => setState(() => _isPlaying = !_isPlaying),
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.learnColor.withOpacity(0.1),
                      border: Border.all(
                        color: AppColors.learnColor.withOpacity(0.3),
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        post.imageUrl ?? '🎬',
                        style: const TextStyle(fontSize: 64),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Caption
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 80, 0),
                  child: Text(
                    post.description,
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.lightText,
                      fontSize: 14,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                // Spacer Bottom
                const Spacer(flex: 1),

                // Profile Section - At Bottom
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.lightDivider,
                          border: Border.all(
                            color: AppColors.lightBorder,
                            width: 1.5,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            post.author.avatar,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              post.author.username,
                              style: AppTypography.subtitle2.copyWith(
                                color: AppColors.lightText,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '${post.author.followers}K followers',
                              style: AppTypography.captionSmall.copyWith(
                                color: AppColors.lightSecondaryText,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.learnColor,
                              border: Border.all(
                                color: AppColors.learnColor.withOpacity(0.5),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Follow',
                              style: AppTypography.captionSmall.copyWith(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Song Info - Bottom (Instagram Style)
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.lightCard.withOpacity(0.95),
                        border: Border(
                          top: BorderSide(
                            color: AppColors.lightBorder,
                            width: 1,
                          ),
                        ),
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      child: SafeArea(
                        top: false,
                        child: Row(
                          children: [
                            Icon(
                              Icons.music_note_rounded,
                              color: AppColors.learnColor,
                              size: 12,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                isFun
                                    ? 'Tech Vibes Mix • Original'
                                    : 'Learning Symphony • Original',
                                style: AppTypography.captionSmall.copyWith(
                                  color: AppColors.lightText,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(width: 8),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 10,
                                  sigmaY: 10,
                                ),
                                child: Container(
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black.withOpacity(0.1),
                                    border: Border.all(
                                      color: Colors.black.withOpacity(0.15),
                                      width: 1,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.add_rounded,
                                    color: Colors.black,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Right Side Actions
            Positioned(
              right: 16,
              top: 0,
              bottom: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildVerticalAction(Icons.favorite_rounded, post.likes),
                  const SizedBox(height: 24),
                  _buildVerticalAction(Icons.message_rounded, post.comments),
                  const SizedBox(height: 24),
                  _buildVerticalAction(Icons.reply_rounded, post.shares),
                  const SizedBox(height: 24),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.lightCard.withOpacity(0.9),
                          border: Border.all(
                            color: AppColors.lightBorder,
                            width: 1,
                          ),
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.bookmark_outline_rounded,
                            color: AppColors.learnColor,
                            size: 22,
                          ),
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVerticalAction(IconData icon, int count) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.lightCard.withOpacity(0.9),
                border: Border.all(
                  color: AppColors.lightBorder,
                  width: 1,
                ),
              ),
              child: IconButton(
                icon: Icon(icon, color: AppColors.learnColor, size: 22),
                onPressed: () {},
                padding: EdgeInsets.zero,
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          _formatNumber(count),
          style: AppTypography.captionSmall.copyWith(
            color: AppColors.lightText,
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  String _formatNumber(int number) {
    if (number >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(1)}M';
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}K';
    }
    return number.toString();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentReels = _isFunSelected ? _funReels : _learnReels;

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            transitionBuilder: (child, animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: PageView.builder(
              key: ValueKey<bool>(_isFunSelected),
              scrollDirection: Axis.vertical,
              itemCount: currentReels.length,
              itemBuilder: (context, index) =>
                  _buildReelItem(currentReels[index], _isFunSelected),
            ),
          ),
          // Fixed Top Bar - Positioned at Top
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Back Button - Left
                    Align(
                      alignment: Alignment.centerLeft,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                          child: Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.lightCard.withOpacity(0.9),
                              border: Border.all(
                                color: AppColors.lightBorder,
                                width: 1,
                              ),
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_back_rounded,
                                color: Colors.black,
                                size: 20,
                              ),
                              onPressed: widget.onBack,
                              padding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Fun/Learn Toggle - Center
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _animationController.forward(from: 0);
                            setState(() => _isFunSelected = true);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: _isFunSelected
                                      ? AppColors.funColor
                                      : AppColors.lightCard.withOpacity(0.8),
                                  border: Border.all(
                                    color: _isFunSelected
                                        ? AppColors.funColor.withOpacity(0.6)
                                        : AppColors.lightBorder,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  'Fun',
                                  style: AppTypography.subtitle2.copyWith(
                                    color: _isFunSelected
                                        ? Colors.white
                                        : AppColors.lightText,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        GestureDetector(
                          onTap: () {
                            _animationController.forward(from: 0);
                            setState(() => _isFunSelected = false);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: !_isFunSelected
                                      ? AppColors.learnColor
                                      : AppColors.lightCard.withOpacity(0.8),
                                  border: Border.all(
                                    color: !_isFunSelected
                                        ? AppColors.learnColor.withOpacity(0.6)
                                        : AppColors.lightBorder,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  'Learn',
                                  style: AppTypography.subtitle2.copyWith(
                                    color: !_isFunSelected
                                        ? Colors.white
                                        : AppColors.lightText,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
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
        ],
      ),
    );
  }
}




