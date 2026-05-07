import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phish_scape/core/theme/app_colors.dart';
import 'package:phish_scape/features/auth/presentation/widgets/custom_button.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../auth/data/services/auth_service.dart';
import '../../logic/cubit/simulation_cubit.dart';

class SimulationScreen extends StatefulWidget {
  const SimulationScreen({super.key});

  @override
  State<SimulationScreen> createState() => _SimulationScreenState();
}

class _SimulationScreenState extends State<SimulationScreen> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    final lessonId =
    ModalRoute.of(context)?.settings.arguments as int?;

    if (lessonId == null) {
      return const Scaffold(
        body: Center(
          child: Text("No lessonId"),
        ),
      );
    }

    return BlocProvider(
      create: (_) {
        final cubit = SimulationCubit(AuthService());

        cubit.loadQuestions(lessonId);

        return cubit;
      },
      child: Scaffold(
        backgroundColor: AppColors.backgroundStart,

        appBar: AppBar(
          backgroundColor: AppColors.backgroundStart,
          automaticallyImplyLeading: false,
          elevation: 0,
          toolbarHeight: height * 0.08,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      } else {
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.main,
                        );
                      }
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.primary,
                      size: width * 0.05,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Simulation: Email 3 of 10",
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.info_rounded,
                    color: AppColors.primary,
                    size: 22,
                  ),
                ],
              ),
            ),
          ),
        ),

        body: BlocConsumer<SimulationCubit, SimulationState>(

          listener: (context, state) {

            if (state is SimulationAnalysisSuccess) {

              Navigator.pushNamed(
                context,
                AppRoutes.analysis,
                arguments: state.analysis,
              );
            }

            if (state is SimulationError) {

              ScaffoldMessenger.of(context).showSnackBar(

                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(state.error),
                ),
              );
            }
          },

          builder: (context, state) {

            if (state is SimulationLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }


            if (state is SimulationSuccess) {

              final question = state.questions[0];

              return _buildSimulationUI(
                question.question,
                question.options,
                width,
                height,
                onSubmit: () {

                  if (selectedIndex == -1) return;

                  final selectedAnswer =
                  question.answers[selectedIndex];

                  print("QUESTION ID: ${question.id}");
                  print("ANSWER ID: ${selectedAnswer.id}");

                  context.read<SimulationCubit>().submitAnswer(
                    lessonId: lessonId,
                    questionId: question.id,
                    answerId: selectedAnswer.id,
                  );
                },
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _buildSimulationUI(
      String questionText,
      List<String> options,
      double width,
      double height, {
        required VoidCallback onSubmit,
      }) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.02),

              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Training Progress",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
                    ),
                  ),
                  Text(
                    "30% Completed",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: const LinearProgressIndicator(
                  value: 0.3,
                  minHeight: 8,
                  backgroundColor: Color(0xFF1F2937),
                  color: AppColors.primary,
                ),
              ),

              SizedBox(height: height * 0.06),

              Container(
                padding: EdgeInsets.all(width * 0.04),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.backgroundStart,
                  border: Border.all(
                    color: AppColors.textSecondary.withOpacity(0.03),
                    width: 2,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        CircleAvatar(
                          radius: 4,
                          backgroundColor: AppColors.primary,
                        ),
                        SizedBox(width: 6),
                        Text(
                          "EMAIL ANALYSIS",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w700,
                            fontSize: 10,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    Text(
                      questionText,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 20),

                    ...List.generate(
                      options.length,
                          (index) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: _optionTile(
                          options[index],
                          String.fromCharCode(65 + index),
                          index,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: height * 0.04),

              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  text: 'SUBMIT ANSWER',
                  onPressed: onSubmit,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _optionTile(String text, String label, int index) {

    final selected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        height: 74,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF0D131B),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 2,
            color: selected
                ? AppColors.primary.withOpacity(0.7)
                : Colors.transparent,
          ),
        ),
        child: Row(
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 3,
                  color: selected
                      ? AppColors.primary
                      : Colors.grey,
                ),
              ),
              child: selected
                  ? const Center(
                child: CircleAvatar(
                  radius: 5,
                  backgroundColor: AppColors.primary,
                ),
              )
                  : null,
            ),

            const SizedBox(width: 10),

            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),

            Text(
              label,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}