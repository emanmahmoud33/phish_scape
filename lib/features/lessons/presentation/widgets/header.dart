import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../auth/logic/cubit/auth_cubit.dart';
import '../../../auth/logic/cubit/user_cubit.dart';
import '../../../../core/utils/image_picker_helper.dart';

class Header extends StatefulWidget implements PreferredSizeWidget {
  const Header({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  String? imagePath;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: AppColors.backgroundStart,
      flexibleSpace: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Color(0XFF1C2127),
        ),
        child: SafeArea(
          child: Row(
            children: [
              /// 🟢 Avatar (اتعدل بس من جوه)
              GestureDetector(
                onTap: () async {
                  final image = await ImagePickerHelper.pickImage();

                  if (image != null) {
                    setState(() {
                      imagePath = image.path;
                    });

                    context.read<AuthCubit>().uploadImage(image.path);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 22,
                    backgroundImage: imagePath != null
                        ? FileImage(File(imagePath!))
                        : const AssetImage("assets/images/user.jpg")
                            as ImageProvider,
                  ),
                ),
              ),

              const SizedBox(width: 12),

              /// 🟢 Text
              BlocBuilder<UserCubit, UserState>(
                builder: (context, state) {
                  if (state is UserLoading) {
                    return const SizedBox();
                  }

                  if (state is UserSuccess) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          state.user.firstName,
                          style: const TextStyle(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 2),
                        FutureBuilder(
                          future: SharedPreferences.getInstance(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const SizedBox();
                            }

                            final prefs = snapshot.data!;
                            final level =
                                prefs.getString("level") ?? "Beginner";

                            return Text(
                              "Lvl $level",
                              style: const TextStyle(
                                color: AppColors.primary,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            );
                          },
                        )
                      ],
                    );
                  }
                  if (state is UserError) {
                    return const Text(
                      "Error",
                      style: TextStyle(color: Colors.white),
                    );
                  }

                  return const SizedBox();
                },
              ),

              const Spacer(),

              _circleIcon(Icons.notifications, () {
                Navigator.pushNamed(context, AppRoutes.notification);
              }),
              const SizedBox(width: 10),
              _circleIcon(Icons.settings, () {
                Navigator.pushNamed(context, AppRoutes.setting);
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _circleIcon(IconData icon, void Function() onTap) {
    return Container(
      height: 46.67,
      width: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.08),
      ),
      child: IconButton(
        onPressed: onTap,
        icon: Icon(icon),
        color: AppColors.textPrimary,
      ),
    );
  }
}
