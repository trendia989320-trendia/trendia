import 'package:flutter/material.dart';
import '../../config/app_theme.dart';

/// Splash Screen
/// Initial loading screen with animations
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward().then((_) {
      Future.delayed(const Duration(milliseconds: 1000), () {
        if (mounted) {
          Navigator.of(context).pushReplacementNamed('/intro');
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.lightBg,
              AppColors.lightBg.withOpacity(0.95),
              AppColors.lightCard,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SlideTransition(
            position: _slideAnimation,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.learnColor.withOpacity(0.08),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.learnColor.withOpacity(0.15),
                        width: 2,
                      ),
                    ),
                    child: const Icon(
                      Icons.school_outlined,
                      size: 60,
                      color: AppColors.learnColor,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Trendia',
                    style: AppTypography.heading1.copyWith(
                      color: AppColors.lightText,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Connect • Learn • Grow',
                    style: AppTypography.subtitle1.copyWith(
                      color: AppColors.lightSecondaryText,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
