import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/app_colors.dart';

class SocialButtonRow extends StatelessWidget {
  const SocialButtonRow({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;
    final scale = w / 375;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 0.08),
      child: Row(
        children: [

          /// 🔵 Google
          Expanded(
            flex: 3,
            child: Container(
              height: h * 0.065,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xFF1F2937),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                "Google",
                style: TextStyle(
                  color: const Color(0xFF00B8DF),
                  fontSize: 18 * scale,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),

          SizedBox(width: w * 0.03),

          /// 🍎 iOS
          Expanded(
            child: Container(
              height: h * 0.065,
              decoration: BoxDecoration(
                color: const Color(0xFF1F2937),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: SvgPicture.asset(
                  "assets/images/ios.svg",
                  width: w * 0.1,
                ),
              ),
            ),
          ),

          SizedBox(width: w * 0.03),

          /// 💻 Code
          Expanded(
            child: Container(
              height: h * 0.065,
              decoration: BoxDecoration(
                color: const Color(0xFF1F2937),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Icon(
                  Icons.code,
                  color: Colors.white,
                  size: w * 0.07,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}