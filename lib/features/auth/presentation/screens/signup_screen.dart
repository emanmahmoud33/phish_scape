import 'package:flutter/material.dart';
import 'package:phish_scape/features/auth/presentation/screens/login_screen.dart';
import 'package:phish_scape/features/auth/presentation/widgets/custom_button.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/auth_buttons.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// 🔷 Header
                Row(
                  children: [
                    const Icon(Icons.shield, color: AppColors.primary),
                    SizedBox(width: w * 0.1),
                    Text(
                      "Authentication Required",
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 18 * scale,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: h * 0.04),

                /// 🔐 Secure Signup
                Row(
                  children: [
                    const Icon(Icons.lock, color: AppColors.primary),
                    SizedBox(width: w * 0.1),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Secure ",
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 32 * scale,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 5,
                            ),
                          ),
                          TextSpan(
                            text: "Signup",
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 32 * scale,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: h * 0.015),

                /// 📝 Description
                Text(
                  "Access your cybersecurity training module and phishing simulation portal.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 16 * scale,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                SizedBox(height: h * 0.04),

                /// 📧 Email
                _label("Email/Username", scale),
                _input("Enter identity", w),

                SizedBox(height: h * 0.025),

                /// 🎓 University ID
                _label("Password", scale),
                _input("Enter credentials", w, isPassword: true),

                SizedBox(height: h * 0.025),

                /// 🔑 Password
                _label("Confirm Password", scale),
                _input("Enter credentials", w, isPassword: true),

                SizedBox(height: h * 0.06),

                /// 🔘 Button
                SizedBox(
                  width: double.infinity,
                  height: h * 0.07,
                  child: CustomButton(
                    text: 'ACCESS SHIELD',
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutes.identify,
                            (route) => false,
                      );
                    },
                  ),
                ),

                SizedBox(height: h * 0.03),

                /// 🔒 Encryption
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.lock,
                        size: w * 0.04, color: AppColors.primary),
                    SizedBox(width: w * 0.015),
                    Text(
                      "256-bit Encrypted Connection",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 12 * scale,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: h * 0.05),

                /// OR
                Center(
                  child: Text(
                    "Or Signup with",
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 14 * scale,
                    ),
                  ),
                ),

                SizedBox(height: h * 0.025),

                /// 🔗 Social Buttons
                const SocialButtonRow(),

                SizedBox(height: h * 0.04),

                /// Login link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "You have an account? ",
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 14 * scale,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Login To Shield",
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 14 * scale,
                        ),
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

  /// 🔹 Label
  Widget _label(String text, double scale) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.textSecondary,
          fontSize: 14 * scale,
        ),
      ),
    );
  }

  /// 🔹 Input
  Widget _input(String hint, double w, {bool isPassword = false}) {
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
        contentPadding: EdgeInsets.symmetric(
          horizontal: w * 0.04,
          vertical: w * 0.04,
        ),
        suffixIcon: isPassword
            ? const Icon(Icons.visibility,
            color: AppColors.textPrimary)
            : null,
      ),
    );
  }
}