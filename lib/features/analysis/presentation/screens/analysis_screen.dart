import 'package:flutter/material.dart';
import 'package:phish_scape/core/theme/app_colors.dart';
import 'package:phish_scape/features/auth/presentation/widgets/custom_button.dart';
import 'package:phish_scape/features/setting/presentation/Setting_Screen.dart';

import '../../../auth/presentation/widgets/custom_app_bar.dart';
import '../../../chatbot/presentation/screens/chat_bot_screen.dart';

class AnalysisScreen extends StatelessWidget {
  const AnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final h = size.height;
    final w = size.width;

    return Scaffold(
      appBar: const CustomAppBar(
      title: "Analysis",
    ),
      backgroundColor: AppColors.backgroundStart,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(w * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                /// 🔹 PROGRESS
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Training Progress",
                        style: TextStyle(color: Colors.grey, fontSize: 12,letterSpacing: 1.2,fontWeight: FontWeight.w700)),
                    Text("100% Completed",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w600)),
                  ],
                ),

                const SizedBox(height: 10),

                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: const LinearProgressIndicator(
                    value: 1,
                    minHeight: 6,
                    backgroundColor: Color(0xFF1F2937),
                    color: Colors.blue,
                  ),
                ),

                SizedBox(height: h * 0.04),

                /// 🔹 TITLE
                const Text("ASSESSMENT COMPLETE",
                    style: TextStyle(
                        color: Color(0xFFB4C5FF),
                        fontSize: 12,
                        letterSpacing: 1.2,fontWeight: FontWeight.w700)),

                const SizedBox(height: 6),

                const Text("MISSION COMPLETED",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w700)),

                SizedBox(height: h * 0.04),

                /// 🔵 CIRCLE
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [

                    Container(
                      height: w * 0.6,
                      width: w * 0.6,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color:Color(0xFF22C35D),
                          width: 20,
                        ),
                      ),
                    ),

                    const  Column(
                      children:  [
                        Text("100%",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.w700)),
                        SizedBox(height: 4),
                        Text("ACCURACY",
                            style: TextStyle(
                                color:Color(0xFF22C35D), fontSize: 12)),
                      ],
                    ),

                    Positioned(
                      top: -10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: Color(0xFF22C35D),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "PERFECT SCORE",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: h * 0.04),

                /// 🔹 STATS GRID
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.6,
                  children: const [
                    _StatCard("TOTAL SCORE", "100", icon: Icons.military_tech, iconColor: Color(0xFFB4C5FF),),
                    _StatCard("QUESTIONS", "10", icon:Icons.quiz_outlined, iconColor: AppColors.textSecondary,),
                    _StatCard("PASSED", "10", isGreen: true, icon: Icons.check_circle, iconColor: Colors.green,),
                    _StatCard("FAILED", "00", icon: Icons.cancel_outlined, iconColor: Color(0xFF70595E),),
                  ],
                ),

                SizedBox(height: h * 0.03),

                /// 🔹 INSIGHT
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF16202D),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.analytics_outlined,
                          color: Colors.white,size: 25,),
                      ),
                      const SizedBox(width: 12),
                       Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Performance Insight',style:
                        TextStyle(color: AppColors.textPrimary,fontSize: 14,fontWeight: FontWeight.w400)),
                            Text(
                              "Exceptional threat detection capability demonstrated.\nReady for higher-tier operations.",
                              style:
                              TextStyle(color: AppColors.textSecondary, fontSize: 12,fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                SizedBox(height: h * 0.04),

                /// 🔵 BUTTON
                SizedBox(
                  width: double.infinity,
                  height: h * 0.06,
                  child: CustomButton(text: 'CONTINUE TO NEXT PHASE', onPressed: () {
                    Navigator.pop(context);
                  }),
                ),

                const SizedBox(height: 12),

                /// 🔘 SECOND BUTTON
                SizedBox(

                  width: double.infinity,
                  height: h * 0.06,
                  child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    style: OutlinedButton.styleFrom(
                      side:  BorderSide(color: AppColors.textSecondary.withOpacity(0.2)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.refresh,size:20 ,color: AppColors.textPrimary),
                        SizedBox(width: 8,),
                        Text("RE-EVALUATE MODULE",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: AppColors.textPrimary),),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final bool isGreen;
  final IconData icon;
  final Color iconColor;

  const _StatCard(
      this.title,
      this.value, {
        this.isGreen = false,
        required this.icon,
        required this.iconColor,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isGreen
            ? const Color(0xFF112124)
            : const Color(0xFF16202D),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// 🔹 TOP ROW
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: isGreen
                      ? Colors.green
                      : AppColors.textSecondary,
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Icon(icon, color: iconColor),
            ],
          ),

          const Spacer(), // 👈 جوه Column

          /// 🔹 VALUE
          Text(
            value,
            style: TextStyle(
              color: isGreen ? Colors.green : Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}