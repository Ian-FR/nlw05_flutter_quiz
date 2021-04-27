import 'dart:convert';
import 'package:equatable/equatable.dart';

import '../../domain/entities/user.dart';

class UserModel extends Equatable {
  final String name;
  final String photoUrl;
  final int score;

  UserModel({
    required this.name,
    required this.photoUrl,
    required this.score,
  });

  @override
  List<Object> get props => [name, photoUrl, score];

  UserModel copyWith({
    String? name,
    String? photoUrl,
    int? score,
  }) {
    return UserModel(
      name: name ?? this.name,
      photoUrl: photoUrl ?? this.photoUrl,
      score: score ?? this.score,
    );
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      photoUrl: map['photoUrl'],
      score: map['score'],
    );
  }

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  factory UserModel.fromEntity(User entity) => UserModel(
        name: entity.name,
        photoUrl: entity.photoUrl,
        score: entity.score,
      );

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'photoUrl': photoUrl,
      'score': score,
    };
  }

  String toJson() => json.encode(toMap());

  User toEntity() => User(
        name: name,
        photoUrl: photoUrl,
        score: score,
      );

  @override
  bool get stringify => true;
}
