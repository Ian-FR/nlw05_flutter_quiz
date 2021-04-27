import 'package:equatable/equatable.dart';

import '../../shared/enums/level.dart';
import 'question.dart';

class Quiz extends Equatable {
  final String title;
  final List<Question> questions;
  final int questionAwnsered;
  final String image;
  final Level level;

  Quiz({
    required this.title,
    required this.questions,
    this.questionAwnsered = 0,
    required this.image,
    required this.level,
  });

  @override
  List<Object> get props => [
        title,
        questions,
      ];
}
