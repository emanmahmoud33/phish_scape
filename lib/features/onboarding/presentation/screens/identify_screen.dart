import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phish_scape/features/onboarding/presentation/screens/simulate_screen.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../auth/presentation/widgets/custom_button.dart';
import '../../../auth/presentation/widgets/dots_indicator.dart';

class IdentifyScreen extends StatelessWidget {
  const IdentifyScreen({super.key});

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
              // Skip
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  child: const Text(
                    "Skip",
                    style: TextStyle(color: AppColors.textPrimary,fontSize: 16),

                  ),
                  onPressed: (){},
                ),
              ),

              const Spacer(),


              CircleAvatar(
                radius: 190,
                backgroundColor: const Color(0xFF0F2C35),

                child: Container(
                  width: 120,
                  height: 196,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/images/anchor.svg",
                        height: 100,
                      ),
                      const SizedBox(height: 50),
                      SvgPicture.asset(
                        "assets/images/mail.svg",
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "Identify the Bait",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                "Cyber-attacks often hide in plain sight. We'll teach you to spot the subtle indicators that separate a legitimate email from a dangerous phishing attempt.",
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.textSecondary),
              ),

              const Spacer(),

              Dots(index: 0),

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 16),
                child: CustomButton(
                  text: "Next",
                    onPressed: () {  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SimulateScreen(),
                      ),
                    );},

                ),
              ),
              const SizedBox(height: 30,),
              const Text('Step 1 of 3: Mastering the Basics',style: TextStyle(color: AppColors.textSecondary),)
            ],
          ),
        ),
      ),
    );
  }
}