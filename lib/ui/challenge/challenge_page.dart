import 'package:flutter/material.dart';
import 'package:flutter_dev_quiz/core/core.dart';
import 'package:flutter_dev_quiz/domain/entities/question.dart';
import 'package:flutter_dev_quiz/ui/challenge/challenge_controller.dart';

import 'widgets/next_button_widget.dart';
import 'widgets/question_indicator_widget.dart';
import 'widgets/quiz/quiz_widget.dart';

class ChallengePage extends StatefulWidget {
  final List<Question> questions;

  const ChallengePage({Key? key, required this.questions}) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  @override
  void initState() {
    controller.currentQuestionNotifier.addListener(() => setState(() {}));
    pageController.addListener(() => controller.currentQuestion = pageController.page!.toInt() + 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(86),
        child: SafeArea(
            top: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.close_rounded,
                      color: AppColors.grey,
                    ),
                    padding: EdgeInsets.zero,
                    onPressed: () => Navigator.pop(context)),
                ValueListenableBuilder<int>(
                  valueListenable: controller.currentQuestionNotifier,
                  builder: (context, value, _) => QuestionIndicatorWidget(
                    currentQuestion: value,
                    totalQuestions: widget.questions.length,
                  ),
                ),
              ],
            )),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.questions
            .map((e) => QuizWidget(
                  question: e,
                  onChange: () => nextPage(),
                ))
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        minimum: EdgeInsets.only(bottom: 8),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: ValueListenableBuilder<int>(
                  valueListenable: controller.currentQuestionNotifier,
                  builder: (context, value, _) => value < widget.questions.length
                      ? NextButtonWidget.white(
                          label: 'Pular',
                          onTap: () => nextPage(),
                        )
                      : NextButtonWidget.green(
                          label: 'Confirmar',
                          onTap: () => Navigator.pop(context),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void nextPage() => pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.linear,
      );
}
