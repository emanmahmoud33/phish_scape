import 'package:flutter/material.dart';
import 'package:phish_scape/core/theme/app_colors.dart';

import '../../notifications/presentation/screens/notifications_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  bool isSurprise = true;
  bool isDarkMode = true;
  bool isNotifications = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final r = MediaQuery.of(context).size.width;
    final scale = r / 375;
    final h = size.height;
    final w = size.width;

    return Scaffold(

      appBar: AppBar(
        backgroundColor: AppColors.backgroundStart,
        automaticallyImplyLeading: false,
        elevation: 0,

        /// 👇 responsive height
        toolbarHeight: h * 0.08,

        flexibleSpace: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.05), // 👈 كان 0.04

            child: Row(
              children: [

                /// 🔙 BACK
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.primary,
                    size: w * 0.05, // 👈 responsive icon
                  ),
                ),

                SizedBox(width: w * 0.02), // 👈 بدل 0.01

                /// 🔤 TITLE
                Expanded(
                  child: Center(
                    child: Text(
                      "Settings",
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w700,

                        /// 👇 responsive font
                        fontSize: 18 * (w / 375),
                      ),
                    ),
                  ),
                ),

                /// 👇 علشان نحافظ على التوازن (زي الـ back button)
                SizedBox(width: w * 0.05),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: AppColors.backgroundStart,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(w * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: h * 0.001),

                /// 🔹 ACCOUNT
                Text("Account",
                    style: TextStyle(color: Colors.white, fontSize: 18 * scale ,fontWeight: FontWeight.w700)),

                SizedBox(height: h * 0.015),

                _card(
                  w,
                  Column(
                    children: [
                      _tile(
                        iconWidget: const CircleAvatar(radius: 18),
                        title: "hana",
                        subtitle: "mans.s@edu-shield.com",
                        trailing: Icons.arrow_forward_ios,
                    onTap: () {
                      print("Open Profile");},
                      ),
                      _tile(
                        iconBoxColor: Color(0xFF135BEC),
                        icon: Icons.lock,
                        title: "Change Password",
                        trailing: Icons.arrow_forward_ios,
                        onTap: () {
                          print("Go to Change Password");
                        },
                      ),
                    ],
                  ),
                ),

                SizedBox(height: h * 0.03),

                /// 🔹 SIMULATION
                Text("Simulation Settings",
                    style: TextStyle(color: AppColors.textPrimary, fontSize: 18* scale,fontWeight: FontWeight.w700)),

                SizedBox(height: h * 0.015),

                _card(
                  w,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      /// Difficulty
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Text("Difficulty Level",
                              style: TextStyle(color: AppColors.textPrimary, fontSize: 16* scale,fontWeight: FontWeight.w500)),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child:  Text("Intermediate",
                                style: TextStyle(color: AppColors.primary,fontSize: 12 * scale,fontWeight: FontWeight.w700 )),
                          )
                        ],
                      ),

                      Slider(
                        value: 0.5,
                        onChanged: (_) {},
                        activeColor: Colors.blue,
                      ),

                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Beginner",
                              style:
                              TextStyle(color: AppColors.textSecondary, fontSize: 10*scale,fontWeight: FontWeight.w700)),
                          Text("Intermediate",
                              style:
                              TextStyle(color: AppColors.textSecondary, fontSize: 10*scale,fontWeight: FontWeight.w700)),
                          Text("Expert",
                              style:
                              TextStyle(color: AppColors.textSecondary, fontSize: 10*scale,fontWeight: FontWeight.w700)),
                        ],
                      ),

                      const Divider(color: Color(0xFFF1F5F9),thickness: 1.1,),

                      /// Switch
                      _switchTile(
                        icon: Icons.campaign,
                        color: Colors.orange,
                        title: "Surprise Attacks",
                        value: isSurprise,
                        onChanged: (val) {
                          setState(() {
                            isSurprise = val;
                          });
                        },
                      ),
                    ],
                  ),
                ),

                SizedBox(height: h * 0.03),

                /// 🔹 PREFERENCES
                 Text("Preferences",
                    style: TextStyle(color: Colors.white, fontSize: 18* scale,fontWeight: FontWeight.w700)),

                SizedBox(height: h * 0.015),

                _card(
                  w,
                  Column(
                    children: [
                      _switchTile(
                        icon: Icons.dark_mode,
                        color: Color(0xFF232F48),
                        title: "Dark Mode",
                        value: isDarkMode,
                        onChanged: (val) {
                          setState(() {
                            isDarkMode = val;
                          });
                        },
                      ),
                      SizedBox(height: h * 0.016),
                      _switchTile(
                        icon: Icons.notifications,
                        color: Color(0XFF60A5FA),
                        title: "Push Notifications",
                        value: isNotifications,
                        onChanged: (val) {
                          setState(() {
                            isNotifications = val;
                          });
                        },
                      ),
                    ],
                  ),
                ),

                SizedBox(height: h * 0.03),

                /// 🔹 PRIVACY
                Text("Privacy & Security",
                    style: TextStyle(color: Colors.white, fontSize: 18 *scale,fontWeight: FontWeight.w700)),

                SizedBox(height: h * 0.015),

                _card(
                  w,
                  Column(
                    children: [
                      _tile(
                        iconBoxColor: Colors.green,
                        icon: Icons.verified_user,
                        title: "Privacy Policy",
                        trailing: Icons.open_in_new,
                      ),
                      SizedBox(height: h * 0.016),
                      _tile(
                        iconBoxColor: Colors.grey,
                        icon: Icons.policy,
                        title: "Terms of Service",
                        trailing: Icons.chevron_right,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: h * 0.03),

                /// 🔹 ABOUT
                 Text("About the App",
                    style: TextStyle(color: Colors.white, fontSize: 18*scale,fontWeight: FontWeight.w700)),

                SizedBox(height: h * 0.015),

                _card(
                  w,
                  Column(
                    children: [
                      _tile(
                        iconBoxColor: Color(0xFF6366F1),
                        icon: Icons.info,
                        title: "Version",
                        trailingWidget:  const Text(
                          "2.4.0 (Build 108)",
                          style: TextStyle(color: AppColors.textSecondary,fontSize: 16,fontWeight:FontWeight.w400 ),
                        ),
                      ),
                      SizedBox(height: h * 0.016),
                      _tile(
                        iconBoxColor: Color(0XFFF43F5E),
                        icon: Icons.delete_forever,
                        title: "Clear Training Data",
                        titleColor: Color(0XFFF43F5E),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: h * 0.03),

                /// 🔴 SIGN OUT
                SizedBox(
                  width: double.infinity,
                  height: h * 0.065,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (_) => const NotificationsScreen(),
                      //   ),
                      // );
                    },

                    /// 👇 هنا مكان الـ style الصح
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF16202D),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.zero,
                    ),

                    /// 👇 وهنا child
                    child: Center(
                      child: Text(
                        "Sign Out",
                        style: TextStyle(
                          color: const Color(0XFFF43F5E),
                          fontSize: 16 * scale,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 🔹 CARD
  Widget _card(double w, Widget child) {
    return Container(
      padding: EdgeInsets.all(w * 0.04),
      decoration: BoxDecoration(
        color: const Color(0xFF16202D),
        borderRadius: BorderRadius.circular(14),
      ),
      child: child,
    );
  }

  /// 🔹 TILE
  Widget _tile({
    Color? iconBoxColor,
    IconData? icon,
    Widget? iconWidget,
    required String title,
    String? subtitle,
    Widget? trailingWidget,
    IconData? trailing,
    Color? titleColor,
    VoidCallback? onTap,
  }) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: iconWidget ??
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: iconBoxColor ?? Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: Colors.white),
          ),
      title: Text(title,
          style: TextStyle(color: titleColor ?? AppColors.textPrimary,fontSize: 16 ,fontWeight:FontWeight.w500 )),
      subtitle: subtitle != null
          ? Text(subtitle, style:  const TextStyle(color: AppColors.textSecondary,fontSize: 14,fontWeight:FontWeight.w400 ))
          : null,
      trailing: trailingWidget ??
          (trailing != null
              ? Icon(trailing, color: AppColors.textSecondary,)
              : null),
    );
  }

  /// 🔹 SWITCH TILE
  Widget _switchTile({
    required IconData icon,
    required Color color,
    required String title,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Row(
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(title,
              style:  TextStyle(color: AppColors.textPrimary,fontSize: 16 ,fontWeight:FontWeight.w400 )),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: Colors.blue,
        )
      ],
    );
  }
}