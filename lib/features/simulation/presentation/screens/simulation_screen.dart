import 'package:flutter/material.dart';
import 'package:phish_scape/core/theme/app_colors.dart';
import 'package:phish_scape/features/auth/presentation/widgets/custom_button.dart';

import '../../../analysis/presentation/screens/analysis_screen.dart';

class SimulationScreen extends StatefulWidget {
  const SimulationScreen({super.key});

  @override
  State<SimulationScreen> createState() => _SimulationScreenState();
}

class _SimulationScreenState extends State<SimulationScreen> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      backgroundColor: AppColors.backgroundStart,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundStart,
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: height * 0.08,
        flexibleSpace: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            child: Row(
              children: [
                const Icon(Icons.arrow_back_ios, color: AppColors.primary),
                const SizedBox(width: 10),
                const Expanded(
                  child: Center(
                    child: Text(
                      "Simulation: Email 3 of 10",
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const Icon(Icons.info_rounded,
                    color: AppColors.primary, size: 22),
              ],
            ),
          ),
        ),
      ),

      /// 🔥 الحل هنا (scroll)
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(width * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: height * 0.02),

                /// 🔹 PROGRESS
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Training Progress",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.2)),
                    Text("30% Completed",
                        style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 12,
                            fontWeight: FontWeight.w700)),
                  ],
                ),

                const SizedBox(height: 8),

                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: const LinearProgressIndicator(
                    value: 0.3,
                    minHeight: 8,
                    backgroundColor: Color(0xFF1F2937),
                    color: AppColors.primary,
                  ),
                ),

                SizedBox(height: height * 0.06),

                /// 🔹 CARD
                Container(
                  padding: EdgeInsets.all(width * 0.04),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.backgroundStart,
                    border: Border.all(
                      color: AppColors.textSecondary.withOpacity(0.03),
                      width: 5,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      /// EMAIL ANALYSIS
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 4,
                            backgroundColor: AppColors.primary,
                          ),
                          const SizedBox(width: 6),
                          const Text(
                            "EMAIL ANALYSIS",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w700,
                                fontSize: 10,
                                letterSpacing: 1),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      /// QUESTION
                      const Text(
                        "Which of the following URLs is an example of a Homograph Attack?",
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      const SizedBox(height: 20),

                      /// URL BOX
                      Container(
                        height: height * 0.09,
                        width: double.infinity,
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0D131B),
                          border: Border.all(
                              color: AppColors.primary.withOpacity(0.3)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            '"ww.test.com"',
                            style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      const Center(
                        child: Text(
                          "EXAMINE THE CHARACTERS CAREFULLY",
                          style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 10,
                              letterSpacing: 1),
                        ),
                      ),

                      const SizedBox(height: 20),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "SELECT THE MOST ACCURATE RESPONSE",
                            style: TextStyle(
                                color: AppColors.textSecondary,
                                fontSize: 10,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w700),
                          ),
                          Divider(thickness: .7),
                        ],
                      ),

                      const SizedBox(height: 12),

                      /// OPTIONS
                      _optionTile(
                          "The first character is \"w\" instead of \"www\"",
                          "A",
                          0),

                      const SizedBox(height: 10),

                      _optionTile(
                          "It uses a Cyrillic \"a\" that looks like Latin \"a\"",
                          "B",
                          1),

                      const SizedBox(height: 10),

                      _optionTile(
                          "The domain name is spelled correctly", "C", 2),
                    ],
                  ),
                ),

                SizedBox(height: height * 0.04),

                /// 🔵 BUTTON
                CustomButton(
                  text: 'SUBMIT ANSWER',
                    onPressed: (){Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const AnalysisScreen(),
                      ),
                    );}
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _optionTile(String text, String label, int index) {
    final selected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        height: 74,
        width: double.infinity, // 👈 مهم
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF0D131B),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: selected
                ? AppColors.primary.withOpacity(0.7)
                : Colors.transparent,
          ),
        ),
        child: Row(
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: selected ? AppColors.primary: Colors.grey,
                ),
              ),
              child: selected
                  ?  Center(
                child: CircleAvatar(
                  radius: 5,
                  backgroundColor: AppColors.primary,
                ),
              )
                  : null,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
            Text(
              label,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}