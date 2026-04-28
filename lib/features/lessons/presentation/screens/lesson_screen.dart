import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../simulation/presentation/screens/simulation_screen.dart';
import '../widgets/header.dart';
import '../../../../core/routing/app_routes.dart';

class LessonsScreen extends StatelessWidget {
  const LessonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: AppColors.backgroundStart,
      appBar:  Header(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 20),

            /// 🔍 Search
            _SearchBar(),

            SizedBox(height: 25),

            /// 🎯 Weekly Goal
            _WeeklyGoal(),

            SizedBox(height: 20),

            /// 📚 Title
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Active Curriculum",
                  style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "View All",
                  style: TextStyle(color: AppColors.primary,fontSize: 14,fontWeight: FontWeight.w700),
                ),
              ],
            ),

            SizedBox(height: 24),

            /// 📦 Cards
            _LessonCard(
              active: true,
              icon: Icons.alternate_email,
              title: "Email Basics",
              subtitle: "Header Analysis • 12 mins",
            ),

            const SizedBox(height: 15),

            _LessonCard(
              icon: Icons.link,
              title: "Advanced URL Spoofing",
              subtitle: "Homograph Attacks • 18 mins",
            ),

            const SizedBox(height: 15),

            _LessonCard(
              icon: Icons.psychology,
              title: "Psychological Triggers",
              subtitle: "Authority & Urgency • 15 mins",
            ),

            const SizedBox(height: 15),

            const _LockedCard(),
          ],
        ),
      ),
    );
  }
}
class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937),
        borderRadius: BorderRadius.circular(14),
      ),
      child:  const Row(
        children: [
          Icon(Icons.search, color: Colors.grey),
          SizedBox(width: 10),
          Text("Find phishing tactics...",
              style: TextStyle(color: AppColors.textSecondary,fontSize: 16)),
        ],
      ),
    );
  }
}
class _WeeklyGoal extends StatelessWidget {
  const _WeeklyGoal();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

         const Text("Weekly Goal",
              style: TextStyle(color: AppColors.textSecondary,fontSize: 14,fontWeight: FontWeight.w500)),

          const SizedBox(height: 8),

          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("1,200 XP to Gold",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    fontSize: 20,
                  )),
              Text("72%", style: TextStyle(color: Colors.white, fontSize: 24,fontWeight: FontWeight.w700)),
            ],
          ),

          const SizedBox(height: 10),

          /// progress bar
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: 0.72,
              minHeight: 10,
              backgroundColor: Colors.grey.withOpacity(0.2),
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 8),

          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("4 of 6 Lessons Today",
                  style: TextStyle(color: Colors.grey, fontSize: 12,fontWeight: FontWeight.w500)),
              Text("+150 XP",
                  style: TextStyle(color: Colors.grey, fontSize: 12,fontWeight: FontWeight.w500)),
            ],
          ),
        ],
      ),
    );
  }
}
class _LessonCard extends StatelessWidget {
  final bool active;
  final IconData icon;
  final String title;
  final String subtitle;

  const _LessonCard({
    super.key,
    this.active = false,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1C2127), // 👈 لون الكارد ثابت
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// 🔹 TOP ROW
          Row(
            children: [

              /// 🔵 ICON BOX
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: active
                      ? const Color(0xFF2F80ED) // 🔵 Active
                      : const Color(0xFF2A3138), // ⚫ عادي
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: active ? AppColors.textPrimary : AppColors.textSecondary, // 👈 هنا
                ),
              ),

              const SizedBox(width: 12),

              /// 🔹 TEXT
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                       color:  AppColors.textPrimary,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,

                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                      color:   AppColors.textSecondary,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              /// 🟢 STATUS
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: active
                      ? const Color(0xFF0BDA5B).withOpacity(0.15)
                      : const Color(0xFF2A3138),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (active)
                      const Icon(Icons.check_circle,
                          color: Color(0xFF0BDA5B), size: 12),
                    if (active) const SizedBox(width: 4),
                    Text(
                      active ? "Active" : "Not Started",
                      style: TextStyle(
                        color: active
                            ? const Color(0xFF0BDA5B)
                            : AppColors.textSecondary,
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          /// 🔹 PROGRESS + %
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Progress",
                  style: TextStyle(color: AppColors.textSecondary, fontSize: 12)),
              Text(
                active ? "60%" : "0%",
                style: const TextStyle(
                    color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w700),
              ),
            ],
          ),

          const SizedBox(height: 6),

          /// 🔹 PROGRESS BAR
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: active ? 0.6 : 0,
              minHeight: 6,
              backgroundColor: Colors.white.withOpacity(0.1),
              color: const Color(0xFF2F80ED),
            ),
          ),

          const SizedBox(height: 14),

          /// 🔹 BUTTON + BOOKMARK
          /// 🔹 BUTTON + BOOKMARK
          Row(
            children: [

              /// 🔵 BUTTON
              Expanded(
                child: SizedBox(
                  height: 45,
                  child: ElevatedButton(
    onPressed: () {
    Navigator.pushNamed(context, AppRoutes.simulation);
    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: active
                          ? const Color(0xFF2F80ED)
                          : const Color(0xFF2A3138),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          active ? "Resume Lesson" : "Start Module",
                          style: TextStyle(
                            color: active ? Colors.white : Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        if (active) ...[
                          const SizedBox(width: 6),
                          const Icon(
                            Icons.play_arrow,
                            size: 14,
                            color: Colors.white,
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ), // 👈 مهم جدًا

              /// 🔖 BOOKMARK
              if (active) ...[
                const SizedBox(width: 10),
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: const Color(0xFF2A3138),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.bookmark,
                    color: Colors.white,
                  ),
                ),
              ],
            ],
          )
        ],
      ),
    );
  }
}
class _LockedCard extends StatelessWidget {
  const _LockedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1C2127),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [

          /// 🔹 TITLE
          Row(
            children: [

              /// 🔵 ICON BOX زي باقي الكروت
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFF2A3138), // نفس لون الباقي
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.lock,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(width: 10),

              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Attachment Safety",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "Macros & Extensions • 20 mins",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),

          /// 🔒 BOX
          Container(
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFF0F172A66),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.lock, size: 16, color: Colors.grey),
                SizedBox(height: 4),
                Text(
                  "Unlock at Level 05",
                  style: TextStyle(color: Colors.grey, fontSize: 11),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}