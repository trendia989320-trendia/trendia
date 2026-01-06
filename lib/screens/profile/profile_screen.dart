import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import '../../config/app_theme.dart';
import '../../data/models/models_index.dart';
import '../../data/mock/users_mock.dart';
import '../../data/mock/posts_mock.dart';
import '../settings/settings_screen.dart';

// ============ PROFILE SCREEN V2 ============
class ProfileScreenV2 extends StatefulWidget {
  const ProfileScreenV2({Key? key}) : super(key: key);

  @override
  State<ProfileScreenV2> createState() => _ProfileScreenV2State();
}

class _ProfileScreenV2State extends State<ProfileScreenV2>
    with SingleTickerProviderStateMixin {
  late User _currentUser;
  late TabController _tabController;
  late List<Post> _userPosts;
  String _postFilter = 'all'; // 'all', 'fun', 'learn'

  @override
  void initState() {
    super.initState();
    _currentUser = MockUsersData.mockUsers.isNotEmpty
        ? MockUsersData.mockUsers[0]
        : User(
            id: '1',
            name: 'User',
            username: 'user',
            avatar: '👤',
            bio: '',
            followers: 0,
            following: 0,
            learnScore: 0,
            timeSpent: 0,
            datingEnabled: false,
          );
    _tabController = TabController(length: 2, vsync: this);
    _userPosts = MockPostsData.mockPosts
        .where((post) => post.author.id == _currentUser.id)
        .toList();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildProfileHeader() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: const Color(0xFF1F1F1F).withOpacity(0.08),
            width: 1,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Avatar with Score Badge Below
          SizedBox(
            height: 180,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        AppColors.periwinkle.withOpacity(0.9),
                        const Color.fromARGB(255, 248, 248, 248),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.periwinkle.withOpacity(0.3),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(3),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.black87,
                      child: Text(
                        _currentUser.avatar,
                        style: const TextStyle(fontSize: 52),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 115,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFF4D648D),
                          const Color(0xFFD0E1F9),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.black.withOpacity(0.2),
                        width: 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: Color(0xFFFFD700),
                          size: 16,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '${_currentUser.learnScore}',
                          style: GoogleFonts.outfit(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // Name and Bio
          Text(
            _currentUser.name,
            style: GoogleFonts.outfit(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            _currentUser.username,
            style: GoogleFonts.outfit(
              color: Colors.black87,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            _currentUser.bio,
            textAlign: TextAlign.center,
            style: GoogleFonts.outfit(
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.w400,
              height: 1.4,
            ),
          ),

          const SizedBox(height: 16),

          // Stats Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatColumn(_userPosts.length.toString(), 'Posts'),
              _buildStatColumn(_currentUser.followers.toString(), 'Followers'),
              _buildStatColumn(_currentUser.following.toString(), 'Following'),
            ],
          ),

          const SizedBox(height: 18),

          // Action Buttons
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFF4D648D),
                        const Color(0xFFD0E1F9),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.periwinkle.withOpacity(0.3),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Edit Profile',
                      style: GoogleFonts.outfit(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.periwinkle.withOpacity(0.6),
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.periwinkle,
                    side: BorderSide.none,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Icon(
                    Icons.person_add_outlined,
                    color: AppColors.periwinkle,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.outfit(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.outfit(
            color: Colors.black87,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildPostGrid() {
    if (_userPosts.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.grid_off_outlined, size: 64, color: Colors.black87),
            const SizedBox(height: 16),
            Text(
              'No posts yet',
              style: GoogleFonts.outfit(
                color: Colors.black87,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Start sharing your learning journey!',
              style: GoogleFonts.outfit(color: Colors.black87, fontSize: 13),
            ),
          ],
        ),
      );
    }

    final funPosts = _userPosts.where((p) => p.type == PostType.fun).toList();
    final learnPosts = _userPosts
        .where((p) => p.type == PostType.learn)
        .toList();

    List<Post> displayPosts = [];
    if (_postFilter == 'fun') {
      displayPosts = funPosts;
    } else if (_postFilter == 'learn') {
      displayPosts = learnPosts;
    } else {
      displayPosts = _userPosts;
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          // Instagram-style Toggle Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black, width: 1),
              ),
              padding: const EdgeInsets.all(4),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _postFilter = 'all'),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: _postFilter == 'all'
                              ? Colors.grey[850]
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          border: _postFilter == 'all'
                              ? Border.all(
                                  color: AppColors.periwinkle.withOpacity(0.5),
                                  width: 1,
                                )
                              : null,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.grid_on_rounded,
                              color: _postFilter == 'all'
                                  ? AppColors.periwinkle
                                  : Colors.grey[500],
                              size: 18,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'All',
                              style: GoogleFonts.outfit(
                                color: _postFilter == 'all'
                                    ? Colors.white
                                    : Colors.grey[500],
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _postFilter = 'fun'),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: _postFilter == 'fun'
                              ? Colors.grey[850]
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          border: _postFilter == 'fun'
                              ? Border.all(
                                  color: AppColors.funColor.withOpacity(0.5),
                                  width: 1,
                                )
                              : null,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.videocam_outlined,
                              color: _postFilter == 'fun'
                                  ? AppColors.funColor
                                  : Colors.grey[500],
                              size: 18,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'Fun',
                              style: GoogleFonts.outfit(
                                color: _postFilter == 'fun'
                                    ? Colors.white
                                    : Colors.grey[500],
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _postFilter = 'learn'),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: _postFilter == 'learn'
                              ? Colors.grey[850]
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          border: _postFilter == 'learn'
                              ? Border.all(
                                  color: AppColors.learnColor.withOpacity(0.5),
                                  width: 1,
                                )
                              : null,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.school_outlined,
                              color: _postFilter == 'learn'
                                  ? AppColors.learnColor
                                  : Colors.grey[500],
                              size: 18,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'Learn',
                              style: GoogleFonts.outfit(
                                color: _postFilter == 'learn'
                                    ? Colors.white
                                    : Colors.grey[500],
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Posts Grid
          if (displayPosts.isEmpty)
            Padding(
              padding: const EdgeInsets.all(40),
              child: Center(
                child: Column(
                  children: [
                    Icon(
                      _postFilter == 'fun'
                          ? Icons.videocam_outlined
                          : _postFilter == 'learn'
                          ? Icons.school_outlined
                          : Icons.grid_off_outlined,
                      size: 48,
                      color: Colors.black,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      _postFilter == 'all'
                          ? 'No posts yet'
                          : 'No ${_postFilter == 'fun' ? 'fun' : 'learn'} posts yet',
                      style: GoogleFonts.outfit(
                        color: Colors.black87,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: GridView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.0,
                ),
                itemCount: displayPosts.length,
                itemBuilder: (context, index) {
                  if (index >= displayPosts.length) {
                    return const SizedBox.shrink();
                  }

                  final post = displayPosts[index];
                  final isFun = post.type == PostType.fun;

                  return ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: isFun
                              ? [
                                  const Color.fromARGB(
                                    255,
                                    0,
                                    52,
                                    87,
                                  ).withOpacity(0.15),
                                  const Color.fromARGB(
                                    255,
                                    0,
                                    52,
                                    87,
                                  ).withOpacity(0.05),
                                ]
                              : [
                                  const Color.fromARGB(
                                    255,
                                    20,
                                    106,
                                    128,
                                  ).withOpacity(0.05),
                                  const Color.fromARGB(
                                    255,
                                    20,
                                    106,
                                    128,
                                  ).withOpacity(0.05),
                                  const Color.fromARGB(
                                    255,
                                    20,
                                    106,
                                    128,
                                  ).withOpacity(0.05),
                                ],
                        ),
                        border: Border.all(
                          color: const Color(0xFF4D648D).withOpacity(0.3),
                          width: 0.5,
                        ),
                      ),
                      child: Center(
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isFun
                                ? AppColors.funColor.withOpacity(0.15)
                                : AppColors.learnColor.withOpacity(0.15),
                          ),
                          child: Center(
                            child: Icon(
                              isFun
                                  ? Icons.videocam_rounded
                                  : Icons.school_rounded,
                              color: isFun
                                  ? AppColors.funColor
                                  : AppColors.learnColor,
                              size: 24,
                            ),
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

  Widget _buildProgressContent() {
    final stats = {
      'posts': 45,
      'followers': 1230,
      'following': 560,
      'learnScore': _currentUser.learnScore,
    };

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Your Records Section
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.grey[900]!, Colors.grey[850]!],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.black.withOpacity(0.5),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Records',
                  style: GoogleFonts.outfit(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 16),

                // Fun Time Graph
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text('🎬', style: TextStyle(fontSize: 16)),
                        const SizedBox(width: 8),
                        Text(
                          'Fun Time This Week',
                          style: GoogleFonts.outfit(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '12h 30m',
                          style: GoogleFonts.outfit(
                            color: AppColors.funColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    _buildWeeklyChart([
                      8,
                      12,
                      6,
                      15,
                      10,
                      14,
                      9,
                    ], AppColors.funColor),
                  ],
                ),

                const SizedBox(height: 20),

                // Learn Graph
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text('📚', style: TextStyle(fontSize: 16)),
                        const SizedBox(width: 8),
                        Text(
                          'Learn Progress This Month',
                          style: GoogleFonts.outfit(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '68%',
                          style: GoogleFonts.outfit(
                            color: AppColors.learnColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    _buildMonthlyProgressChart([
                      20,
                      35,
                      45,
                      50,
                      60,
                      62,
                      68,
                    ], AppColors.learnColor),
                  ],
                ),

                const SizedBox(height: 20),

                // Weekly Earning
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text('💎', style: TextStyle(fontSize: 16)),
                        const SizedBox(width: 8),
                        Text(
                          'Weekly Earning',
                          style: GoogleFonts.outfit(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '2,450 XP',
                          style: GoogleFonts.outfit(
                            color: const Color(0xFFFFD700),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    _buildWeeklyChart([
                      350,
                      280,
                      400,
                      320,
                      450,
                      380,
                      270,
                    ], const Color(0xFFFFD700)),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Stats Cards Row
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  Icons.timer_outlined,
                  '${stats['timeSpent']}h',
                  'Learning Time',
                  AppColors.learnColor,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  Icons.trending_up,
                  '${stats['learnProgress']}%',
                  'Progress',
                  AppColors.funColor,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Skills Section
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.grey[900]!, Colors.grey[850]!],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.black.withOpacity(0.5),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Top Skills',
                  style: GoogleFonts.outfit(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 16),
                _buildSkillRow(
                  'Flutter',
                  85,
                  const Color.fromARGB(255, 98, 0, 255),
                ),
                const SizedBox(height: 12),
                _buildSkillRow(
                  'UI/UX',
                  72,
                  const Color.fromARGB(255, 0, 132, 255),
                ),
                const SizedBox(height: 12),
                _buildSkillRow(
                  'Python',
                  68,
                  const Color.fromARGB(255, 106, 73, 255),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Communities Section
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.grey[900]!, Colors.grey[850]!],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.black.withOpacity(0.5),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Communities',
                      style: GoogleFonts.outfit(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'See all',
                        style: GoogleFonts.outfit(
                          color: AppColors.periwinkle,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                _buildCommunityBadge('Flutter Devs', '2.4K members'),
                const SizedBox(height: 8),
                _buildCommunityBadge('UI/UX Designers', '1.8K members'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeeklyChart(List<int> values, Color color) {
    final maxValue = values.reduce((a, b) => a > b ? a : b).toDouble();
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.2), width: 1),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(values.length, (index) {
          final barHeight = (values[index] / maxValue) * 70;
          final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 12,
                height: barHeight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [color, color.withOpacity(0.5)],
                  ),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(4),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                days[index],
                style: GoogleFonts.outfit(color: Colors.black87, fontSize: 9),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildMonthlyProgressChart(List<int> values, Color color) {
    final maxValue = values.reduce((a, b) => a > b ? a : b).toDouble();
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.2), width: 1),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(values.length, (index) {
          final barHeight = (values[index] / maxValue) * 70;
          final weeks = ['W1', 'W2', 'W3', 'W4', 'W5', 'W6', 'W7'];
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 12,
                height: barHeight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [color, color.withOpacity(0.5)],
                  ),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(4),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                weeks[index],
                style: GoogleFonts.outfit(color: Colors.black87, fontSize: 9),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildCommunityBadge(String name, String subtitle) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.periwinkle.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.periwinkle, AppColors.learnColor],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.groups, color: Colors.black, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.outfit(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.outfit(
                    color: Colors.black87,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    IconData icon,
    String value,
    String label,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withOpacity(0.2), color.withOpacity(0.05)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3), width: 1.5),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(height: 12),
          Text(
            value,
            style: GoogleFonts.outfit(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.outfit(
              color: Colors.black87,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillRow(String skill, int progress, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              skill,
              style: GoogleFonts.outfit(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '$progress%',
              style: GoogleFonts.outfit(
                color: color,
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: LinearProgressIndicator(
            value: progress / 100,
            minHeight: 6,
            backgroundColor: Colors.black87,
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: AppBar(
              backgroundColor: AppColors.lightCard,
              elevation: 0,
              centerTitle: true,
              title: Text(
                _currentUser.username,
                style: AppTypography.heading3.copyWith(
                  color: Colors.black,
                ),
              ),
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.black,
                  size: 24,
                ),
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
              ),
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.settings_outlined,
                    color: Colors.black,
                    size: 24,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SettingsScreenV2(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(child: _buildProfileHeader()),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    controller: _tabController,
                    tabs: [
                      Tab(
                        icon: Icon(
                          Icons.grid_on_outlined,
                          color: AppColors.periwinkle,
                        ),
                        text: 'Posts',
                      ),
                      Tab(
                        icon: Icon(
                          Icons.trending_up,
                          color: AppColors.periwinkle,
                        ),
                        text: 'Stats',
                      ),
                    ],
                    indicatorColor: AppColors.periwinkle,
                    labelColor: AppColors.periwinkle,
                    unselectedLabelColor: Colors.black87,
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: [_buildPostGrid(), _buildProgressContent()],
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverAppBarDelegate(this._tabBar);

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(color: Colors.black, child: _tabBar);
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}




