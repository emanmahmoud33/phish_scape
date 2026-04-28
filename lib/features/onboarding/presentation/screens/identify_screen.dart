import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../auth/presentation/widgets/custom_button.dart';
import '../../../auth/presentation/widgets/dots_indicator.dart';

class IdentifyScreen extends StatelessWidget {
  const IdentifyScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;
    final scale = w / 375;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(w * 0.05), // بدل 20
        decoration: const BoxDecoration(
          color: AppColors.backgroundStart,
        ),
        child: SafeArea(
          child: Column(
            children: [

              /// 🔹 Skip
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.levelSelection,
                          (route) => false,
                    );
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 16 * scale,
                    ),
                  ),
                ),
              ),

              const Spacer(),

              /// 🔵 Circle + Icons
              CircleAvatar(
                radius: w * 0.5, // بدل 190
                backgroundColor: const Color(0xFF0F2C35),

                child: Container(
                  width: w * 0.32, // بدل 120
                  height: h * 0.25, // بدل 196
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/images/anchor.svg",
                        height: h * 0.12, // بدل 100
                      ),
                      SizedBox(height: h * 0.05),
                      SvgPicture.asset(
                        "assets/images/mail.svg",
                        height: h * 0.05, // بدل 40
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: h * 0.04),

              /// 🔤 Title
              Text(
                "Identify the Bait",
                style: TextStyle(
                  fontSize: 26 * scale,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),

              SizedBox(height: h * 0.015),

              /// 📝 Description
              Text(
                "Cyber-attacks often hide in plain sight. We'll teach you to spot the subtle indicators that separate a legitimate email from a dangerous phishing attempt.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 14 * scale,
                ),
              ),

              const Spacer(),

              /// 🔘 Dots
              Dots(index: 0),

              SizedBox(height: h * 0.025),

              /// 🔵 Button
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: w * 0.02,
                  vertical: h * 0.02,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    text: "Next",
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.simulate,
                      );
                    },
                  ),
                ),
              ),

              SizedBox(height: h * 0.03),

              /// 🔹 Step Text
              Text(
                'Step 1 of 3: Mastering the Basics',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12 * scale,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}