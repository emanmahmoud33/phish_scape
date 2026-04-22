import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

    const CustomButton({required this.text, required this.onPressed,  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 358,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: onPressed,
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700
              ),
            ),
            SizedBox(width: 5),
            Icon(
              Icons.arrow_forward,
              color: AppColors.textPrimary,
            ),
          ],
        ),
      ),
    );
  }
}