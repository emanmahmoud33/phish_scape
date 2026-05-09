import 'package:flutter/material.dart';
import 'package:phish_scape/core/theme/app_colors.dart';
import '../core/routing/app_routes.dart';
import '../features/chatbot/presentation/screens/chat_bot_screen.dart';
import '../features/home/presentation/screens/home_screen.dart';
import '../features/lessons/presentation/screens/lesson_screen.dart';
import '../features/profile/screens/profile_screen.dart';
import '../features/simulation/presentation/screens/simulation_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 0;

  final screens = [
    const HomeScreen(),
    const LessonsScreen(),
    const SizedBox(),
    const SizedBox(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundStart,
      body: screens[currentIndex],

        bottomNavigationBar: SafeArea(
          child: Container(
            height: 85,
            clipBehavior: Clip.none,
            decoration: BoxDecoration(
              color: Color(0xFF181E25),
              // borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 10,
                )
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _navItem(Icons.home, "Home", 0),
                    _navItem(Icons.auto_stories, "Lessons", 1),

                    const SizedBox(width: 60),

                    _navItem(Icons.model_training, "Sims", 3),
                    _navItem(Icons.person, "Profile", 4),
                  ],
                ),

                Positioned(
                  top: -11.33,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ChatScreen(),
                        ),
                      );
                    },
                    child: Container(

                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.backgroundStart,
                           width: 6
                        ),
                      ),
                      child: Container(
                        height: 56,
                        width: 56,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF2F80ED),
                        ),
                        child: const Icon(Icons.shield, color: Colors.white, size: 32),
                      ),
                    )
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }

  Widget _navItem(IconData icon, String label, int index) {
    final isSelected = currentIndex == index;

    return InkWell(
        borderRadius: BorderRadius.circular(20),
      onTap: () {

        if (index == 3) {

          Navigator.pushNamed(

            context,

            AppRoutes.simulation,

            arguments: {

              "lessonId": 1,

              "progress": 0,
            },
          );

          return;
        }

        setState(() {
          currentIndex = index;
        });
      },
    child: Padding(
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [

    /// ICON ANIMATION
    AnimatedScale(
    duration: const Duration(milliseconds: 200),
    scale: isSelected ? 1.2 : 1,
    child: Icon(
    icon,
    size: 24,
    color: isSelected
    ? const Color(0xFF2F80ED)
        : Colors.grey,
    ),
    ),

    const SizedBox(height: 4),
      /// LABEL
      Text(
        label,
        style: TextStyle(
          color: isSelected
              ? const Color(0xFF2F80ED)
              : Colors.grey,
          fontSize: 10,
        ),
      ),
    ],
    ),
    ),
    );
  }
}