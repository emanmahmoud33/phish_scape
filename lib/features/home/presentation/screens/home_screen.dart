
import 'package:flutter/material.dart';
import 'package:phish_scape/features/auth/presentation/widgets/custom_button.dart';
import 'package:phish_scape/features/lessons/presentation/widgets/header.dart';
import 'package:phish_scape/features/onboarding/presentation/screens/simulate_screen.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../lessons/presentation/screens/lesson_screen.dart';
import '../../../profile/screens/profile_screen.dart';
import '../../../simulation/presentation/screens/simulation_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
        backgroundColor: const Color(0xFF081826),
    body: SingleChildScrollView(
    child: Column(
    children: [

    /// BODY
    Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
    children: [
      SizedBox(
        height: 220, // 👈 أكبر من الدائرة
        width: 220,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none, // 👈 مهم جدًا
          children: [

            /// 🔵 الدائرة
            Container(
              height: 155,
              width: 155,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.primary,
                  width: 9,
                ),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "99%",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Secure",
                    style: TextStyle(
                      color: Colors.greenAccent,
                    ),
                  ),
                ],
              ),
            ),

            /// 🔥 7 Days (المكان الصح)
            Positioned(
              top: 10,
              right: -50,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFF102B47),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.local_fire_department,
                      size: 14,
                      color:  AppColors.primary,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "7 Days",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

    const SizedBox(height: 20),

    const Text(
    "Your Phish Shield is Strong",
    style: TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
      fontSize: 16
    ),
    ),
    const SizedBox(height: 5),
    const Text(
    "Improve your score by completing lessons",
    style: TextStyle(color: Colors.grey,fontSize: 14),
    ),

    const SizedBox(height: 30),

    /// 📊 STATS
       Row(
        children: [
          Expanded(
            child: _statCard(
              "Simulations",
              "24 / 25",
              Icons.verified_user,
              iconColor: Color(0xFF13AE9D), // 👈 الأول
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _statCard(
              "Rank",
              "Top 5%",
              Icons.military_tech,
              iconColor: AppColors.primary, // 👈 التاني
            ),
          ),
        ],
      ),

    const SizedBox(height: 30),

    /// 🔥 PHISH CARD
    const Align(
    alignment: Alignment.centerLeft,
    child: Text(
    "Phish of the Day",
    style: TextStyle(
      fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.bold,
    ),
    ),
    ),

    const SizedBox(height: 10),

    Container(
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
        color:const Color(0xFF1C2127),
    borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
    children: [

    /// IMAGE
    ClipRRect(
    borderRadius: BorderRadius.circular(12),
    child: Image.asset(
    "assets/images/home.png",
    height: 137,
    width:288,
    // width: double.infinity,
    fit: BoxFit.cover,
    ),
    ),

    const SizedBox(height: 10),
      Row(
        children: [
          const Expanded(
            child: Text(
              "Urgent: Microsoft Account Reset",
              style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 35,
            padding:  const EdgeInsets.all(6),
            decoration:  BoxDecoration(
              color: Colors.red.withOpacity(0.2),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Center(
              child: Text(
                "HIGH RISK",
                style: TextStyle(
                    color: Colors.red, fontSize: 10,fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),

      const SizedBox(height: 10),

      const Text(
        "Analyze this suspicious email attempt. Can you spot the hidden red flags?",
        style: TextStyle(color: Colors.grey,fontSize: 14),
      ),

      const SizedBox(height: 10),

       CustomButton(text: 'Analyze Now', onPressed: () {  Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const LessonsScreen(),
        ),
      );},)
    ],
    ),
    ),

      const SizedBox(height: 30),

      /// 📚 RECOMMENDED
     const Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: const [
         Text(
           "Recommended",
           style: TextStyle(
             color: Colors.white,
             fontSize: 20,
             fontWeight: FontWeight.w700,
           ),
         ),
         Text(
           "See All",
           style: TextStyle(
             color: AppColors.primary,
             fontWeight: FontWeight.w700
             ,fontSize: 14
           ),
         ),
       ],
     ),

      const SizedBox(height: 10),

      _lessonCard(
        title: "URL Masking Techniques",
        time: "10 min",
        level: "Intermediate",
        color:AppColors.primary,
        icon: Icons.link,
      ),

      _lessonCard(
        title: "Social Engineering 101",
        time: "15 min",
        level: "Beginner",
        color: Colors.purple,
        icon: Icons.psychology,
      ),

      _lessonCard(
        title: "Attachment Safety",
        time: "8 min",
        level: "Advanced",
        color: Colors.orange,
        icon: Icons.mail_lock,
      ),
    ],
    ),
    ),
    ],
    ),
    ),
    );
  }

  /// 🔵 ICON CIRCLE
  static Widget _circleIcon(IconData icon) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.08),
      ),
      child: Icon(icon, color: Colors.white, size: 20),
    );
  }

  /// 📊 STAT CARD
  Widget _statCard(
      String title,
      String value,
      IconData icon, {
        Color iconColor = AppColors.primary, // default
      }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color:Color(0xFF1C2127),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12
            ),
          ),


          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                icon,
                color: iconColor, // 👈 هنا
                size: 25,
              ),
            ],
          ),
        ],
      ),
    );
  }
  /// 📚 LESSON CARD
  Widget _lessonCard({
    required String title,
    required String time,
    required String level,
    required Color color,
    required IconData icon,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color:Color(0xFF1C2127),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [

          /// 🔹 الصف الأساسي
          Row(
            children: [

              /// Icon Box
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color),
              ),

              const SizedBox(width: 12),

              /// Texts
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 6),

                    Row(
                      children: [
                        const Icon(Icons.access_time,
                            size: 14, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text(
                          time,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Icon(Icons.star,
                            size: 14, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text(
                          level,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              /// Play
              const Icon(Icons.play_circle_fill, color: Colors.grey),
            ],
          ),

          const SizedBox(height: 12),

          /// 🔵 Progress Bar
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: 0.6, // 👈 تقدري تغيريها
              backgroundColor: Colors.grey.withOpacity(0.2),
              color: color,
              minHeight: 4,
            ),
          ),
        ],
      ),
    );
  }
}