

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

              // 🔵 Circle
                  SizedBox(
                    height: 260,
                    width: 260,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // 🔵 الدائرة الكبيرة
                        CircleAvatar(
                          radius: 120,
                          backgroundColor: const Color(0xFF0F6876),
                          child: SvgPicture.asset(
                            "assets/images/verified_user.svg",
                            height: 90,
                          ),
                        ),

                        // 🟣 Fingerprint (فوق يمين)
                        Positioned(
                          top: 10,
                          right: 5,
                          child: SvgPicture.asset(
                            "assets/images/fingerprint.svg",
                            height: 20,
                          ),
                        ),

                        // 🟡 Password (تحت شمال)
                        Positioned(
                          bottom: 10,
                          left: 2,
                          child: SvgPicture.asset(
                            "assets/images/password.svg",
                            height: 20,
                          ),
                        ),
                      ],
                    ),
                  ),

             const SizedBox(height: 30),

              // 📝 Title
              const Text(
                "Stay Protected",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),

              const SizedBox(height: 12),

              // 📄 Description
              const Text(
                "Build long-term security habits and watch your Security Score grow as you master the art of detecting phishing attempts.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textSecondary,
                ),
              ),

              const SizedBox(height: 100),

              // 🟦 Live Status Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF10232C),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    // Icon Circle
                    CircleAvatar(
                      radius: 22,
                      backgroundColor:  const Color(0xFF0DA6F2),
                      child: SvgPicture.asset(
                        "assets/images/trending_up.svg",
                        height: 18,
                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(width: 12),

                    // Texts
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Live Status",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 12,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Tracking Security Score...",
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 14,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // 🔵 Dots
              Dots(index: 2),

              const SizedBox(height: 20),

              // 🔘 Button
                  CustomButton(
                    text: "Start Learning",
                      onPressed: () {


                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          AppRoutes.levelSelection ,
                              (route) => false,
                        );
                      }
                  ),const SizedBox(height: 20),
                ],
              ),
            ),
        ),
    );
  }
}