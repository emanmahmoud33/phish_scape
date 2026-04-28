import 'package:flutter/material.dart';
import '../../../../core/routing/app_routes.dart';

import '../../../../core/theme/app_colors.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {

  int selectedTab = 0;

  final tabs = ["All", "Alerts", "Reports", "Simulations"];

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    final scale = w / 375;

    return Scaffold(
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

                /// 🔙 BACK BUTTON
                Material(
                  color: Colors.transparent,
                  child: InkWell(
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
                ),

                SizedBox(width: w * 0.02),

                /// 🔤 TITLE
                Expanded(
                  child: Center(
                    child: Text(
                      "Notifications",
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w700,
                        fontSize: 18 * (w / 375),
                      ),
                    ),
                  ),
                ),

                /// ✅ DONE ICON
                Icon(
                  Icons.done_all,
                  color: AppColors.primary,
                  size: w * 0.06,
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor:AppColors.backgroundStart,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(w * 0.05),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              // SizedBox(height: h * 0.03),

              /// 🔹 TABS
              SizedBox(
                height: h * 0.05,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tabs.length,
                  itemBuilder: (context, index) {
                    final isSelected = selectedTab == index;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTab = index;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: w * 0.02),
                        padding: EdgeInsets.symmetric(
                            horizontal: w * 0.04),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Colors.blue
                              : const Color(0xFF1E293B),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          tabs[index],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14 * scale,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: h * 0.03),

              /// 🔹 LIST
              Expanded(
                child: ListView(
                  children: [

                    _sectionTitle("Today", scale),

                    _notificationItem(
                      icon: Icons.warning,
                      color: Colors.red,
                      title: "New Phishing Trend Alert!",
                      subtitle:
                      "A new social engineering tactic targeting remote workers has been detected via LinkedIn messaging.",
                      time: "2m ago",
                      scale: scale,
                    ),

                    _notificationItem(
                      icon: Icons.verified_user,
                      color:Color(0xFF34D399),
                      title: "Simulation Success",
                      subtitle:
                      "Great job! You identified the suspicious link in the simulated HR benefits email.",
                      time: "45m ago",
                      scale: scale,
                    ),

                    SizedBox(height: h * 0.02),

                    _sectionTitle("Yesterday", scale),

                    _notificationItem(
                      icon: Icons.analytics,
                      color: Colors.blue,
                      title: "Weekly Report Ready",
                      subtitle:
                      "Your simulation performance for the past week is now available. You're in the top 10%.",
                      time: "1d ago",
                      scale: scale,
                    ),

                    _notificationItem(
                      icon: Icons.lightbulb,
                      color: Colors.orange,
                      title: "Pro Security Tip",
                      subtitle:
                      "Always hover over links before clicking to verify the actual destination URL.",
                      time: "1d ago",
                      scale: scale,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// 🔹 SECTION TITLE
  Widget _sectionTitle(String text, double scale) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 12 * scale,
        ),
      ),
    );
  }

  /// 🔹 NOTIFICATION ITEM
  Widget _notificationItem({
    required IconData icon,
    required Color color,
    required String title,
    required String subtitle,
    required String time,
    required double scale,
  }) {
    return GestureDetector(
      onTap: () {
        print(title);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// ICON
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color),
            ),

            const SizedBox(width: 12),

            /// TEXT
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// 🔹 TITLE + TIME
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14 * scale,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        time,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10 * scale,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  /// 🔹 SUBTITLE + DOT
                  Row(
                    children: [

                      /// TEXT
                      Expanded(
                        child: Text(
                          subtitle,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12 * scale,
                          ),
                        ),
                      ),

                      const SizedBox(width: 6),

                      /// 🔵 DOT هنا بقى
                      Container(
                        height: 8,
                        width: 8,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }}