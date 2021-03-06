import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../../shared/widgets/progress_indicator_widget.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final String completedQuestions;
  final String totalQuestions;
  final double completedPercentage;
  final VoidCallback onTap;

  QuizCardWidget({
    required this.title,
    required this.completedQuestions,
    required this.totalQuestions,
    required this.completedPercentage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              child: Image.asset(AppImages.blocks),
            ),
            SizedBox(height: 24),
            Text(
              title,
              style: AppTextStyles.heading15,
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    '$completedQuestions de $totalQuestions',
                    style: AppTextStyles.body11,
                  ),
                ),
                Expanded(flex: 4, child: ProgressIndicatorWidget(value: completedPercentage))
              ],
            )
          ],
        ),
      ),
    );
  }
}
