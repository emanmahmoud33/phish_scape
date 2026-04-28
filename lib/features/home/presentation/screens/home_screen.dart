import 'package:flutter/material.dart';
import 'package:phish_scape/features/auth/presentation/widgets/custom_button.dart';
import 'package:phish_scape/features/lessons/presentation/widgets/header.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;
    final scale = w / 375;

    return Scaffold(
      appBar: const Header(),
      backgroundColor: AppColors.backgroundStart,

      body: SingleChildScrollView(
        child: Column(
          children: [

            Padding(
              padding: EdgeInsets.all(w * 0.05),
              child: Column(
                children: [

                  /// 🔵 CIRCLE
                  SizedBox(
                    height: w * 0.55,
                    width: w * 0.55,
                    child: Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [

                        Container(
                          height: w * 0.4,
                          width: w * 0.4,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.primary,
                              width: w * 0.025,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "99%",
                                style: TextStyle(
                                  fontSize: 32 * scale,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              const Text(
                                "Secure",
                                style: TextStyle(
                                  color: Colors.greenAccent,
                                ),
                              ),
                            ],
                          ),
                        ),

                        /// 🔥 7 DAYS
                        Positioned(
                          top: h * 0.015,
                          right: -w * 0.12,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: w * 0.04,
                              vertical: h * 0.008,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF102B47),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.local_fire_department,
                                  size: w * 0.035,
                                  color: AppColors.primary,
                                ),
                                SizedBox(width: w * 0.01),
                                Text(
                                  "7 Days",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12 * scale,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: h * 0.025),

                  Text(
                    "Your Phish Shield is Strong",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16 * scale,
                    ),
                  ),

                  SizedBox(height: h * 0.008),

                  Text(
                    "Improve your score by completing lessons",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14 * scale,
                    ),
                  ),

                  SizedBox(height: h * 0.035),

                  /// 📊 STATS
                  Row(
                    children: [
                      Expanded(
                        child: _statCard(
                          "Simulations",
                          "24 / 25",
                          Icons.verified_user,
                          w,
                          scale,
                          iconColor: const Color(0xFF13AE9D),
                        ),
                      ),
                      SizedBox(width: w * 0.03),
                      Expanded(
                        child: _statCard(
                          "Rank",
                          "Top 5%",
                          Icons.military_tech,
                          w,
                          scale,
                          iconColor: AppColors.primary,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: h * 0.035),

                  /// 🔥 PHISH CARD
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Phish of the Day",
                      style: TextStyle(
                        fontSize: 20 * scale,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  SizedBox(height: h * 0.015),

                  Container(
                    padding: EdgeInsets.all(w * 0.04),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1C2127),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [

                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            "assets/images/home.png",
                            height: h * 0.18,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),

                        SizedBox(height: h * 0.015),

                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Urgent: Microsoft Account Reset",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18 * scale,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              height: h * 0.045,
                              padding: EdgeInsets.all(w * 0.015),
                              decoration: BoxDecoration(
                                color: Colors.red.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Center(
                                child: Text(
                                  "HIGH RISK",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 10 * scale,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: h * 0.01),

                        Text(
                          "Analyze this suspicious email attempt. Can you spot the hidden red flags?",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14 * scale,
                          ),
                        ),

                        SizedBox(height: h * 0.015),

                        CustomButton(
                          text: 'Analyze Now',
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoutes.simulation);
                          },
                        )
                      ],
                    ),
                  ),

                  SizedBox(height: h * 0.04),

                  /// 📚 LESSONS
                  _lessonCard(
                    title: "URL Masking Techniques",
                    time: "10 min",
                    level: "Intermediate",
                    color: AppColors.primary,
                    icon: Icons.link,
                    w: w,
                    h: h,
                    scale: scale,
                  ),

                  _lessonCard(
                    title: "Social Engineering 101",
                    time: "15 min",
                    level: "Beginner",
                    color: Colors.purple,
                    icon: Icons.psychology,
                    w: w,
                    h: h,
                    scale: scale,
                  ),

                  _lessonCard(
                    title: "Attachment Safety",
                    time: "8 min",
                    level: "Advanced",
                    color: Colors.orange,
                    icon: Icons.mail_lock,
                    w: w,
                    h: h,
                    scale: scale,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 📊 STAT CARD
  Widget _statCard(
      String title,
      String value,
      IconData icon,
      double w,
      double scale, {
        Color iconColor = AppColors.primary,
      }) {
    return Container(
      padding: EdgeInsets.all(w * 0.04),
      decoration: BoxDecoration(
        color: const Color(0xFF1C2127),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            title,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12 * scale,
            ),
          ),

          SizedBox(height: w * 0.02),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20 * scale,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                icon,
                color: iconColor,
                size: w * 0.06,
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
    required double w,
    required double h,
    required double scale,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: h * 0.02),
      padding: EdgeInsets.all(w * 0.035),
      decoration: BoxDecoration(
        color: const Color(0xFF1C2127),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [

          Row(
            children: [

              Container(
                height: w * 0.12,
                width: w * 0.12,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color),
              ),

              SizedBox(width: w * 0.03),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14 * scale,
                      ),
                    ),
                    SizedBox(height: h * 0.008),

                    Row(
                      children: [
                        Icon(Icons.access_time,
                            size: w * 0.035, color: Colors.grey),
                        SizedBox(width: w * 0.01),
                        Text(
                          time,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12 * scale,
                          ),
                        ),
                        SizedBox(width: w * 0.02),
                        Icon(Icons.star,
                            size: w * 0.035, color: Colors.grey),
                        SizedBox(width: w * 0.01),
                        Text(
                          level,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12 * scale,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Icon(Icons.play_circle_fill,
                  color: Colors.grey, size: w * 0.06),
            ],
          ),

          SizedBox(height: h * 0.012),

          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: 0.6,
              backgroundColor: Colors.grey.withOpacity(0.2),
              color: color,
              minHeight: h * 0.006,
            ),
          ),
        ],
      ),
    );
  }
}