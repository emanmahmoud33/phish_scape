import 'package:flutter/material.dart';
import 'package:phish_scape/features/auth/presentation/screens/signup_screen.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/auth_buttons.dart';
import '../widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;
    final scale = w / 375;

    return Scaffold(
      backgroundColor: AppColors.backgroundStart,
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

                /// 🔐 Secure Login
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
                            text: "Login",
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
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(w * 0.03),
                    child: Text(
                      "Access your cybersecurity training \nmodule and phishing simulation portal.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16 * scale,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: h * 0.04),

                /// 📧 Email
                const Text(
                  "Email/Username",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: h * 0.01),

                TextField(
                  decoration: InputDecoration(
                    hintText: "Enter identity",
                    hintStyle: const TextStyle(color: AppColors.textSecondary),
                    filled: true,
                    fillColor: const Color(0xFF4A5568),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                SizedBox(height: h * 0.025),

                /// 🔑 Password
                const Text(
                  "Password",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: h * 0.01),

                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter credentials",
                    hintStyle: const TextStyle(color: AppColors.textSecondary),
                    filled: true,
                    fillColor: const Color(0xFF4A5568),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: const Icon(Icons.visibility,
                        color: AppColors.textSecondary),
                  ),
                ),

                SizedBox(height: h * 0.015),

                /// 🔗 Forgot
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 14 * scale,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: h * 0.015),

                /// 🔘 Button
                SizedBox(
                  width: double.infinity,
                  height: h * 0.07,
                  child: CustomButton(
                    text: "ACCESS SHIELD",
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutes.identify,
                            (route) => false,
                      );
                    },
                  ),
                ),

                SizedBox(height: h * 0.025),

                /// 🔒 Encryption
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.lock,
                        size: w * 0.04, color: const Color(0xFF00B8DF)),
                    SizedBox(width: w * 0.015),
                    Text(
                      "256-bit Encrypted Connection",
                      style: TextStyle(
                        color: const Color(0xFF00B8DF),
                        fontSize: 12 * scale,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: h * 0.05),

                /// OR
                Center(
                  child: Text(
                    "Or authenticate with",
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 14 * scale,
                    ),
                  ),
                ),

                SizedBox(height: h * 0.025),

                /// 🔗 Social
                const SocialButtonRow(),

                SizedBox(height: h * 0.04),

                /// Register
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 14 * scale,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.signup);
                      },
                      child: Text(
                        "Join the Shield",
                        style: TextStyle(
                          color: const Color(0xFF2F80ED),
                          fontWeight: FontWeight.w600,
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
}