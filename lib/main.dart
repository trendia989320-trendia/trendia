import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'config/app_theme.dart';
import 'routes.dart';
import 'services/theme_service.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeService(),
      child: const TrendiaApp(),
    ),
  );
}

class TrendiaApp extends StatefulWidget {
  const TrendiaApp({Key? key}) : super(key: key);

  @override
  State<TrendiaApp> createState() => _TrendiaAppState();
}

class _TrendiaAppState extends State<TrendiaApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(
      builder: (context, themeService, _) {
        bool isDark = themeService.isDarkMode();

        return MaterialApp(
          title: 'Trendia',
          debugShowCheckedModeBanner: false,
          theme: isDark ? buildDarkTheme() : buildLightTheme(),
          darkTheme: buildDarkTheme(),
          themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
          onGenerateRoute: RouteGenerator.generateRoute,
          initialRoute: '/',
        );
      },
    );
  }
}
