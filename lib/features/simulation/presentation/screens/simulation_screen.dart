import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
class SimulationScreen extends StatelessWidget {
  const SimulationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: AppColors.backgroundStart,
    body: SafeArea(
    child: Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
    children: [

    /// 🔙 HEADER
   const Row(
    children: [
    Icon(Icons.arrow_back_ios, color: AppColors.primary),
    const SizedBox(width: 10),

    const Expanded(
    child: Center(
      child: Text(
      "Simulation: Email 3 of 10",
      style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w700,
        fontSize: 18
      ),
      ),
    ),
    ),

    Icon(Icons.info_rounded, color: AppColors.primary,size: 24,),
    ],
    ),

    const SizedBox(height: 20),

    /// 🔵 PROGRESS
   const Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children:  [
    Text("Training Progress",
    style: TextStyle(color: AppColors.textSecondary,letterSpacing: 1.2,fontWeight: FontWeight.w700,fontSize: 12)),
    Text("30% Completed",
    style: TextStyle(color: AppColors.primary,fontWeight: FontWeight.w700,fontSize: 12)),
    ],
    ),

    const SizedBox(height: 10),

    ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child:const LinearProgressIndicator(
    value: 0.3,
    backgroundColor:Color(0xFF1C2127),
    color: AppColors.primary,
    minHeight: 8,
    ),
    ),

    const SizedBox(height: 20),

    /// 📝 DESCRIPTION
    const Text(
    "Analyze the email below. Is this a legitimate message or a phishing attempt?",
    textAlign: TextAlign.center,
    style: TextStyle(color:AppColors.textSecondary,fontSize: 14,fontWeight: FontWeight.w500),
    ),

    const SizedBox(height: 20),

    /// 📩 EMAIL CARD
    Expanded(
    child: SingleChildScrollView(
    child: Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
    color: const Color(0xFF1C2127),
    borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

    /// FROM
   const Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: const [
    Text("From:",
    style: TextStyle(color: AppColors.textSecondary,fontWeight: FontWeight.w400,fontSize: 12)),
    Text("2m ago",
    style: TextStyle(color: AppColors.textSecondary,fontWeight: FontWeight.w500,fontSize: 10)),
    ],
    ),

    const SizedBox(height: 5),

    const Text(
    "Amazon Security Center",
    style: TextStyle(
    color:AppColors.textPrimary,
    fontWeight: FontWeight.w700,
      fontSize: 14
    ),
    ),

    const Text(
    "<security-alert@amzn-verify.com>",

    style: TextStyle(
    color: AppColors.primary,
    fontSize: 12,
      fontWeight: FontWeight.w400
    ),
    ),

    const SizedBox(height: 15),
    /// SUBJECT
    const Text("Subject:",
    style: TextStyle(color:AppColors.textSecondary,fontSize: 12)),

    const SizedBox(height: 5),

    const Text(
    "Action Required: Your account will be suspended",
    style: TextStyle(
    color: AppColors.textPrimary,
    fontWeight: FontWeight.w700,
    ),
    ),

    const SizedBox(height: 15),

    /// IMAGE
    ClipRRect(
    borderRadius: BorderRadius.circular(100),
    child: SvgPicture.asset(
      "assets/images/amazon.svg",
      height: width * 0.4,
      width: double.infinity,
      fit: BoxFit.cover,
    ),
    ),

    const SizedBox(height: 20),

    /// BODY
    const Text(
    "Dear Customer,\n\n"
    "We've detected unusual activity on your account from an unrecognized device in Moscow, Russia. "
    "For your protection, your account access has been restricted.\n",
    style: TextStyle(color: Colors.grey),
    ),

    Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
    color: Colors.red.withOpacity(0.1),
    borderRadius: BorderRadius.circular(10),
    ),
    child: const Text(
    "URGENT: Your account will be permanently suspended in 2 hours if you do not verify your information.",
    style: TextStyle(
    color: Colors.red,
    fontWeight: FontWeight.w500,
    ),
    ),
    ),

    const SizedBox(height: 15),

    const Text(
    "Please click the button below to verify your identity immediately to avoid permanent data loss.",
    style: TextStyle(color: Colors.grey),
    ),

    const SizedBox(height: 20),

    /// BUTTON
    Center(
    child: SizedBox(
    width: width * 0.6,
    height: 45,
    child: ElevatedButton(
    style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
    ),
    ),
    onPressed: () {},
    child: const Text("Verify Account Now"),
    ),
    ),
    ),

    const SizedBox(height: 20),

    const Center(
    child: Text(
    "If you did not request this, please ignore this email.",
    style: TextStyle(
    color: Colors.grey,
    fontSize: 11,
    ),
    textAlign: TextAlign.center,
    ),
    ),
    ],
    ),
    ),
    ),
    ),

    const SizedBox(height: 10),
      /// 🔘 ACTION BUTTONS
      Row(
        children: [
          Expanded(
            child: Container(
              height: 55,
              decoration: BoxDecoration(
                color: const Color(0xFF1F2937),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Text(
                  "Safe",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              height: 55,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Text(
                  "Phish",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    ],
    ),
    ),
    ),
    );
  }
}