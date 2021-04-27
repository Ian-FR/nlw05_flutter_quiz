import 'dart:convert';
import 'package:equatable/equatable.dart';

import '../../domain/entities/awnser.dart';

class AwnserModel extends Equatable {
  final String title;
  final bool isRight;

  AwnserModel({
    required this.title,
    this.isRight = false,
  });

  @override
  List<Object> get props => [title, isRight];

  factory AwnserModel.fromMap(Map<String, dynamic> map) {
    return AwnserModel(
      title: map['title'],
      isRight: map['isRight'] ?? false,
    );
  }

  factory AwnserModel.fromJson(String source) => AwnserModel.fromMap(json.decode(source));

  factory AwnserModel.fromEntity(Awnser entity) => AwnserModel(
        title: entity.title,
        isRight: entity.isRight,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {'title': title, 'isRight': isRight};
  }

  Awnser toEntity() => Awnser(title: title, isRight: isRight);

  AwnserModel copyWith({
    String? title,
    bool? isRight,
  }) {
    return AwnserModel(
      title: title ?? this.title,
      isRight: isRight ?? this.isRight,
    );
  }

  @override
  bool get stringify => true;
}
