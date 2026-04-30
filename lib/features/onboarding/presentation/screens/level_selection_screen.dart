// import 'package:flutter/material.dart';
// import 'package:phish_scape/features/auth/presentation/widgets/custom_button.dart';
// import '../../../../core/routing/app_routes.dart';
// import '../../../../core/theme/app_colors.dart';
//
// class LevelSelectionScreen extends StatefulWidget {
//   const LevelSelectionScreen({super.key});
//
//   @override
//   State<LevelSelectionScreen> createState() =>
//       _LevelSelectionScreenState();
// }
//
// class _LevelSelectionScreenState extends State<LevelSelectionScreen> {
//   int selectedIndex = 1;
//   String selectedLevel = "";
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final w = size.width;
//     final h = size.height;
//     final scale = w / 375;
//
//     return Scaffold(
//       backgroundColor: AppColors.backgroundStart,
//
//       /// 🔹 APP BAR
//       appBar: AppBar(
//         backgroundColor: AppColors.backgroundStart,
//         automaticallyImplyLeading: false,
//         elevation: 0,
//         toolbarHeight: h * 0.08,
//         flexibleSpace: SafeArea(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: w * 0.05),
//             child: Row(
//               children: [
//
//                 /// 🔙 BACK
//                 GestureDetector(
//                   onTap: () {
//                     if (Navigator.canPop(context)) {
//                       Navigator.pop(context);
//                     } else {
//                       Navigator.pushReplacementNamed(
//                         context,
//                         AppRoutes.main,
//                       );
//                     }
//                   },
//                   child: Icon(
//                     Icons.arrow_back_ios,
//                     color: AppColors.primary,
//                     size: w * 0.05,
//                   ),
//                 ),
//
//                 SizedBox(width: w * 0.02),
//
//                 /// 🔤 TITLE
//                 Expanded(
//                   child: Center(
//                     child: Text(
//                       "Personalize Your Experience",
//                       style: TextStyle(
//                         color: AppColors.textPrimary,
//                         fontWeight: FontWeight.w700,
//                         fontSize: 18 * scale,
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 SizedBox(width: w * 0.05),
//               ],
//             ),
//           ),
//         ),
//       ),
//
//       /// 🔹 BODY
//       body: SafeArea(
//         child: SingleChildScrollView( // ✅ حل المشكلة
//           child: Padding(
//             padding: EdgeInsets.all(w * 0.04),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//
//                 SizedBox(height: h * 0.025),
//
//                 /// 📊 Progress
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "Setup Progress",
//                       style: TextStyle(
//                         color: AppColors.textSecondary,
//                         fontSize: 14 * scale,
//                       ),
//                     ),
//                     Text(
//                       "Step 3 of 3",
//                       style: TextStyle(
//                         color: AppColors.primary,
//                         fontSize: 14 * scale,
//                       ),
//                     ),
//                   ],
//                 ),
//
//                 SizedBox(height: h * 0.01),
//
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: LinearProgressIndicator(
//                     value: 0.8,
//                     minHeight: 8,
//                     backgroundColor: Colors.grey.withOpacity(0.2),
//                     color: AppColors.primary,
//                   ),
//                 ),
//
//                 SizedBox(height: h * 0.035),
//
//                 /// ❓ Question
//                 Text(
//                   "How much do you know about phishing?",
//                   style: TextStyle(
//                     fontSize: 30 * scale,
//                     fontWeight: FontWeight.bold,
//                     color: AppColors.textPrimary,
//                   ),
//                 ),
//
//                 SizedBox(height: h * 0.015),
//
//                 /// 📝 Description
//                 Text(
//                   "We'll tailor your learning path based on your current expertise.",
//                   style: TextStyle(
//                     color: AppColors.textSecondary,
//                     fontSize: 14 * scale,
//                   ),
//                 ),
//
//                 SizedBox(height: h * 0.035),
//
//                 /// 🧩 OPTIONS
//                 _optionCard(
//                   index: 0,
//                   title: "Beginner",
//                   subtitle: "I'm brand new to cybersecurity.",
//                   icon: Icons.phishing,
//                 ),
//
//                 SizedBox(height: h * 0.02),
//
//                 _optionCard(
//                   index: 1,
//                   title: "Intermediate",
//                   subtitle: "I know the basics of online safety.",
//                   icon: Icons.shield,
//                 ),
//
//                 SizedBox(height: h * 0.02),
//
//                 _optionCard(
//                   index: 2,
//                   title: "Advanced",
//                   subtitle: "I'm a security professional or pro user.",
//                   icon: Icons.terminal,
//                 ),
//
//                 SizedBox(height: h * 0.06), // 👈 بدل Spacer
//
//                 /// ℹ️ NOTE
//                 Center(
//                   child: Text(
//                     "Don't worry, you can change this later in settings.",
//                     style: TextStyle(
//                       color: AppColors.textSecondary,
//                       fontSize: 12 * scale,
//                     ),
//                   ),
//                 ),
//
//                 SizedBox(height: h * 0.02),
//
//                 /// 🔘 BUTTON
//                 SizedBox(
//                   width: double.infinity,
//                   child: CustomButton(
//                     text: "Continue",
//                     onPressed: () {
//                       Navigator.pushNamedAndRemoveUntil(
//                         context,
//                         AppRoutes.main,
//                             (route) => false,
//                       );
//                     },
//                   ),
//                 ),
//
//                 SizedBox(height: h * 0.03),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   /// 🔹 OPTION CARD
//   Widget _optionCard({
//     required int index,
//     required String title,
//     required String subtitle,
//     required IconData icon,
//   }) {
//     final isSelected = selectedIndex == index;
//
//     final w = MediaQuery.of(context).size.width;
//     final scale = w / 375;
//
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selectedIndex = index;
//         });
//       },
//       child: Container(
//         margin: EdgeInsets.all(w * 0.01),
//         padding: EdgeInsets.all(w * 0.05),
//         decoration: BoxDecoration(
//           color: isSelected
//               ? AppColors.primary.withOpacity(0.1)
//               : Colors.transparent,
//           borderRadius: BorderRadius.circular(16),
//           border: Border.all(
//             width: 2,
//             color: isSelected
//                 ? AppColors.primary
//                 : Colors.grey.withOpacity(0.2),
//           ),
//         ),
//         child: Row(
//           children: [
//
//             Container(
//               height: w * 0.13,
//               width: w * 0.13,
//               decoration: BoxDecoration(
//                 color: isSelected
//                     ? AppColors.primary
//                     : const Color(0xFF1F2937),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Icon(
//                 icon,
//                 color: isSelected
//                     ? Colors.white
//                     : AppColors.textSecondary,
//               ),
//             ),
//
//             SizedBox(width: w * 0.04),
//
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: TextStyle(
//                       color: AppColors.textPrimary,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18 * scale,
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     subtitle,
//                     style: TextStyle(
//                       color: AppColors.textSecondary,
//                       fontSize: 14 * scale,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             Container(
//               height: w * 0.06,
//               width: w * 0.06,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 border: Border.all(
//                   color: isSelected
//                       ? AppColors.primary
//                       : Colors.grey,
//                 ),
//                 color: isSelected
//                     ? AppColors.textPrimary
//                     : Colors.transparent,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phish_scape/features/auth/presentation/widgets/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../auth/data/services/auth_service.dart';
import '../../../auth/logic/cubit/auth_cubit.dart';

class LevelSelectionScreen extends StatefulWidget {
  const LevelSelectionScreen({super.key});

  @override
  State<LevelSelectionScreen> createState() => _LevelSelectionScreenState();
}

class _LevelSelectionScreenState extends State<LevelSelectionScreen> {
  int selectedIndex = -1;
  String selectedLevel = "";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;
    final scale = w / 375;

    return BlocProvider(
      create: (context) => AuthCubit(AuthService()),
      child: Builder(
        builder: (context) {
          return BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              /// ✅ SUCCESS
              if (state is LevelSuccess) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.main,
                  (route) => false,
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

              /// 🔹 APP BAR
              appBar: AppBar(
                backgroundColor: AppColors.backgroundStart,
                automaticallyImplyLeading: false,
                elevation: 0,
                toolbarHeight: h * 0.08,
                flexibleSpace: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                    child: Row(
                      children: [
                        /// 🔙 BACK
                        GestureDetector(
                          onTap: () {
                            if (Navigator.canPop(context)) {
                              Navigator.pop(context);
                            } else {
                              Navigator.pushReplacementNamed(
                                context,
                                AppRoutes.main,
                              );
                            }
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: AppColors.primary,
                            size: w * 0.05,
                          ),
                        ),

                        SizedBox(width: w * 0.02),

                        /// 🔤 TITLE
                        Expanded(
                          child: Center(
                            child: Text(
                              "Personalize Your Experience",
                              style: TextStyle(
                                color: AppColors.textPrimary,
                                fontWeight: FontWeight.w700,
                                fontSize: 18 * scale,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(width: w * 0.05),
                      ],
                    ),
                  ),
                ),
              ),

              /// 🔹 BODY
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(w * 0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: h * 0.025),

                        /// 📊 Progress
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Setup Progress",
                              style: TextStyle(
                                color: AppColors.textSecondary,
                                fontSize: 14 * scale,
                              ),
                            ),
                            Text(
                              "Step 3 of 3",
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 14 * scale,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: h * 0.01),

                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: LinearProgressIndicator(
                            value: 0.8,
                            minHeight: 8,
                            backgroundColor: Colors.grey.withOpacity(0.2),
                            color: AppColors.primary,
                          ),
                        ),

                        SizedBox(height: h * 0.035),

                        /// ❓ Question
                        Text(
                          "How much do you know about phishing?",
                          style: TextStyle(
                            fontSize: 30 * scale,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),

                        SizedBox(height: h * 0.015),

                        /// 📝 Description
                        Text(
                          "We'll tailor your learning path based on your current expertise.",
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 14 * scale,
                          ),
                        ),

                        SizedBox(height: h * 0.035),

                        /// 🧩 OPTIONS
                        _optionCard(
                          index: 0,
                          title: "Beginner",
                          subtitle: "I'm brand new to cybersecurity.",
                          icon: Icons.phishing,
                        ),

                        SizedBox(height: h * 0.02),

                        _optionCard(
                          index: 1,
                          title: "Intermediate",
                          subtitle: "I know the basics of online safety.",
                          icon: Icons.shield,
                        ),

                        SizedBox(height: h * 0.02),

                        _optionCard(
                          index: 2,
                          title: "Advanced",
                          subtitle: "I'm a security professional or pro user.",
                          icon: Icons.terminal,
                        ),

                        SizedBox(height: h * 0.06),

                        /// ℹ️ NOTE
                        Center(
                          child: Text(
                            "Don't worry, you can change this later in settings.",
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 12 * scale,
                            ),
                          ),
                        ),

                        SizedBox(height: h * 0.02),

                        /// 🔘 BUTTON
                        SizedBox(
                          width: double.infinity,
                          child: CustomButton(
                            text: "Continue",
                              onPressed: () async {
                                String level = "";

                                if (selectedIndex == 0) level = "Beginner";
                                if (selectedIndex == 1) level = "Intermediate";
                                if (selectedIndex == 2) level = "Advanced";

                                if (level.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("Please select a level")),
                                  );
                                  return;
                                }

                                /// 🔥 خزني الليفل
                                final prefs = await SharedPreferences.getInstance();
                                await prefs.setString("level", level);

                                /// 🔥 ابعتيه للـ API
                                context.read<AuthCubit>().setLevel(level);
                              }
                          ),
                        ),

                        SizedBox(height: h * 0.03),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _optionCard({
    required int index,
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    final isSelected = selectedIndex == index;

    final w = MediaQuery.of(context).size.width;
    final scale = w / 375;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        margin: EdgeInsets.all(w * 0.01),
        padding: EdgeInsets.all(w * 0.05),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary.withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            width: 2,
            color:
                isSelected ? AppColors.primary : Colors.grey.withOpacity(0.2),
          ),
        ),
        child: Row(
          children: [
            Container(
              height: w * 0.13,
              width: w * 0.13,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : const Color(0xFF1F2937),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: isSelected ? Colors.white : AppColors.textSecondary,
              ),
            ),
            SizedBox(width: w * 0.04),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 18 * scale,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 14 * scale,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: w * 0.06,
              width: w * 0.06,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.primary : Colors.grey,
                ),
                color: isSelected ? AppColors.textPrimary : Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
