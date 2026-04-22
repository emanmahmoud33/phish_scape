import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class Dots extends StatelessWidget {
  final int index;
   Dots({required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (i) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 4),
          height: 6,
          width: i == index ? 20 : 6,
          decoration: BoxDecoration(
            color: i == index
                ? AppColors.primary
                : Colors.white24,
            borderRadius: BorderRadius.circular(10),
          ),
        );
      }),
    );
  }
}