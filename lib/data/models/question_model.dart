import 'dart:convert';
import 'package:equatable/equatable.dart';

import '../../domain/entities/question.dart';
import 'awnser_model.dart';

class QuestionModel extends Equatable {
  final String title;
  final List<AwnserModel> awnsers;

  QuestionModel({
    required this.title,
    required this.awnsers,
  }) : assert(awnsers.length == 4);

  @override
  List<Object> get props => [title, awnsers];

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      title: map['title'],
      awnsers: List<AwnserModel>.from(map['awnsers'].map((x) => AwnserModel.fromMap(x))),
    );
  }

  factory QuestionModel.fromJson(String source) => QuestionModel.fromMap(json.decode(source));

  factory QuestionModel.fromEntity(Question entity) => QuestionModel(
        title: entity.title,
        awnsers: entity.awnsers.map((x) => AwnserModel.fromEntity(x)).toList(),
      );

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'awnsers': awnsers.map((x) => x.toMap()).toList(),
    };
  }

  String toJson() => json.encode(toMap());

  Question toEntity() => Question(
        title: title,
        awnsers: awnsers.map((x) => x.toEntity()).toList(),
      );

  QuestionModel copyWith({
    String? title,
    List<AwnserModel>? awnsers,
  }) {
    return QuestionModel(
      title: title ?? this.title,
      awnsers: awnsers ?? this.awnsers,
    );
  }

  @override
  bool get stringify => true;
}
