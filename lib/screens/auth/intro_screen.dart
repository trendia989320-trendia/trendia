import 'package:flutter/material.dart';
import '../../config/app_theme.dart';

/// Intro Page Data Model
class IntroPage {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;

  IntroPage({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });
}

/// Intro/Onboarding Screen
/// Shows app introduction and fun/learn/earn concepts
class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<IntroPage> pages = [
    IntroPage(
      title: 'Fun',
      subtitle: 'Build meaningful connections with fellow learners and experts',
      icon: Icons.connect_without_contact_outlined,
      color: const Color.fromARGB(255, 0, 255, 255),
    ),
    IntroPage(
      title: 'Learn',
      subtitle:
          'Master new skills through collaborative learning and communities',
      icon: Icons.group_work_outlined,
      color: const Color.fromARGB(255, 41, 67, 139),
    ),
    IntroPage(
      title: 'Earn',
      subtitle: 'Monetize your skills and collaborate on paid projects',
      icon: Icons.work_outline_outlined,
      color: const Color.fromARGB(255, 56, 138, 35),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightCard,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            itemCount: pages.length,
            itemBuilder: (context, index) {
              return _buildIntroPage(pages[index]);
            },
          ),
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    pages.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: _currentIndex == index ? 32 : 8,
                      height: 8,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: _currentIndex == index
                            ? pages[index].color
                            : AppColors.lightBorder,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_currentIndex == pages.length - 1) {
                        Navigator.pushReplacementNamed(context, '/login');
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: pages[_currentIndex].color,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      _currentIndex == pages.length - 1
                          ? 'Get Started'
                          : 'Next',
                      style: AppTypography.button.copyWith(color: Colors.black),
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

  Widget _buildIntroPage(IntroPage page) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [page.color.withOpacity(0.08), AppColors.lightCard],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [page.color, page.color.withOpacity(0.5)],
                  ),
                  shape: BoxShape.circle,
                ),
                child: Icon(page.icon, size: 50, color: Colors.black),
              ),
              const SizedBox(height: 40),
              Text(
                page.title,
                style: AppTypography.heading2.copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.lightText,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  page.subtitle,
                  style: AppTypography.subtitle1.copyWith(
                    color: AppColors.lightSecondaryText,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
