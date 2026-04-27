import 'package:flutter/material.dart';
import 'package:phish_scape/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:phish_scape/features/onboarding/presentation/screens/identify_screen.dart';
import 'package:phish_scape/features/onboarding/presentation/screens/level_selection_screen.dart';
import 'package:phish_scape/features/setting/presentation/Setting_Screen.dart';
import 'package:phish_scape/layout/main_layout.dart';

import 'core/routing/app_routes.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/presentation/screens/login_screen.dart';
import 'features/onboarding/presentation/screens/splash_screen..dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.splash: (_) => const SplashScreen(),
        AppRoutes.login: (_) => const LoginScreen(),
        AppRoutes.onboarding: (_) => const IdentifyScreen(),
        AppRoutes.main: (_) => const MainLayout(),
        AppRoutes.levelSelection: (_) => const LevelSelectionScreen(),
        AppRoutes.notification: (_) => const NotificationsScreen(),
        AppRoutes.setting: (_) => const SettingsScreen(),
      },
    );
  }
}