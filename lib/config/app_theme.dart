import 'package:flutter/material.dart';

// ============ APP COLORS ============
class AppColors {
  // Light Theme Colors - Professional
  static const Color lightBg = Color(0xFFFAFAFA);
  static const Color lightCard = Color(0xFFFFFFFF);
  static const Color lightText = Color(0xFF1F1F1F);
  static const Color lightSecondaryText = Color(0xFF666666);
  static const Color lightBorder = Color(0xFFE8E8E8);
  static const Color lightDivider = Color(0xFFF0F0F0);

  // Dark Theme Colors - Professional
  static const Color darkBg = Color(0xFF0F0F0F);
  static const Color darkCard = Color(0xFF1A1A1A);
  static const Color darkText = Color(0xFFE8E8E8);
  static const Color darkSecondaryText = Color(0xFF999999);
  static const Color darkBorder = Color(0xFF2A2A2A);
  static const Color darkDivider = Color(0xFF252525);

  // Theme Colors - Blue Palette (for accents)
  static const Color darkestBlue = Color(0xFF1E1F26); // Midnight Blue
  static const Color indigoInk = Color(0xFF283655); // Indigo Ink
  static const Color blueberry = Color(0xFF4D648D); // Blueberry
  static const Color periwinkle = Color(0xFFD0E1F9); // Periwinkle

  // Legacy support
  static const Color black = darkestBlue;
  static const Color darkGray = indigoInk;
  static const Color gray = blueberry;
  static const Color lightGray = periwinkle;
  static const Color white = Color(0xFFFFFFFF);
  static const Color offWhite = periwinkle;

  // Brand Colors - Fun • Learn • Earn
  static const Color funColor = Color(0xFFFF6B6B); // Fun - Red/Orange
  static const Color learnColor = Color(0xFF4ECDC4); // Learn - Teal
  static const Color earnColor = Color(0xFFFFD166); // Earn - Gold/Yellow

  // Status Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFFF5252);
  static const Color warning = Color(0xFFFFC107);
  static const Color info = Color(0xFF2196F3);
}

// ============ APP TYPOGRAPHY ============
class AppTypography {
  static const TextStyle heading1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w800,
    letterSpacing: -0.5,
    height: 1.2,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.3,
    height: 1.25,
  );

  static const TextStyle heading3 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 1.3,
  );

  static const TextStyle heading4 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );

  static const TextStyle subtitle1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.5,
  );

  static const TextStyle subtitle2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.43,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.43,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.33,
  );

  static const TextStyle captionSmall = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    height: 1.27,
  );

  static const TextStyle button = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.43,
  );
}

// ============ APP SPACING & RADIUS ============
class AppSpacing {
  static const double xs = 4, sm = 8, md = 12, lg = 16, xl = 24, xxl = 32;
}

class AppRadius {
  static const double xs = 4, sm = 8, md = 12, lg = 16, xl = 24, full = 9999;
}

// ============ DARK THEME (PROFESSIONAL) ============
ThemeData buildDarkTheme() {
  final baseTheme = ThemeData.dark(useMaterial3: true);

  return baseTheme.copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBg,
    primaryColor: AppColors.learnColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkCard,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      iconTheme: const IconThemeData(color: AppColors.darkText),
      titleTextStyle: AppTypography.heading4.copyWith(
        color: AppColors.darkText,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkCard,
      elevation: 8,
      selectedItemColor: AppColors.learnColor,
      unselectedItemColor: AppColors.darkSecondaryText,
      selectedLabelStyle: AppTypography.caption.copyWith(
        color: AppColors.learnColor,
      ),
      unselectedLabelStyle: AppTypography.caption.copyWith(
        color: AppColors.darkSecondaryText,
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.darkCard,
      elevation: 8,
      indicatorColor: AppColors.learnColor.withOpacity(0.2),
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      iconTheme: MaterialStateProperty.all(
        const IconThemeData(color: AppColors.darkText),
      ),
    ),
    textTheme: baseTheme.textTheme.apply(
      bodyColor: AppColors.darkText,
      displayColor: AppColors.darkText,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkBorder,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.darkBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.learnColor, width: 2),
      ),
      hintStyle: AppTypography.body.copyWith(
        color: AppColors.darkSecondaryText,
      ),
      labelStyle: AppTypography.body.copyWith(color: AppColors.darkText),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.learnColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.darkText,
        side: const BorderSide(color: AppColors.darkBorder),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      ),
    ),
    cardTheme: CardThemeData(
      color: AppColors.darkCard,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: AppColors.darkBorder, width: 1),
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.darkBorder,
      thickness: 1,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.darkCard,
      contentTextStyle: AppTypography.body.copyWith(color: AppColors.darkText),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    colorScheme: ColorScheme.dark(
      background: AppColors.darkBg,
      surface: AppColors.darkCard,
      primary: AppColors.learnColor,
      secondary: AppColors.funColor,
      tertiary: AppColors.earnColor,
      onBackground: AppColors.darkText,
      onSurface: AppColors.darkText,
    ),
  );
}

// ============ LIGHT THEME (PROFESSIONAL) ============
ThemeData buildLightTheme() {
  final baseTheme = ThemeData.light(useMaterial3: true);

  return baseTheme.copyWith(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBg,
    primaryColor: AppColors.learnColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightCard,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      iconTheme: const IconThemeData(color: AppColors.lightText),
      titleTextStyle: AppTypography.heading4.copyWith(
        color: AppColors.lightText,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightCard,
      elevation: 8,
      selectedItemColor: AppColors.learnColor,
      unselectedItemColor: AppColors.lightSecondaryText,
      selectedLabelStyle: AppTypography.caption.copyWith(
        color: AppColors.learnColor,
      ),
      unselectedLabelStyle: AppTypography.caption.copyWith(
        color: AppColors.lightSecondaryText,
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.lightCard,
      elevation: 8,
      indicatorColor: AppColors.learnColor.withOpacity(0.15),
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      iconTheme: MaterialStateProperty.all(
        const IconThemeData(color: AppColors.lightText),
      ),
    ),
    textTheme: baseTheme.textTheme.apply(
      bodyColor: AppColors.lightText,
      displayColor: AppColors.lightText,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.lightDivider,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.lightBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.learnColor, width: 2),
      ),
      hintStyle: AppTypography.body.copyWith(
        color: AppColors.lightSecondaryText,
      ),
      labelStyle: AppTypography.body.copyWith(color: AppColors.lightText),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.learnColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.lightText,
        side: const BorderSide(color: AppColors.lightBorder),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      ),
    ),
    cardTheme: CardThemeData(
      color: AppColors.lightCard,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: AppColors.lightBorder, width: 1),
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.lightBorder,
      thickness: 1,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.lightText,
      contentTextStyle: AppTypography.body.copyWith(color: Colors.white),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    colorScheme: const ColorScheme.light(
      background: AppColors.lightBg,
      surface: AppColors.lightCard,
      primary: AppColors.learnColor,
      secondary: AppColors.funColor,
      tertiary: AppColors.earnColor,
      onBackground: AppColors.lightText,
      onSurface: AppColors.lightText,
    ),
  );
}
