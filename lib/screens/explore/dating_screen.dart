import 'package:flutter/material.dart';
import 'dart:ui';
import '../../config/app_theme.dart';
import 'dating_chat_screen.dart';

// ============ DATING SCREEN ============
class DatingScreenV2 extends StatefulWidget {
  const DatingScreenV2({Key? key}) : super(key: key);

  @override
  State<DatingScreenV2> createState() => _DatingScreenV2State();
}

class _DatingScreenV2State extends State<DatingScreenV2> {
  late TextEditingController _searchController;
  List<Map<String, dynamic>> _filteredProfiles = [];
  int _roses = 5;

  final List<Map<String, dynamic>> _datingProfiles = [
    {
      'name': 'Sarah',
      'age': 24,
      'avatar': '👩',
      'bio': 'Music lover | Coffee enthusiast',
      'interests': ['Music', 'Travel', 'Photography'],
      'online': true,
      'messaged': false,
    },
    {
      'name': 'Emma',
      'age': 23,
      'avatar': '👩‍🦰',
      'bio': 'Dancer & Content creator',
      'interests': ['Dance', 'Art', 'Adventure'],
      'online': true,
      'messaged': false,
    },
    {
      'name': 'Jessica',
      'age': 25,
      'avatar': '👩‍🎨',
      'bio': 'Artist | Nature explorer',
      'interests': ['Art', 'Nature', 'Hiking'],
      'online': false,
      'messaged': false,
    },
    {
      'name': 'Zara',
      'age': 22,
      'avatar': '👯‍♀️',
      'bio': 'Festival lover | Music is life',
      'interests': ['Music', 'Fashion', 'Events'],
      'online': true,
      'messaged': false,
    },
    {
      'name': 'Maya',
      'age': 24,
      'avatar': '🧑‍🎤',
      'bio': 'Singer | Fitness enthusiast',
      'interests': ['Music', 'Fitness', 'Travel'],
      'online': true,
      'messaged': false,
    },
    {
      'name': 'Lisa',
      'age': 23,
      'avatar': '👩‍💼',
      'bio': 'Designer | Coffee lover',
      'interests': ['Design', 'Coffee', 'Art'],
      'online': true,
      'messaged': false,
    },
    {
      'name': 'Sophia',
      'age': 26,
      'avatar': '👩‍🔬',
      'bio': 'Adventure seeker | Yoga enthusiast',
      'interests': ['Travel', 'Yoga', 'Nature'],
      'online': false,
      'messaged': false,
    },
    {
      'name': 'Olivia',
      'age': 22,
      'avatar': '👯',
      'bio': 'Photographer | Wanderer',
      'interests': ['Photography', 'Travel', 'Art'],
      'online': true,
      'messaged': false,
    },
    {
      'name': 'Ava',
      'age': 23,
      'avatar': '👩‍🎓',
      'bio': 'Student | Dreams big',
      'interests': ['Books', 'Movies', 'Music'],
      'online': true,
      'messaged': false,
    },
    {
      'name': 'Mia',
      'age': 24,
      'avatar': '🧑‍🎨',
      'bio': 'Creative mind | Always smiling',
      'interests': ['Art', 'Music', 'Travel'],
      'online': true,
      'messaged': false,
    },
  ];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _filteredProfiles = _datingProfiles;
    _searchController.addListener(_filterProfiles);
  }

  void _filterProfiles() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredProfiles = _datingProfiles;
      } else {
        _filteredProfiles = _datingProfiles
            .where(
              (profile) =>
                  profile['name'].toLowerCase().contains(query) ||
                  profile['bio'].toLowerCase().contains(query) ||
                  (profile['interests'] as List).any(
                    (interest) => interest.toLowerCase().contains(query),
                  ),
            )
            .toList();
      }
    });
  }

  void _sendRose(Map<String, dynamic> profile, int index) {
    if (_roses <= 0) {
      _showBuyRosesDialog();
      return;
    }

    setState(() {
      _roses--;
      _filteredProfiles[index]['messaged'] = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '🌹 Rose sent to ${profile['name']}!',
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.purple[600],
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _openChat(Map<String, dynamic> profile, int index) {
    // Check if rose has been sent
    if (!profile['messaged']) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            '🌹 Send a rose first to chat!',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.purple[600],
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DatingChatScreenV2(
          profile: profile,
          onClose: () {
            setState(() {});
          },
        ),
      ),
    );
  }

  void _showBuyRosesDialog() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.black87,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('🌹', style: TextStyle(fontSize: 40)),
              const SizedBox(height: 12),
              Text(
                'Out of Roses!',
                style: AppTypography.heading4.copyWith(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Get more roses to send messages',
                style: AppTypography.bodySmall.copyWith(
                  color: Colors.black87,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: Colors.black.withOpacity(0.2),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Later',
                            style: AppTypography.captionSmall.copyWith(
                              color: Colors.black.withOpacity(0.6),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() => _roses += 10);
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text(
                              '🌹 10 roses purchased!',
                              style: TextStyle(color: Colors.black),
                            ),
                            backgroundColor: Colors.purple[600],
                            duration: const Duration(seconds: 1),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.purple[400]!, Colors.purple[600]!],
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Buy Roses',
                            style: AppTypography.captionSmall.copyWith(
                              color: Colors.black,
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
    );
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
          'Discover',
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
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.purple[400]!, Colors.purple[600]!],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Text('🌹', style: TextStyle(fontSize: 14)),
                    const SizedBox(width: 6),
                    Text(
                      '$_roses',
                      style: AppTypography.captionSmall.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
        centerTitle: false,
      ),
      body: Column(
        children: [
          // Search Bar and Rose Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                // Search Bar
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: TextField(
                      controller: _searchController,
                      style: AppTypography.bodySmall.copyWith(
                        color: Colors.black,
                        fontSize: 13,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        hintStyle: AppTypography.bodySmall.copyWith(
                          color: Colors.black87,
                          fontSize: 13,
                        ),
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search_rounded,
                          color: Colors.black87,
                          size: 18,
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                      cursorColor: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                // Rose Icon Button
                GestureDetector(
                  onTap: () {
                    if (_roses > 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'You have $_roses roses to send!',
                            style: const TextStyle(color: Colors.black),
                          ),
                          backgroundColor: Colors.purple[600],
                          duration: const Duration(seconds: 1),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    } else {
                      _showBuyRosesDialog();
                    }
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.pink[300]!, Colors.purple[500]!],
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text('🌹', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Profile List
          Expanded(
            child: _filteredProfiles.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person_search_rounded,
                          color: Colors.black,
                          size: 48,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'No profiles found',
                          style: AppTypography.bodySmall.copyWith(
                            color: Colors.black87,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    itemCount: _filteredProfiles.length,
                    itemBuilder: (context, index) {
                      final profile = _filteredProfiles[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: GestureDetector(
                          onTap: () => _openChat(profile, index),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                border: Border.all(
                                  color: Colors.black.withOpacity(0.08),
                                  width: 1,
                                ),
                              ),
                              child: Column(
                                children: [
                                  // Avatar Section
                                  Container(
                                    height: 200,
                                    color: Colors.black,
                                    child: Center(
                                      child: Text(
                                        profile['avatar'],
                                        style: const TextStyle(fontSize: 80),
                                      ),
                                    ),
                                  ),
                                  // Profile Info
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Name, Age, Status
                                        Row(
                                          children: [
                                            Text(
                                              '${profile['name']}, ${profile['age']}',
                                              style: AppTypography.heading4
                                                  .copyWith(
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                            const SizedBox(width: 8),
                                            Container(
                                              width: 9,
                                              height: 9,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: profile['online']
                                                    ? Colors.green[400]
                                                    : Colors.grey[600],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 6),
                                        // Bio
                                        Text(
                                          profile['bio'],
                                          style: AppTypography.bodySmall
                                              .copyWith(
                                                color: Colors.black87,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                              ),
                                        ),
                                        const SizedBox(height: 10),
                                        // Interests
                                        Wrap(
                                          spacing: 6,
                                          runSpacing: 6,
                                          children: profile['interests']
                                              .map<Widget>((interest) {
                                                return Container(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 4,
                                                      ),
                                                  decoration: BoxDecoration(
                                                    color: Colors.black
                                                        .withOpacity(0.06),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          8,
                                                        ),
                                                    border: Border.all(
                                                      color: Colors.black
                                                          .withOpacity(0.1),
                                                      width: 1,
                                                    ),
                                                  ),
                                                  child: Text(
                                                    interest,
                                                    style: AppTypography
                                                        .captionSmall
                                                        .copyWith(
                                                          color: Colors.black,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                  ),
                                                );
                                              })
                                              .toList(),
                                        ),
                                        const SizedBox(height: 14),
                                        // Action Buttons
                                        Row(
                                          children: [
                                            // Skip Button
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    _filteredProfiles.removeAt(
                                                      index,
                                                    );
                                                  });
                                                },
                                                child: Container(
                                                  height: 42,
                                                  decoration: BoxDecoration(
                                                    color: Colors.transparent,
                                                    border: Border.all(
                                                      color: Colors.black
                                                          .withOpacity(0.2),
                                                      width: 1.5,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          10,
                                                        ),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.close_rounded,
                                                        color: Colors.black
                                                            .withOpacity(0.6),
                                                        size: 18,
                                                      ),
                                                      const SizedBox(width: 4),
                                                      Text(
                                                        'Skip',
                                                        style: AppTypography
                                                            .captionSmall
                                                            .copyWith(
                                                              color: Colors
                                                                  .white
                                                                  .withOpacity(
                                                                    0.6,
                                                                  ),
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            // Send Rose Button
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () =>
                                                    _sendRose(profile, index),
                                                child: Container(
                                                  height: 42,
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      begin: Alignment.topLeft,
                                                      end:
                                                          Alignment.bottomRight,
                                                      colors: [
                                                        Colors.purple[400]!,
                                                        Colors.purple[600]!,
                                                      ],
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          10,
                                                        ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors
                                                            .purple[600]!
                                                            .withOpacity(0.3),
                                                        blurRadius: 8,
                                                        offset: const Offset(
                                                          0,
                                                          2,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      const Text(
                                                        '🌹',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                      const SizedBox(width: 4),
                                                      Text(
                                                        profile['messaged']
                                                            ? 'Sent'
                                                            : 'Send Rose',
                                                        style: AppTypography
                                                            .captionSmall
                                                            .copyWith(
                                                              color: Colors.black,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
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
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}




