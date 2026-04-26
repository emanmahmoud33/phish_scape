import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(70); // 👈 مهم

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: AppColors.backgroundStart,

      flexibleSpace: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration:  BoxDecoration(
         color: AppColors.backgroundStart
        ),

        child: SafeArea(
          child: Row(
            children: [

              /// 🟢 Avatar
              Container(
                padding: const EdgeInsets.all(2), // 👈 المسافة بين الصورة والبوردر
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.blue, // 👈 اللون الأزرق
                    width: 2, // 👈 سمك الدائرة
                  ),
                ),
                child: const CircleAvatar(
                  radius: 22,
                  backgroundImage: AssetImage("assets/images/user.jpg"),
                ),
              ),

              const SizedBox(width: 12),

              /// 🟢 Text
             const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "PhishScape",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "Lvl 14 Security Analyst",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              const Spacer(),

              _circleIcon(Icons.notifications),
              const SizedBox(width: 10),
              _circleIcon(Icons.settings),
            ],
          ),
        ),
      ),
    );
  }

  Widget _circleIcon(IconData icon) {
    return Container(
      height: 38,
      width: 38,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.08),
      ),
      child: Icon(icon, color: Colors.white, size: 20),
    );
  }
}