import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../auth/presentation/widgets/custom_app_bar.dart';
import '../../../../core/routing/app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../auth/data/services/auth_service.dart';
import '../logic/profile_cubit.dart';
import '../logic/profile_state.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (_) => ProfileCubit(AuthService())..getProfileStats(),

      child: Scaffold(

        backgroundColor: const Color(0xFF081826),
          body: BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {

                if (state is ProfileLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is ProfileError) {
                  return Center(
                    child: Text(state.error, style: const TextStyle(
                      color: Colors.white,
                    ),),
                  );
                }

                if (state is ProfileSuccess) {

                  final stats = state.stats;

                  return  SafeArea(
    child: SingleChildScrollView(
    padding: const EdgeInsets.all(20),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      /// 🔙 HEADER
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          /// 🔙 BACK BUTTON (InkWell)
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                } else {
                  Navigator.pushReplacementNamed(context, AppRoutes.main);
                }
              },
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),

          /// 🔤 TITLE
          const Text(
            "Security Score & Stats",
            style: TextStyle(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),

          /// 🔗 SHARE ICON (خليها clickable لو عايزة)
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                print("share");
              },
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Icon(
                  Icons.share,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
        ],
      ),

    const SizedBox(height: 20),

    /// 🔢 TOP CARDS
    Row(
    children: [
    Expanded(
    child: _topCard(
    title: "Security Score",
        value: stats.securityScore.toString(),
    sub: "/100",
    extra: "+12% vs last week",
      icon: Icons.trending_up,
        valueColor: AppColors.primary
    ),
    ),
    const SizedBox(width: 12),
    Expanded(
    child: _topCard(
    title: "Global Rank",
        value: stats.globalRank,
    sub: "",
    extra: "Expert Level",
      icon: Icons.workspace_premium,
        valueColor: AppColors.textPrimary
    ),
    ),
    ],
    ),

    const SizedBox(height: 25),

    /// 📊 TITLE
    const Text(
    "Detection Accuracy",
    style: TextStyle(
    color: AppColors.textPrimary,
    fontSize: 22,
    fontWeight: FontWeight.w700,
    ),
    ),
    const SizedBox(height: 5),
    const Text(
    "Performance over last 30 days",
    style: TextStyle(color: AppColors.textSecondary,fontSize: 14,fontWeight: FontWeight.w400),
    ),

    const SizedBox(height: 15),

    /// 📊 CHART BOX (UI بس)
      Container(
        height: width * 0.6,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1A242E),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [

            /// 🔵 النسبة
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "92%",
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            /// 🟢 Current Average
            const Positioned(
              top: 40,
              left: 0,
              child: Row(
                children: [
                  Text(
                    "Current Average",
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(width: 3),
                  Text(
                    '+5.4%',
                    style: TextStyle(color: Color(0xFF0BDA5B)),
                  ),
                ],
              ),
            ),

            /// 📊 الأيقونة فوق يمين
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 40,
                height: 46.67,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.analytics,
                  color: AppColors.primary,
                  size: 20,
                ),
              ),
            ),

            /// 📉 خط مؤقت (الشارت)
            Positioned.fill(
              top: 80,
              child: Column(
                children: [

                  /// 📊 الخط (Fake)
                  Expanded(
                    child: CustomPaint(
                      painter: ChartPainter(),
                      child: Container(),
                    ),
                  ),

                  const SizedBox(height: 10),

                  /// 📅 التواريخ
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("MAY 01", style: TextStyle(color: Colors.grey, fontSize: 10)),
                      Text("MAY 15", style: TextStyle(color: Colors.grey, fontSize: 10)),
                      Text("TODAY", style: TextStyle(color: Colors.grey, fontSize: 10)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    const SizedBox(height: 25),
      /// 🏆 BADGES
      const Text(
        "Earned Badges",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),

      const SizedBox(height: 1),
      const Text(
        "Demonstrated cybersecurity proficiency",
        style: TextStyle(color: Colors.grey),
      ),

      const SizedBox(height: 15),

      Column(
        children: [

          /// 🔹 الصف الأول
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              /// 1
              _badgeItem(Icons.link, "Link Inspector"),

              /// 2
              _badgeItem(Icons.shield, "Scam Hunter"),

              /// 3
              _badgeItem(Icons.bolt, "Zero-Day Hero"),
            ],
          ),

          const SizedBox(height: 20),

          /// 🔹 الصف التاني (Locked)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              _lockedBadge(Icons.lock, "Firewall Master"),
              _lockedBadge(Icons.key, "Vault Guard"),
              _lockedBadge(Icons.security, "Admin Access"),
            ],
          ),
        ],
      )

      , SizedBox(height: 25),

      /// 🔥 STREAK
      _infoCard(
        icon: Icons.local_fire_department,
        title: "Current Streak",
        subtitle: "12 days running",
          value: stats.streak.toString(),
        iconColor: Color(0xFFEF6E15),
        bgColor:  Color(0xFF2E2929)
      ),

      const SizedBox(height: 12),

      /// ✅ TESTS
      _infoCard(
        icon: Icons.task_alt,
        title: "Tests Completed",
        subtitle: "All time total",
          value: stats.testsCompleted.toString(),
        iconColor: Colors.purple,
          bgColor:  Colors.purple.withOpacity(0.1)

      ),
    ],
    ),
    ),
                  );
                }

                return const SizedBox();
                },
          ),
      ));}

  /// 🔹 TOP CARD
  Widget _topCard({
    required String title,
    required String value,
    required String sub,
     required Color valueColor,
    required String extra,
    required IconData icon

  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A242E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color:AppColors.textSecondary,fontSize: 14,fontWeight: FontWeight.w500 )),
          const SizedBox(height: 10),

          Row(
            children: [
              Text(
                value,
                style: TextStyle(
                  color:valueColor ,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,

                ),
              ),
              const SizedBox(width: 4),
              Text(sub, style: const TextStyle(color: AppColors.textSecondary,fontSize: 14,fontWeight: FontWeight.w400,)
              )],
          ),

          const SizedBox(height: 8),

          Row(
            children: [
               Icon(icon,color: const Color(0xFF0BDA5B),size: 14,),
             const SizedBox(width: 4,)
              ,Text(
                extra,
                style: const TextStyle(color: Color(0xFF0BDA5B), fontSize: 12,fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// 🔹 BADGE

  /// 🔹 INFO CARD
  Widget _infoCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required String value,
    required Color iconColor,
    required Color bgColor
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A242E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
           height: 40,

           decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: bgColor),
            child: Icon(icon,size: 24,color: iconColor),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style:  TextStyle(color: AppColors.textPrimary,fontWeight: FontWeight.w700,fontSize: 14)),
                Text(subtitle,
                    style: const TextStyle(color: AppColors.textSecondary, fontSize: 12,fontWeight: FontWeight.w400)),
              ],
            ),
          ),

          Text(
            value,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w700,
              fontSize: 18
            ),
          ),
        ],
      ),
    );
  }
}
class ChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final paintLine = Paint()
      ..color = Colors.blue
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final path = Path();

    /// نقاط وهمية (شكل الشارت)
    path.moveTo(0, size.height * 0.7);

    path.quadraticBezierTo(
        size.width * 0.1, size.height * 0.2,
        size.width * 0.2, size.height * 0.5);

    path.quadraticBezierTo(
        size.width * 0.3, size.height * 0.8,
        size.width * 0.4, size.height * 0.4);

    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.3,
        size.width * 0.6, size.height * 0.9);

    path.quadraticBezierTo(
        size.width * 0.7, size.height * 0.1,
        size.width * 0.8, size.height * 0.6);

    path.quadraticBezierTo(
        size.width * 0.9, size.height * 0.8,
        size.width, size.height * 0.3);

    canvas.drawPath(path, paintLine);

    /// 🎨 Gradient تحت الخط
    final paintFill = Paint()
      ..shader = LinearGradient(
        colors: [
          Colors.blue.withOpacity(0.3),
          Colors.transparent,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final fillPath = Path.from(path)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(fillPath, paintFill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
Widget _badgeItem(IconData icon, String text) {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.all(2),
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(

            color: Color(0xFF103152),
            width:3,
          ),
        ),
        child: CircleAvatar(
          radius: 28,
          backgroundColor:Color(0xFF1A242E),
          child: Icon(
            icon,
            color: AppColors.primary,
            size: 36,
          ),
        ),
      ),
      const SizedBox(height: 8),
      Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.w700
        ),
        textAlign: TextAlign.center,
      ),
    ],
  );
}
Widget _lockedBadge(IconData icon, String text) {
  return Column(
    children: [
      SizedBox(
        width: 80,
        height: 80,
        child: CircleAvatar(
          radius: 30,
          backgroundColor: const Color(0xFF151E29),
          child: Icon(
            icon,
            color:Color(0xFF404B57),
            size: 36,
          ),
        ),
      ),
      const SizedBox(height: 8),
      Text(
        text,
        style: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 11,
          fontWeight: FontWeight.w500
        ),
        textAlign: TextAlign.center,
      ),
    ],
  );
}