import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phish_scape/features/auth/presentation/screens/login_screen.dart';
import 'package:phish_scape/features/auth/presentation/widgets/custom_button.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import 'identify_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
              color: AppColors.backgroundStart,
            ),
            child: SafeArea(
              child: Column(
                  children: [
                  const Spacer(),

              // 🔷 Logo Card
              Container(
                height: 181.02,
                width: 181.02,
                decoration: BoxDecoration(
                  color: AppColors.backgroundStart,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.primary,
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.2),
                      blurRadius: 25,
                    ),
                  ],
                ),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/images/logo.svg",
                    height: 70,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // 📝 Title
              const Text(
                "PhishScape",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  // fontFamily:AppTheme.
                  color: AppColors.textPrimary,
                ),
              ),

              const SizedBox(height: 8),

              // 🟦 Subtitle
              const Text(
                "Master the defense",
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.primary,
                 fontWeight: FontWeight.w500,
                  letterSpacing: 4,
                ),
              ),

              const Spacer(),

              // 🔹 Bottom Text
              const Text(
                "Protecting your digital assets",
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                  fontWeight: FontWeight.w500
                ),
              ),

              const SizedBox(height: 10),

              // 🔹 Indicator line
              Container(
                height: 4,
                width: 50,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              const SizedBox(height: 60),

              // 🔘 Button
             CustomButton(text: 'Get Started',  onPressed: () {
               Navigator.pushReplacementNamed(context, AppRoutes.login);
             })
                   , const SizedBox(height: 60),
                  ],
              ),
            ),
        ),
    );
  }
}