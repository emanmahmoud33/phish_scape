import 'package:flutter/material.dart';
import 'package:phish_scape/features/auth/presentation/widgets/custom_button.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../home/presentation/screens/home_screen.dart';

class LevelSelectionScreen extends StatefulWidget {
  const LevelSelectionScreen({super.key});

  @override
  State<LevelSelectionScreen> createState() =>
      _LevelSelectionScreenState();
}

class _LevelSelectionScreenState extends State<LevelSelectionScreen> {
  int selectedIndex = 1; // default (Intermediate)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: AppColors.backgroundStart,
          ),
          child: SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

            // 🔙 Back + Title
            const Row(
            children: [
            Icon(Icons.arrow_back_ios, color: AppColors.primary),
            SizedBox(width: 10),
            Text(
              "Personalize Your Experience",
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 16,
              ),
            ),
            Spacer(),
            Text(
              "Step 3 of 3",
              style: TextStyle(color: AppColors.primary),
            ),
            ],
          ),

          const SizedBox(height: 20),

          // 📊 Progress
          const Text(
            "Setup Progress",

            style: TextStyle(color: AppColors.textSecondary,fontSize: 16),
          ),
          const SizedBox(height: 8),

          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: 1,
              backgroundColor: Colors.grey.withOpacity(0.2),
              color: AppColors.primary,
              minHeight: 6,
            ),
          ),

          const SizedBox(height: 30),

          // ❓ Question
          const Text(
            "How much do you know about phishing?",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),

          const SizedBox(height: 10),

          // 📝 Description
          const Text(
            "We'll tailor your learning path based on your current expertise.",
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.textSecondary),
          ),

          const SizedBox(height: 30),

          // 🧩 Options
          _optionCard(
            index: 0,
            title: "Beginner",
            subtitle: "I'm brand new to cybersecurity.",
            icon: Icons.phishing,
          ),

          const SizedBox(height: 15),

          _optionCard(
            index: 1,
            title: "Intermediate",
            subtitle: "I know the basics of online safety.",
            icon: Icons.shield,
          ),

          const SizedBox(height: 15),

          _optionCard(
            index: 2,
            title: "Advanced",
            subtitle: "I'm a security professional or pro user.",
            icon: Icons.terminal,
          ),

          const Spacer(),

          // ℹ️ Note
          const Center(
            child: Text(
              "Don't worry, you can change this later in settings.",
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 16,
              ),
            ),
          ),

          const SizedBox(height: 20),
                  // 🔘 Continue
                 SizedBox(width: double.infinity,
                     child: CustomButton(text: "Continue", onPressed: () {  Navigator.push(
                       context,
                       MaterialPageRoute(
                         builder: (_) => const HomeScreen(),
                       ),
                     );},))
                ],
            ),
          ),
        ),
    );
  }

  // 🔹 Option Card
  Widget _optionCard({
    required int index,
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    final isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
       margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(20),

        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary.withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? AppColors.primary
                : Colors.grey.withOpacity(0.2),
          ),
        ),
        child: Row(
          children: [
            // Icon
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primary
                    : const Color(0xFF1F2937),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: isSelected
                    ? Colors.white
                    : AppColors.textSecondary,
              ),
            ),

            const SizedBox(width: 15),

            // Text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(

                    title,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 14,

                    ),
                  ),
                ],
              ),
            ),

            // Radio Circle
            Container(
              height: 22,
              width: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? AppColors.primary
                      : Colors.grey,
                ),
                color: isSelected
                    ? AppColors.textPrimary
                    : Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}