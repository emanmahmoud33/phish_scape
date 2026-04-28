import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phish_scape/features/auth/presentation/widgets/custom_button.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;
    final scale = w / 375;

    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: w * 0.05),
        decoration: const BoxDecoration(
          color: AppColors.backgroundStart,
        ),
        child: SafeArea(
          child: Column(
            children: [

              const Spacer(),

              /// 🔷 Logo Card
              Container(
                height: w * 0.48, // 👈 بدل 181
                width: w * 0.48,
                decoration: BoxDecoration(
                  color: AppColors.backgroundStart,
                  borderRadius: BorderRadius.circular(12 * scale),
                  border: Border.all(
                    color: AppColors.primary,
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.2),
                      blurRadius: 25 * scale,
                    ),
                  ],
                ),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/images/logo.svg",
                    height: w * 0.18, // 👈 بدل 70
                  ),
                ),
              ),

              SizedBox(height: h * 0.04),

              /// 📝 Title
              Text(
                "PhishScape",
                style: TextStyle(
                  fontSize: 36 * scale,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),

              SizedBox(height: h * 0.01),

              /// 🟦 Subtitle
              Text(
                "Master the defense",
                style: TextStyle(
                  fontSize: 14 * scale,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 4,
                ),
              ),

              const Spacer(),

              /// 🔹 Bottom Text
              Text(
                "Protecting your digital assets",
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12 * scale,
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(height: h * 0.01),

              /// 🔹 Indicator line
              Container(
                height: 4,
                width: w * 0.13, // 👈 بدل 50
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              SizedBox(height: h * 0.07),

              /// 🔘 Button
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  text: 'Get Started',
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.login);
                  },
                ),
              ),

              SizedBox(height: h * 0.07),
            ],
          ),
        ),
      ),
    );
  }
}