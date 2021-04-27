import 'dart:convert';
import 'package:equatable/equatable.dart';

import '../../domain/entities/quiz.dart';
import '../../shared/enums/level.dart';
import 'question_model.dart';

class QuizModel extends Equatable {
  final String title;
  final List<QuestionModel> questions;
  final int questionAwnsered;
  final String image;
  final Level level;

  QuizModel({
    required this.title,
    required this.questions,
    this.questionAwnsered = 0,
    required this.image,
    required this.level,
  });

  @override
  List<Object> get props {
    return [
      title,
      questions,
      questionAwnsered,
      image,
      level,
    ];
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      title: map['title'],
      questions: List<QuestionModel>.from(map['questions']?.map((x) => QuestionModel.fromMap(x))),
      questionAwnsered: map['questionAwnsered'],
      image: map['image'],
      level: getLevel(map['level']),
    );
  }

  factory QuizModel.fromJson(String source) => QuizModel.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions.map((x) => x.toMap()).toList(),
      'questionAwnsered': questionAwnsered,
      'image': image,
      'level': getLevel(level),
    };
  }

  Quiz toEntity() => Quiz(
        title: title,
        questions: questions.map((e) => e.toEntity()).toList(),
        image: image,
        level: level,
      );
  QuizModel copyWith({
    String? title,
    List<QuestionModel>? questions,
    int? questionAwnsered,
    String? image,
    Level? level,
  }) {
    return QuizModel(
      title: title ?? this.title,
      questions: questions ?? this.questions,
      questionAwnsered: questionAwnsered ?? this.questionAwnsered,
      image: image ?? this.image,
      level: level ?? this.level,
    );
  }

  @override
  bool get stringify => true;
}
