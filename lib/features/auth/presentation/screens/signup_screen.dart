import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phish_scape/features/auth/presentation/screens/login_screen.dart';
import 'package:phish_scape/features/auth/presentation/widgets/custom_button.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/auth_buttons.dart';
import '../../logic/cubit/auth_cubit.dart';
import '../../data/services/auth_service.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  bool isPasswordHidden = true;
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;
    final scale = w / 375;
    return BlocProvider(
      create: (context) => AuthCubit(AuthService()),

      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {

          ///  REGISTER SUCCESS
          if (state is RegisterSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Account created")),
            );

            Navigator.pushReplacementNamed(context, AppRoutes.login);
          }

          ///  ERROR
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },

        child: Scaffold(
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

                    Text(
                      "Access your cybersecurity training module and phishing simulation portal.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 16 * scale,
                      ),
                    ),

                    SizedBox(height: h * 0.04),

                    /// EMAIL
                    _label("Email/Username", scale),
                    _input("Enter identity", w, isPassword: false, controller: emailController),

                    SizedBox(height: h * 0.025),

                    /// PASSWORD
                    _label("Password", scale),
                    _input("Enter credentials", w,
                        isPassword: true, controller: passwordController),

                    SizedBox(height: h * 0.025),

                    /// CONFIRM
                    _label("Confirm Password", scale),
                    _input("Enter credentials", w,
                        isPassword: true, controller: confirmController),

                    SizedBox(height: h * 0.06),

                    /// BUTTON
                    SizedBox(
                      width: double.infinity,
                      height: h * 0.07,
                      child: BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, state) {

                          if (state is AuthLoading) {
                            return const Center(child: CircularProgressIndicator());
                          }

                          return CustomButton(
                            text: 'ACCESS SHIELD',
                            onPressed: () {

                              final email = emailController.text.trim();
                              final password = passwordController.text.trim();
                              final confirm = confirmController.text.trim();

                              if (email.isEmpty || password.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Fill all fields")),
                                );
                                return;
                              }

                              if (password != confirm) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Passwords do not match")),
                                );
                                return;
                              }

                              context.read<AuthCubit>().register(
                                email: email,
                                password: password,
                                firstName: "user",
                                lastName: "name",
                              );
                            },
                          );
                        },
                      ),
                    ),

                    SizedBox(height: h * 0.03),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.lock, size: w * 0.04, color: AppColors.primary),
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

                    const SocialButtonRow(),

                    SizedBox(height: h * 0.04),

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
        ),
      ),
    );
  }

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

  Widget _input(String hint, double w,
      {bool isPassword = true, TextEditingController? controller}) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword ? isPasswordHidden : false,

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

        /// 👁️ icon clickable
        suffixIcon: isPassword
            ? IconButton(
          icon: Icon(
            isPasswordHidden
                ? Icons.visibility_off
                : Icons.visibility,
            color: AppColors.textPrimary,
          ),
          onPressed: () {
            setState(() {
              isPasswordHidden = !isPasswordHidden;
            });
          },
        )
            : null,
      ),
    );
  }
}