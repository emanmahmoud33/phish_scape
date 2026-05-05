import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../auth/data/services/auth_service.dart';
import '../../logic/lesson_cubit.dart';
import '../../logic/lesson_state.dart';
import '../widgets/header.dart';
import '../../../../core/routing/app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class LessonsScreen extends StatelessWidget {
  const LessonsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;
    final scale = w / 375;

     return BlocProvider(
      create: (_) => LessonCubit(AuthService())..getLessons(),

      child:  Scaffold(
        backgroundColor: AppColors.backgroundStart,
        appBar: Header(),

        body: BlocBuilder<LessonCubit, LessonState>(
      builder: (context, state) {
        print("STATE: $state");

        if (state is LessonLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is LessonError) {
          return Center(child: Text(state.error));
        }

        if (state is LessonSuccess) {

          if (state.lessons.isEmpty) {
            return const Center(child: Text("No lessons"));
          }

          return ListView(
            padding: EdgeInsets.all(w * 0.04),
            children: [

              SizedBox(height: h * 0.025),

               _SearchBar(),

              SizedBox(height: h * 0.03),

               _WeeklyGoal(),

              SizedBox(height: h * 0.025),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Active Curriculum",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 18 * scale,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "View All",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 14 * scale,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),

              SizedBox(height: h * 0.03),

              /// ✅ الحل هنا (null safe)
              ...state.lessons.map((lesson) {
                return Padding(
                  padding: EdgeInsets.only(bottom: h * 0.02),
                  child: _LessonCard(
                    icon: Icons.link,
                    title: lesson.title ?? "",
                    subtitle: lesson.description ?? "",
                    active: true,
                  ),
                );
              }).toList(),

              SizedBox(height: h * 0.02),

              const _LockedCard(),
            ],
          );
        }

        return const SizedBox();
      },
      ),
      ));

  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: w * 0.03),
      decoration: BoxDecoration(
        color: const Color(0xFF1C2127), // نفس لون الكارد في الصورة
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [

          /// 🔍 أيقونة جوه الكارد
          const Icon(
            Icons.search,
            color: AppColors.textSecondary,
            size: 20,
          ),

          SizedBox(width: w * 0.025),

          /// 🔥 input ياخد باقي المساحة
          Expanded(
            child: TextField(
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),

              onChanged: (value) {
                context.read<LessonCubit>().search(value);
              },

              decoration: const InputDecoration(
                hintText: "Find phishing tactics...",
                hintStyle: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 14,
                ),
                border: InputBorder.none,
                isDense: true, // 👈 مهم عشان يقلل الارتفاع
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WeeklyGoal extends StatelessWidget {
  const _WeeklyGoal();

  @override
  Widget build(BuildContext context) {

    final w = MediaQuery.of(context).size.width;
    final scale = w / 375;

    return Padding(
      padding: EdgeInsets.all(w * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text("Weekly Goal",
              style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 14 * scale,
                  fontWeight: FontWeight.w500)),

          SizedBox(height: w * 0.02),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("1,200 XP to Gold",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20 * scale)),
              Text("72%",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24 * scale,
                      fontWeight: FontWeight.w700)),
            ],
          ),

          SizedBox(height: w * 0.025),

          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: 0.72,
              minHeight: w * 0.02,
              backgroundColor: Colors.grey.withOpacity(0.2),
              color: Colors.white,
            ),
          ),

          SizedBox(height: w * 0.02),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("4 of 6 Lessons Today",
                  style: TextStyle(color: Colors.grey, fontSize: 12 * scale)),
              Text("+150 XP",
                  style: TextStyle(color: Colors.grey, fontSize: 12 * scale)),
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
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    final scale = w / 375;

    return Container(
      padding: EdgeInsets.all(w * 0.04),
      decoration: BoxDecoration(
        color: const Color(0xFF1C2127),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [

              Container(
                height: w * 0.12,
                width: w * 0.12,
                decoration: BoxDecoration(
                  color: active
                      ? const Color(0xFF2F80ED)
                      : const Color(0xFF2A3138),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: active
                      ? AppColors.textPrimary
                      : AppColors.textSecondary,
                ),
              ),

              SizedBox(width: w * 0.03),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title, // ✅ بدون !
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w700,
                        fontSize: 16 * scale,
                      ),
                    ),
                    SizedBox(height: h * 0.005),
                    Text(
                      subtitle, // ✅ بدون !
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12 * scale,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: w * 0.025,
                  vertical: w * 0.01,
                ),
                decoration: BoxDecoration(
                  color: active
                      ? const Color(0xFF0BDA5B).withOpacity(0.15)
                      : const Color(0xFF2A3138),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  active ? "Active" : "Not Started",
                  style: TextStyle(
                    color: active
                        ? const Color(0xFF0BDA5B)
                        : AppColors.textSecondary,
                    fontSize: 10 * scale,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: h * 0.015),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Progress",
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12 * scale,
                ),
              ),
              Text(
                active ? "60%" : "0%",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12 * scale,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),

          SizedBox(height: h * 0.008),

          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: active ? 0.6 : 0,
              minHeight: h * 0.008,
              backgroundColor: Colors.white.withOpacity(0.1),
              color: const Color(0xFF2F80ED),
            ),
          ),

          SizedBox(height: h * 0.015),

          Row(
            children: [

              Expanded(
                child: SizedBox(
                  height: h * 0.06,
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
                          SizedBox(width: w * 0.015),
                          const Icon(Icons.play_arrow, size: 14, color: Colors.white),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LockedCard extends StatelessWidget {
  const _LockedCard({super.key});

  @override
  Widget build(BuildContext context) {

    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    final scale = w / 375;

    return Container(
      padding: EdgeInsets.all(w * 0.04),
      decoration: BoxDecoration(
        color: const Color(0xFF1C2127),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [

          Row(
            children: [

              Container(
                height: w * 0.12,
                width: w * 0.12,
                decoration: BoxDecoration(
                  color: const Color(0xFF2A3138),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.lock, color: Colors.grey),
              ),

              SizedBox(width: w * 0.03),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Attachment Safety",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 16 * scale,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "Macros & Extensions • 20 mins",
                    style: TextStyle(
                      fontSize: 12 * scale,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: h * 0.02),

          Container(
            height: h * 0.06,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFF0F172A66),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              "Unlock at Level 05",
              style: TextStyle(color: Colors.grey, fontSize: 11 * scale),
            ),
          ),
        ],
      ),
    );
  }
}


