import 'package:flutter/material.dart';
import 'package:phish_scape/features/auth/presentation/screens/signup_screen.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../onboarding/presentation/screens/identify_screen.dart';
import '../../../onboarding/presentation/screens/level_selection_screen.dart';
import '../widgets/auth_buttons.dart';
import '../widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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

              // 🔐 Secure Login
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
                          text: "Login",
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
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    "Access your cybersecurity training \nmodule and phishing simulation portal.",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // 📧 Email
              const Text(
                "Email/Username",
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 8),

              TextField(
                decoration: InputDecoration(
                  hintText: "Enter identity" ,hintStyle: TextStyle(color:AppColors.textSecondary),
                  filled: true,
                  fillColor: const Color(0xFF4A5568),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 🔑 Password
              const Text(
                "Password",
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 8),TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter credentials",hintStyle: TextStyle(color:AppColors.textSecondary),
                          filled: true,
                          fillColor: const Color(0xFF4A5568),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: const Icon(Icons.visibility,color: AppColors.textSecondary,),
                        ),
                      ),

                      const SizedBox(height: 10),

                      // 🔗 Forgot
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(color: AppColors.primary,fontSize: 14),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      // 🔘 Button
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                         child: CustomButton(
                           onPressed: () {  Navigator.push(
                             context,
                             MaterialPageRoute(
                               builder: (_) => const LevelSelectionScreen(),
                             ),
                           );},
                        text: "ACCESS SHIELD",

                         )),
                      SizedBox(height: 20),

                      // 🔒 Encryption
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.lock, size: 16, color:  Color(0xFF00B8DF),),
                          SizedBox(width: 6),
                          Text(
                            "256-bit Encrypted Connection",
                            style: TextStyle(
                              color:  Color(0xFF00B8DF),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 45),

                      // OR
                      const Center(
                        child: Text(
                          "Or authenticate with",
                          style: TextStyle(color: AppColors.textSecondary),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // 🔗 Social
                      const SocialButtonRow(),


                      const SizedBox(height: 30),

                      // Register
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account? ",
                            style: TextStyle(color: AppColors.textSecondary,fontSize: 14),
                          ),
                          TextButton(
                            onPressed: () {  Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const SignupScreen(),
                              ),
                            );},
                            child: const Text(
                              "Join the Shield",
                              style: TextStyle(color: AppColors.primary,fontWeight: FontWeight.w700),
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