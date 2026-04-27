import 'package:flutter/material.dart';
import 'package:phish_scape/features/auth/presentation/screens/login_screen.dart';
import 'package:phish_scape/features/auth/presentation/widgets/custom_button.dart';
import 'package:phish_scape/features/onboarding/presentation/screens/level_selection_screen.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/auth_buttons.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: AppColors.backgroundStart,
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                // 🔷 Header
                const Row(
                children: [
                Icon(Icons.shield, color: AppColors.primary),
                SizedBox(width: 40),
                Text(
                  "Authentication Required",
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                ],
              ),

              const SizedBox(height: 30),

              // 🔐 Secure Signup
              Row(
                children: [
                  const Icon(Icons.lock, color: AppColors.primary),
                  const SizedBox(width: 40),
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "Secure ",
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                              letterSpacing: 5
                          ),
                        ),
                        TextSpan(
                          text: "Signup",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                              letterSpacing: 3
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // 📝 Description
              const Text(
                textAlign: TextAlign.center
             ,   "Access your cybersecurity training module and phishing simulation portal.",
                style: TextStyle(color: AppColors.textSecondary,fontSize: 16,fontWeight: FontWeight.w400,),
              ),

              const SizedBox(height: 30),

              // 📧 Email
              _label("Email/Username"),
              _input("Enter identity"),

              const SizedBox(height: 20),

              // 🎓 University ID
              _label("University ID"),
              _input("Enter Id", isPassword: true),

              const SizedBox(height: 20),

              // 🔑 Password
              _label("Password"),
              _input("Enter credentials", isPassword: true),

              const SizedBox(height: 50),

              // 🔘 Button
              CustomButton(text: 'ACCESS SHIELD', onPressed: () {
                Navigator.pushNamed(context, AppRoutes.onboarding);
              },)

            ,  const SizedBox(height: 25),// 🔒 Encryption
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.lock, size: 16, color: AppColors.primary),
                          SizedBox(width: 6),
                          Text(
                            "256-bit Encrypted Connection",
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 45),

                      // OR
                      const Center(
                        child: Text(
                          "Or Signup with",
                          style: TextStyle(color: AppColors.textSecondary),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // 🔗 Social Buttons
                      const SocialButtonRow(),

                      const SizedBox(height: 30),

                      // Login link
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "You have an account? ",
                            style: TextStyle(color: AppColors.textSecondary),
                          ),
                          TextButton(
                            onPressed: () {  Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const LoginScreen(),
                              ),
                            );},
                            child: const Text(
                              "Login To Shield",
                              style: TextStyle(color: AppColors.primary),
                            ),
                          ),
                        ],
                      ),
                    ],
                ),
              ),
            ),
        ),
    );
  }

  // 🔹 Label
  Widget _label(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(color: AppColors.textSecondary),
      ),
    );
  }

  // 🔹 Input
  Widget _input(String hint, {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.textSecondary),
        filled: true,
        fillColor: const Color(0xFF4A5568),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        suffixIcon: isPassword
            ? const Icon(Icons.visibility,color: AppColors.textPrimary,)
            : null,
      ),
    );
  }
}