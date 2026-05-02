import 'package:flutter/material.dart';

class LessonDetailsScreen extends StatelessWidget {
  final int lessonId;

  const LessonDetailsScreen({
    super.key,
    required this.lessonId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lesson Details"),
      ),

      body: Center(
        child: Text(
          "Lesson ID: $lessonId",
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}