import 'package:flutter/material.dart';

class LogoCard extends StatelessWidget {
  const LogoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 181.02,
      width: 181.02,
      decoration: BoxDecoration(
        color: const Color(0xFF0D2A3A),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.blueAccent,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent.withOpacity(0.4),
            blurRadius: 20,
          ),
        ],
      ),
      child: Center(
        child: Image.asset(
          "assets/images/logo.svg",

        ),
      ),
    );
  }
}