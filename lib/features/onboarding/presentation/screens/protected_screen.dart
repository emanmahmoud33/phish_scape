import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../auth/presentation/widgets/custom_button.dart';
import '../../../auth/presentation/widgets/dots_indicator.dart';

class ProtectedScreen extends StatelessWidget {
  const ProtectedScreen({super.key});

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
              SizedBox(
                height: w * 0.7, // بدل 260
                width: w * 0.7,
                child: Stack(
                  alignment: Alignment.center,
                  children: [

                    /// 🔵 Circle
                    CircleAvatar(
                      radius: w * 0.32, // بدل 120
                      backgroundColor: const Color(0xFF0F6876),
                      child: SvgPicture.asset(
                        "assets/images/verified_user.svg",
                        height: h * 0.1, // بدل 90
                      ),
                    ),

                    /// 🟣 Fingerprint
                    Positioned(
                      top: h * 0.015,
                      right: w * 0.01,
                      child: SvgPicture.asset(
                        "assets/images/fingerprint.svg",
                        height: h * 0.025,
                      ),
                    ),

                    /// 🟡 Password
                    Positioned(
                      bottom: h * 0.015,
                      left: w * 0.01,
                      child: SvgPicture.asset(
                        "assets/images/password.svg",
                        height: h * 0.025,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: h * 0.04),

              /// 📝 Title
              Text(
                "Stay Protected",
                style: TextStyle(
                  fontSize: 32 * scale,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),

              SizedBox(height: h * 0.015),

              /// 📄 Description
              Text(
                "Build long-term security habits and watch your Security Score grow as you master the art of detecting phishing attempts.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 14 * scale,
                ),
              ),

              SizedBox(height: h * 0.12),

              /// 🟦 Live Status Card
              Container(
                padding: EdgeInsets.all(w * 0.04),
                decoration: BoxDecoration(
                  color: const Color(0xFF10232C),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [

                    /// 🔵 Icon
                    CircleAvatar(
                      radius: w * 0.06,
                      backgroundColor: const Color(0xFF0DA6F2),
                      child: SvgPicture.asset(
                        "assets/images/trending_up.svg",
                        height: h * 0.025,
                        color: Colors.black,
                      ),
                    ),

                    SizedBox(width: w * 0.03),

                    /// 🔤 Text
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Live Status",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 12 * scale,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: h * 0.005),
                        Text(
                          "Tracking Security Score...",
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 14 * scale,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const Spacer(),

              /// 🔵 Dots
               Dots(index: 2),

              SizedBox(height: h * 0.025),

              /// 🔘 Button
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  text: "Start Learning",
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.levelSelection);
                  },
                ),
              ),

              SizedBox(height: h * 0.025),
            ],
          ),
        ),
      ),
    );
  }
}