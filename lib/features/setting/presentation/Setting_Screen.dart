import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:phish_scape/core/theme/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../auth/logic/cubit/user_cubit.dart';
import '../../auth/presentation/widgets/custom_app_bar.dart';
import '../../profile/screens/profile_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isSurprise = true;
  bool isDarkMode = true;
  bool isNotifications = false;

  double difficultyValue = 1;

  String difficultyText = "Intermediate";
  Color get bgColor =>

      isDarkMode

          ? AppColors.backgroundStart

          : const Color(0xFFF3F4F6);

  Color get cardColor =>

      isDarkMode

          ? const Color(0xFF16202D)

          : Colors.white;

  Color get primaryText =>

      isDarkMode

          ? Colors.white

          : Colors.black;

  Color get secondaryText =>

      isDarkMode

          ? AppColors.textSecondary

          : Colors.grey.shade700;

  Future<void> signOut() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.clear();

    Navigator.pushNamedAndRemoveUntil(
      context,
      "/login",
          (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final r = MediaQuery.of(context).size.width;
    final scale = r / 375;
    final h = size.height;
    final w = size.width;

    return Scaffold(
        appBar: AppBar(

          backgroundColor:

          isDarkMode

              ? AppColors.backgroundStart

              : Colors.white,

          elevation: 0,

          centerTitle: true,

          leading: IconButton(

            onPressed: () {

              Navigator.pop(context);
            },

            icon: Icon(

              Icons.arrow_back_ios,

              color:

              isDarkMode

                  ? Colors.white

                  : Colors.black,
            ),
          ),

          title: Text(

            "Settings",

            style: TextStyle(

              color:

              isDarkMode

                  ? Colors.white

                  : Colors.black,

              fontWeight:
              FontWeight.w700,
            ),
          ),
        ),
        backgroundColor: bgColor,
        body: SafeArea(
        child: SingleChildScrollView(
        child: Padding(
        padding: EdgeInsets.all(w * 0.05),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    SizedBox(height: h * 0.001),

    Text(
    "Account",
    style: TextStyle(
    color: primaryText,
    fontSize: 18 * scale,
    fontWeight: FontWeight.w700,
    ),
    ),

    SizedBox(height: h * 0.015),

    _card(
    w,

    Column(

    children: [

    BlocBuilder<UserCubit, UserState>(

    builder: (context, state) {

    String fullName = "User";

    String email = "";

    String? imageUrl;

    if (state is UserDataState) {

    fullName =

    "${state.user?.firstName ?? ""} "
    "${state.user?.lastName ?? ""}";

    email =
    state.user?.email ?? "";

    imageUrl = state.image;
    }

    return _tile(

    iconWidget: CircleAvatar(

    radius: 18,

    backgroundImage:


    imageUrl != null &&
    imageUrl.isNotEmpty

    ? NetworkImage(imageUrl)

        : const AssetImage(
    "assets/images/logo.png",
    ) as ImageProvider,
    ),

    title: fullName,

    subtitle: email,

    trailing:
    Icons.arrow_forward_ios,

    onTap: () {

    Navigator.push(

    context,

    MaterialPageRoute(

    builder: (_) =>
    const ProfileScreen(),
    ),
    );
    },
    );
    },
    ),

    _tile(

    iconBoxColor:
    const Color(0xFF135BEC),

    icon: Icons.lock,

    title: "Change Password",

    trailing:
    Icons.arrow_forward_ios,

    onTap: () {

    Navigator.pushNamedAndRemoveUntil(

    context,

    "/login",

    (route) => false,
    );
    },
    ),
    ],
    ),
    ),

    SizedBox(height: h * 0.03),


    Text(
    "Simulation Settings",
    style: TextStyle(
    color: primaryText,
    fontSize: 18 * scale,
    fontWeight: FontWeight.w700,
    ),
    ),

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
    Text(
    "Difficulty Level",
    style: TextStyle(
    color: primaryText,
    fontSize: 16 * scale,
    fontWeight: FontWeight.w500,
    ),
    ),
    Container(
    padding: const EdgeInsets.symmetric(
    horizontal: 10,
    vertical: 4,
    ),
    decoration: BoxDecoration(
    color: Colors.blue.withOpacity(0.1),
    borderRadius: BorderRadius.circular(6),
    ),
    child: Text(
    difficultyText,
    style: TextStyle(
    color: AppColors.primary,
    fontSize: 12 * scale,
    fontWeight: FontWeight.w700,
    ),
    ),
    )
    ],
    ),

    Slider(
    value: difficultyValue,
    min: 0,
    max: 2,
    divisions: 2,
    onChanged: (value) async {

    setState(() {

    difficultyValue = value;

    if (value == 0) {

    difficultyText = "Beginner";


    } else if (value == 1) {

    difficultyText =
    "Intermediate";

    } else {

    difficultyText = "Expert";
    }
    });

    final prefs =
    await SharedPreferences.getInstance();

    await prefs.setString(
    "level",
    difficultyText,
    );
    },
    activeColor: Colors.blue,
    ),

    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Text(
    "Beginner",
    style: TextStyle(
    color: secondaryText,
    fontSize: 10 * scale,
    fontWeight: FontWeight.w700,
    ),
    ),
    Text(
    "Intermediate",
    style: TextStyle(
    color: secondaryText,
    fontSize: 10 * scale,
    fontWeight: FontWeight.w700,
    ),
    ),
    Text(
    "Expert",
    style: TextStyle(
    color: secondaryText,
    fontSize: 10 * scale,
    fontWeight: FontWeight.w700,
    ),
    ),
    ],
    ),

    const Divider(
    color: Color(0xFFF1F5F9),
    thickness: 1.1,
    ),

    ///
    _switchTile(
    icon: Icons.campaign,
    color: Colors.orange,
    title: "Surprise Attacks",
    value: isSurprise,
    onChanged: (val) async {

    setState(() {

    isSurprise = val;
    });

    final prefs =
    await SharedPreferences.getInstance();

    await prefs.setBool(
    "surprise_attacks",
    val,
    );
    },
    ),
    ],
    ),
    ),

    SizedBox(height: h * 0.03),

    Text(
    "Preferences",
    style: TextStyle(
    color: primaryText,
    fontSize: 18 * scale,
    fontWeight: FontWeight.w700,
    ),
    ),

    SizedBox(height: h * 0.015),


    _card(
    w,
    Column(
    children: [
    _switchTile(
    icon: Icons.dark_mode,
    color: const Color(0xFF232F48),
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
    color: const Color(0XFF60A5FA),
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

    Text(
    "Privacy & Security",
    style: TextStyle(
    color: primaryText,
    fontSize: 18 * scale,
    fontWeight: FontWeight.w700,
    ),
    ),

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
    onTap: () {
    ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
    content: Text(
    "Privacy Policy Coming Soon",
    ),
    ),
    );
    },
    ),
    SizedBox(height: h * 0.016),
    _tile(
    iconBoxColor: Colors.grey,
    icon: Icons.policy,
    title: "Terms of Service",
    trailing: Icons.chevron_right,
    onTap: () {
    ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
    content: Text(
    "Terms of Service Coming Soon",
    ),
    ),
    );
    },
    ),
    ],
    ),
    ),

    SizedBox(height: h * 0.03),

    Text(
    "About the App",
    style: TextStyle(
    color: primaryText,
    fontSize: 18 * scale,
    fontWeight: FontWeight.w700,
    ),
    ),

    SizedBox(height: h * 0.015),


      _card(
        w,
        Column(
          children: [
            _tile(
              iconBoxColor: const Color(0xFF6366F1),
              icon: Icons.info,
              title: "Version",
              trailingWidget: Text(
                "2.4.0 (Build 108)",
                style: TextStyle(
                  color: secondaryText,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: h * 0.016),
            IgnorePointer(

              ignoring: true,

              child: _tile(

                iconBoxColor:
                const Color(0XFFF43F5E),

                icon:
                Icons.delete_forever,

                title:
                "Clear Training Data",

                titleColor:
                const Color(0XFFF43F5E),
              ),
            ),
          ],
        ),
      ),

      SizedBox(height: h * 0.03),

      SizedBox(
        width: double.infinity,
        height: h * 0.065,
        child: ElevatedButton(
          onPressed: signOut,
          style: ElevatedButton.styleFrom(
            backgroundColor:

            isDarkMode

                ? const Color(0xFF16202D)

                : Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.zero,
          ),
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

  Widget _card(double w, Widget child) {
    return Container(
      padding: EdgeInsets.all(w * 0.04),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: child,
    );
  }

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
      title: Text(
        title,
        style: TextStyle(
          color: titleColor ?? primaryText,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
        subtitle,
        style: TextStyle(
          color: secondaryText,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      )
          : null,
      trailing: trailingWidget ??
          (trailing != null
              ? Icon(
            trailing,
            color: secondaryText,
          )
              : null),
    );
  }


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
          child: Text(
            title,
            style: TextStyle(
              color: primaryText,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
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
