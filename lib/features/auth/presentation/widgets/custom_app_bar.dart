import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBack;
  final Widget? leadingWidget; // 👈 لو عايزة تحطي حاجة غير back
  final Widget? action; // 👈 icon يمين

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBack = true,
    this.leadingWidget,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;

    return AppBar(
      backgroundColor: AppColors.backgroundStart,
      automaticallyImplyLeading: false,
      elevation: 0,
      toolbarHeight: h * 0.08,

      flexibleSpace: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.04),
          child: Row(
            children: [

              /// 🔹 LEADING
              if (leadingWidget != null)
                leadingWidget!
              else if (showBack)
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () => Navigator.pop(context),
                    child: Padding(
                      padding: EdgeInsets.all(w * 0.02),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.primary,
                        size: w * 0.05,
                      ),
                    ),
                  ),
                )
              else
                SizedBox(width: w * 0.05),

              SizedBox(width: w * 0.02),

              /// 🔤 TITLE
              Expanded(
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w700,
                      fontSize: 16 * (w / 375),
                    ),
                  ),
                ),
              ),

              /// 🔹 ACTION
              action ??
                  SizedBox(width: w * 0.05),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}