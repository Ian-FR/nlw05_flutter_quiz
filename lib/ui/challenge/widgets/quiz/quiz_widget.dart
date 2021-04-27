import 'package:flutter/material.dart';
import 'package:flutter_dev_quiz/domain/entities/question.dart';

import '../../../../core/core.dart';
import 'awnser_widget.dart';

class QuizWidget extends StatefulWidget {
  final Question question;
  final VoidCallback onChange;

  QuizWidget({
    Key? key,
    required this.question,
    required this.onChange,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 48),
          Text(widget.question.title, style: AppTextStyles.heading),
          SizedBox(height: 24),
          ...widget.question.awnsers
              .asMap()
              .entries
              .map((e) => AwnserWidget(
                    awnser: e.value,
                    isSelected: indexSelected == e.key,
                    disabled: indexSelected != -1,
                    onTap: () {
                      indexSelected = e.key;
                      setState(() {});
                      Future.delayed(Duration(milliseconds: 90)).then((_) => widget.onChange());
                    },
                  ))
              .toList()
        ],
      ),
    );
  }
}
