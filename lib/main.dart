import 'package:flutter/material.dart';
import 'package:phish_scape/features/analysis/presentation/screens/analysis_screen.dart';
import 'package:phish_scape/features/auth/presentation/screens/signup_screen.dart';
import 'package:phish_scape/features/chatbot/presentation/screens/chat_bot_screen.dart';
import 'package:phish_scape/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:phish_scape/features/onboarding/presentation/screens/identify_screen.dart';
import 'package:phish_scape/features/onboarding/presentation/screens/level_selection_screen.dart';
import 'package:phish_scape/features/onboarding/presentation/screens/simulate_screen.dart' hide SimulationScreen;
import 'package:phish_scape/features/setting/presentation/Setting_Screen.dart';
import 'package:phish_scape/layout/main_layout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/network/dio_helper.dart';
import 'core/routing/app_routes.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/data/services/auth_service.dart';
import 'features/auth/logic/cubit/auth_cubit.dart';
import 'features/auth/logic/cubit/home_cubit.dart';
import 'features/auth/logic/cubit/user_cubit.dart';
import 'features/auth/presentation/screens/login_screen.dart';
import 'features/onboarding/presentation/screens/protected_screen.dart';
import 'features/onboarding/presentation/screens/splash_screen..dart';
import 'features/simulation/presentation/screens/simulation_screen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => AuthCubit(AuthService()),
      ),
      BlocProvider(
        create: (_) => UserCubit(AuthService())
          ..getUser()
          ..getUserImage(),
      ),
      BlocProvider(
        create: (_) => HomeCubit(AuthService())..loadHome(), // 🔥
      ),
    ],
    child: MyApp(),
  ));
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
        //  onboarding
        AppRoutes.identify: (_) => const IdentifyScreen(),
        AppRoutes.simulate: (_) => const SimulateScreen (),
        AppRoutes.protect: (_) => const ProtectedScreen(),
        AppRoutes.main: (_) => const MainLayout(),
        AppRoutes.levelSelection: (_) => const LevelSelectionScreen(),
        AppRoutes.notification: (_) => const NotificationsScreen(),
        AppRoutes.setting: (_) => const SettingsScreen(),
        AppRoutes.signup: (_) => const SignupScreen(),
        AppRoutes.chat: (_) => const ChatScreen(),
        AppRoutes.simulation: (_) => const SimulationScreen(),
        AppRoutes.analysis: (_) => const AnalysisScreen(),

      },
    );
  }
}