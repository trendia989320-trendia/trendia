import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'config/app_theme.dart';
import 'services/theme_service.dart';
import 'screens/home/home_screen.dart';
import 'screens/explore/search_screen.dart';
import 'screens/shorts/shorts_screen.dart';
import 'screens/profile/profile_screen.dart';

// ============ MAIN APP SHELL V2 ============
class AppShellV2 extends StatefulWidget {
  final VoidCallback onThemeToggle;

  const AppShellV2({Key? key, required this.onThemeToggle}) : super(key: key);

  @override
  State<AppShellV2> createState() => _AppShellV2State();
}

class _AppShellV2State extends State<AppShellV2> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const HomeScreenV2(),
      const SearchScreenV2(),
      ShotsScreenV2(onBack: () => setState(() => _selectedIndex = 0)),
      const AddPostScreenV2(),
      const ProfileScreenV2(),
    ];

    final themeService = Provider.of<ThemeService>(context);
    final isLightTheme = themeService.isLightMode();
    
    final navBackgroundColor = isLightTheme ? AppColors.lightCard : AppColors.darkCard;
    final navBorderColor = isLightTheme ? AppColors.lightBorder : AppColors.darkBorder;
    final navIconSelectedColor = Colors.black;
    final navIconUnselectedColor = Colors.black54;
    final navTextSelectedColor = Colors.black;
    final navTextUnselectedColor = Colors.black54;

    return Scaffold(
      backgroundColor: isLightTheme ? AppColors.lightBg : AppColors.darkBg,
      body: screens[_selectedIndex],
      bottomNavigationBar: _selectedIndex == 2
          ? null
          : SafeArea(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: navBackgroundColor,
                    border: Border(
                      top: BorderSide(
                        color: navBorderColor,
                        width: 0.5,
                      ),
                    ),
                  ),
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildNavItem(
                        Icons.home_outlined,
                        0,
                        'Home',
                        rotate: false,
                        selectedColor: navIconSelectedColor,
                        unselectedColor: navIconUnselectedColor,
                        selectedTextColor: navTextSelectedColor,
                        unselectedTextColor: navTextUnselectedColor,
                      ),
                      _buildNavItem(
                        Icons.search_outlined,
                        1,
                        'Search',
                        rotate: false,
                        selectedColor: navIconSelectedColor,
                        unselectedColor: navIconUnselectedColor,
                        selectedTextColor: navTextSelectedColor,
                        unselectedTextColor: navTextUnselectedColor,
                      ),
                      _buildNavItem(
                        Icons.play_circle_outline,
                        2,
                        'Shot',
                        rotate: false,
                        selectedColor: navIconSelectedColor,
                        unselectedColor: navIconUnselectedColor,
                        selectedTextColor: navTextSelectedColor,
                        unselectedTextColor: navTextUnselectedColor,
                      ),
                      _buildNavItem(
                        Icons.add_outlined,
                        3,
                        'Post',
                        rotate: false,
                        selectedColor: navIconSelectedColor,
                        unselectedColor: navIconUnselectedColor,
                        selectedTextColor: navTextSelectedColor,
                        unselectedTextColor: navTextUnselectedColor,
                      ),
                      _buildNavItem(
                        Icons.person_outline,
                        4,
                        'Profile',
                        rotate: false,
                        selectedColor: navIconSelectedColor,
                        unselectedColor: navIconUnselectedColor,
                        selectedTextColor: navTextSelectedColor,
                        unselectedTextColor: navTextUnselectedColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _buildNavItem(
    IconData icon,
    int index,
    String label, {
    bool rotate = false,
    required Color selectedColor,
    required Color unselectedColor,
    required Color selectedTextColor,
    required Color unselectedTextColor,
  }) {
    final isSelected = _selectedIndex == index;
    Widget iconWidget = Icon(
      icon,
      color: isSelected ? selectedColor : unselectedColor,
      size: isSelected ? 32 : 28,
    );

    if (rotate) {
      iconWidget = Transform.rotate(angle: 3.14159 / 4, child: iconWidget);
    }

    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
      child: Container(
        width: 60,
        height: 70,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconWidget,
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? selectedTextColor : unselectedTextColor,
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============ ADD POST SCREEN V2 ============
class AddPostScreenV2 extends StatefulWidget {
  const AddPostScreenV2({Key? key}) : super(key: key);

  @override
  State<AddPostScreenV2> createState() => _AddPostScreenV2State();
}

class _AddPostScreenV2State extends State<AddPostScreenV2> {
  String _selectedType = 'Fun';
  late TextEditingController _captionController;

  @override
  void initState() {
    super.initState();
    _captionController = TextEditingController();
  }

  @override
  void dispose() {
    _captionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.7),
        elevation: 0,
        title: Text(
          'Create Post',
          style: GoogleFonts.outfit(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close_rounded, color: Colors.white, size: 24),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Share',
                    style: GoogleFonts.outfit(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Media Preview Section
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black, Colors.grey.shade900],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            AppColors.periwinkle.withOpacity(0.25),
                            AppColors.learnColor.withOpacity(0.15),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        border: Border.all(
                          color: AppColors.periwinkle.withOpacity(0.3),
                          width: 2,
                        ),
                      ),
                      child: Icon(
                        Icons.add_photo_alternate_rounded,
                        size: 45,
                        color: AppColors.periwinkle.withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Add Photo or Video',
                      style: GoogleFonts.outfit(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Tap to upload your content',
                      style: GoogleFonts.outfit(
                        color: Colors.grey.shade500,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Content Section
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey.shade800, width: 0.5),
              ),
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Type Selector
                  Text(
                    'Content Type',
                    style: GoogleFonts.outfit(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[950] ?? Colors.black,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade800, width: 1),
                    ),
                    padding: const EdgeInsets.all(6),
                    child: Row(
                      children: [
                        Expanded(
                          child: _buildTypeOption(
                            'Fun',
                            AppColors.funColor,
                            Icons.videocam_rounded,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: _buildTypeOption(
                            'Learn',
                            AppColors.learnColor,
                            Icons.school_rounded,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Caption Section
                  Text(
                    'Write a Caption',
                    style: GoogleFonts.outfit(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[950] ?? Colors.black,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade800, width: 1),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 4,
                    ),
                    child: TextField(
                      controller: _captionController,
                      style: GoogleFonts.outfit(
                        color: Colors.white,
                        fontSize: 14,
                        height: 1.6,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Share your thoughts...',
                        hintStyle: GoogleFonts.outfit(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                        ),
                        border: InputBorder.none,
                        isDense: true,
                      ),
                      maxLines: 3,
                      minLines: 3,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Add Options Section
                  Text(
                    'Add to Post',
                    style: GoogleFonts.outfit(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[950] ?? Colors.black,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade800, width: 1),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 12,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildAddOption(
                          Icons.image_rounded,
                          'Photo',
                          AppColors.learnColor,
                        ),
                        _buildAddOption(
                          Icons.location_on_rounded,
                          'Location',
                          AppColors.funColor,
                        ),
                        _buildAddOption(
                          Icons.tag_rounded,
                          'Tag',
                          AppColors.periwinkle,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypeOption(String label, Color color, IconData icon) {
    final isSelected = _selectedType == label;
    return GestureDetector(
      onTap: () => setState(() => _selectedType = label),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 11),
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey.shade900 : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? Colors.grey.shade700 : Colors.grey.shade800,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 18),
            const SizedBox(width: 6),
            Text(
              label,
              style: GoogleFonts.outfit(
                color: Colors.white,
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddOption(IconData icon, String label, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade700, width: 1),
          ),
          child: Icon(icon, color: Colors.white, size: 22),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: GoogleFonts.outfit(
            color: Colors.white,
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

// ============ POST EDIT SCREEN V2 ============
class PostEditScreenV2 extends StatefulWidget {
  final String? initialCaption;
  final String postType;

  const PostEditScreenV2({Key? key, this.initialCaption, this.postType = 'Fun'})
    : super(key: key);

  @override
  State<PostEditScreenV2> createState() => _PostEditScreenV2State();
}

class _PostEditScreenV2State extends State<PostEditScreenV2> {
  late TextEditingController _captionController;
  late TextEditingController _locationController;
  late TextEditingController _tagsController;

  @override
  void initState() {
    super.initState();
    _captionController = TextEditingController(text: widget.initialCaption);
    _locationController = TextEditingController();
    _tagsController = TextEditingController();
  }

  @override
  void dispose() {
    _captionController.dispose();
    _locationController.dispose();
    _tagsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.7),
        elevation: 0,
        title: Text(
          'Edit Post',
          style: GoogleFonts.outfit(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 24,
          ),
          onPressed: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Done',
                    style: GoogleFonts.outfit(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Caption Section
            Text(
              'Caption',
              style: GoogleFonts.outfit(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade800, width: 1),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
              child: TextField(
                controller: _captionController,
                style: GoogleFonts.outfit(
                  color: Colors.white,
                  fontSize: 14,
                  height: 1.6,
                ),
                decoration: InputDecoration(
                  hintText: 'Write your caption...',
                  hintStyle: GoogleFonts.outfit(
                    color: Colors.grey.shade600,
                    fontSize: 14,
                  ),
                  border: InputBorder.none,
                  isDense: true,
                ),
                maxLines: 4,
                minLines: 4,
              ),
            ),
            const SizedBox(height: 24),

            // Location Section
            Text(
              'Add Location',
              style: GoogleFonts.outfit(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade800, width: 1),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on_rounded,
                    color: Colors.grey.shade600,
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _locationController,
                      style: GoogleFonts.outfit(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Search location...',
                        hintStyle: GoogleFonts.outfit(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                        ),
                        border: InputBorder.none,
                        isDense: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Tags Section
            Text(
              'Add Tags',
              style: GoogleFonts.outfit(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade800, width: 1),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
              child: Row(
                children: [
                  Icon(
                    Icons.tag_rounded,
                    color: Colors.grey.shade600,
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _tagsController,
                      style: GoogleFonts.outfit(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Add tags (e.g., #flutter #coding)',
                        hintStyle: GoogleFonts.outfit(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                        ),
                        border: InputBorder.none,
                        isDense: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Visibility Section
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade800, width: 1),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Visibility',
                    style: GoogleFonts.outfit(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _buildVisibilityOption(
                          'Public',
                          Icons.public_rounded,
                          true,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _buildVisibilityOption(
                          'Friends Only',
                          Icons.people_rounded,
                          false,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _buildVisibilityOption(
                          'Private',
                          Icons.lock_rounded,
                          false,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Comments Section
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade800, width: 1),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Allow Comments',
                        style: GoogleFonts.outfit(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Let others comment on this post',
                        style: GoogleFonts.outfit(
                          color: Colors.grey.shade500,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                  Switch(
                    value: true,
                    onChanged: (value) {},
                    activeColor: Colors.white,
                    inactiveThumbColor: Colors.grey.shade700,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildVisibilityOption(String label, IconData icon, bool isSelected) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey.shade800 : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? Colors.grey.shade700 : Colors.grey.shade800,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 20),
            const SizedBox(height: 6),
            Text(
              label,
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(
                color: Colors.white,
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
