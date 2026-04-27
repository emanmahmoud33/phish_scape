import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phish_scape/features/onboarding/presentation/screens/protected_screen.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../auth/presentation/widgets/custom_button.dart';
import '../../../auth/presentation/widgets/dots_indicator.dart';

class SimulateScreen extends StatelessWidget {
  const SimulateScreen({super.key});

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
            children: [
              // 🔹 Skip
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  child: const Text(
                    "Skip",
                    style: TextStyle(color: AppColors.textPrimary,fontSize: 16),

                  ),
                    onPressed: () {


                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutes.levelSelection ,
                            (route) => false,
                      );
                    }
                ),
              ),

              const Spacer(),
          SvgPicture.asset(
            "assets/images/div.relative.svg",
          ),
              const SizedBox(height: 30),

              // 📝 Title
              const Text(
                "Simulate & Practice",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),

              const SizedBox(height: 12),

              // 📄 Description
              const Text(
                "Experience real-world threats in a safe sandbox environment. Sharpen your instincts by interacting with simulated phishing attacks without risking your actual data.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textSecondary,
                ),
              ),

              const Spacer(),

              // 🔵 Dots
              Dots(index: 1),

              const SizedBox(height: 20),

              // 🔘 Button
              CustomButton(
                text: "Next",
                  onPressed: () {  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ProtectedScreen(),
                    ),
                  );}
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}