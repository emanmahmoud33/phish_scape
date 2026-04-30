import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:phish_scape/features/auth/presentation/screens/signup_screen.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/auth_buttons.dart';
import '../widgets/custom_button.dart';
import '../../logic/cubit/auth_cubit.dart';
import '../../data/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isPasswordHidden = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;
    final scale = w / 375;

    return BlocProvider(
        create: (context) => AuthCubit(AuthService()),

        child: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) async {

            /// 🔐 LOGIN SUCCESS
            if (state is LoginSuccess) {
              final prefs = await SharedPreferences.getInstance();
              await prefs.setString("token", state.token);

              Navigator.pushReplacementNamed(context, AppRoutes.identify);
            }

            /// 📝 REGISTER SUCCESS
            if (state is RegisterSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Account created")),
              );
            }

            /// 📧 FORGET PASSWORD SUCCESS
            if (state is ForgetPasswordSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Check your email")),
              );
            }

            /// ❌ ERROR
            if (state is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },


          child: Scaffold(
    backgroundColor: AppColors.backgroundStart,
    body: Container(
    padding: EdgeInsets.all(w * 0.05),
    decoration: const BoxDecoration(
    color: AppColors.backgroundStart,
    ),
    child: SafeArea(
    child: SingleChildScrollView(
    child: Form(
      key: _formKey,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [

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

    TextFormField(
    controller: emailController,
    validator: (value) {
    if (value == null || value.isEmpty) {
    return "Email is required" ;
    }
    if (!value.contains("@")) {
    return "Enter valid email";
    }
    return null;
    },
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

            TextFormField(
              controller: passwordController,
              obscureText: isPasswordHidden, // 👈 بدل true

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Password is required";
                }
                if (value.length < 6) {
                  return "Password must be at least 6 characters";
                }
                return null;
              },

              decoration: InputDecoration(
                hintText: "Enter credentials",
                hintStyle: const TextStyle(color: AppColors.textSecondary),
                filled: true,
                fillColor: const Color(0xFF4A5568),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),

                // 👇 بدل Icon → IconButton
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordHidden
                        ? Icons.visibility_off   // مخفي
                        : Icons.visibility,      // ظاهر
                    color: AppColors.textSecondary,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordHidden = !isPasswordHidden;
                    });
                  },
                ),
              ),
            ),

    SizedBox(height: h * 0.015),
      /// 🔗 Forgot
      Align(
        alignment: Alignment.centerRight,
        child: TextButton(
          onPressed: () {
            print("CLICKED");
            final email = emailController.text.trim();

            if (email.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Enter your email first")),
              );
              return;
            }

            context.read<AuthCubit>().forgetPassword(email);
          },
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

      /// 🔘 Button + Loading
      BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return SizedBox(
            width: double.infinity,
            height: h * 0.07,
            child: CustomButton(
              text: "ACCESS SHIELD",
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<AuthCubit>().login(
                    emailController.text.trim(),
                    passwordController.text.trim(),
                  );
                }
              },
            ),
          );
        },
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
    ),
        ),
        ) );
  }
}