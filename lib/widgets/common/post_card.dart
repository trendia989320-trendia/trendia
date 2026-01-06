import 'package:flutter/material.dart';
import '../../config/app_theme.dart';
import '../../data/models/models_index.dart';

// ============ PREMIUM POST CARD ============
class PremiumPostCard extends StatelessWidget {
  final Post post;
  final VoidCallback onLike;
  final VoidCallback onComment;
  final VoidCallback onShare;

  const PremiumPostCard({
    Key? key,
    required this.post,
    required this.onLike,
    required this.onComment,
    required this.onShare,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.lightCard,
        border: Border(
          bottom: BorderSide(color: AppColors.lightBorder, width: 1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with background section
          Container(
            color: AppColors.lightBg,
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: AppColors.lightDivider,
                  child: Text(
                    post.author.avatar,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.author.username,
                      style: AppTypography.body.copyWith(
                        color: AppColors.lightText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      _getTimeAgo(post.createdAt),
                      style: AppTypography.captionSmall.copyWith(
                        color: AppColors.lightSecondaryText,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  icon: Icon(
                    Icons.more_vert,
                    color: AppColors.lightSecondaryText,
                    size: 20,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),

          // Content
          Container(
            height: 400,
            color: AppColors.lightDivider,
            child: Center(
              child: Icon(
                post.type == PostType.fun
                    ? Icons.play_circle_filled_outlined
                    : Icons.school_outlined,
                color: AppColors.lightSecondaryText,
                size: 60,
              ),
            ),
          ),

          // Actions with background section
          Container(
            color: AppColors.lightCard,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: ShaderMask(
                        shaderCallback: (bounds) => LinearGradient(
                          colors: post.isLiked
                              ? [AppColors.learnColor, AppColors.funColor]
                              : [
                                  AppColors.lightSecondaryText,
                                  AppColors.lightSecondaryText,
                                ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(bounds),
                        child: Icon(
                          post.isLiked ? Icons.favorite : Icons.favorite_border,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      onPressed: onLike,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.chat_bubble_outline,
                        color: AppColors.lightSecondaryText,
                        size: 24,
                      ),
                      onPressed: onComment,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.send_outlined,
                        color: AppColors.lightSecondaryText,
                        size: 24,
                      ),
                      onPressed: onShare,
                    ),
                    const Spacer(),
                    IconButton(
                      icon: Icon(
                        Icons.bookmark_border,
                        color: AppColors.lightSecondaryText,
                        size: 24,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),

                // Likes
                Text(
                  '${post.likes} likes',
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.lightText,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),

                // Caption
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: post.author.username,
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.lightText,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextSpan(text: ' '),
                      TextSpan(
                        text: post.description.length > 100
                            ? '${post.description.substring(0, 100)}...'
                            : post.description,
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.lightText,
                        ),
                      ),
                    ],
                  ),
                ),

                // Comments
                if (post.comments > 0)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      'View all ${post.comments} comments',
                      style: AppTypography.captionSmall.copyWith(
                        color: AppColors.lightSecondaryText,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return '${(difference.inDays / 7).floor()}w ago';
    }
  }
}
