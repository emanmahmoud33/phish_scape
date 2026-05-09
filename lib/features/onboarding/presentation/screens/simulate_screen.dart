import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../auth/presentation/widgets/custom_button.dart';
import '../../../auth/presentation/widgets/dots_indicator.dart';

class SimulateScreen extends StatelessWidget {
  const SimulateScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;
    final scale = w / 375;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(w * 0.05),
        decoration: const BoxDecoration(
          color: AppColors.backgroundStart,
        ),
        child: SafeArea(
          child: Column(
            children: [

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

              SvgPicture.asset(
                "assets/images/div.relative.svg",
                width: w * 0.7,
              ),

              SizedBox(height: h * 0.04),

              Text(
                "Simulate & Practice",
                style: TextStyle(
                  fontSize: 26 * scale,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),

              SizedBox(height: h * 0.015),

              Text(
                "Experience real-world threats in a safe sandbox environment. Sharpen your instincts by interacting with simulated phishing attacks without risking your actual data.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 14 * scale,
                ),
              ),

              const Spacer(),

              Dots(index: 1),

              SizedBox(height: h * 0.025),

              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  text: "Next",
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.protect);
                  },
                ),
              ),

              SizedBox(height: h * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}