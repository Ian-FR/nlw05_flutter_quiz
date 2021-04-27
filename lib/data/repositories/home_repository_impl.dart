import 'dart:convert';
import 'package:flutter/services.dart';

import '../models/quiz_model.dart';
import '../models/user_model.dart';
import '../../domain/contracts/home_repository.dart';
import '../../domain/entities/user.dart';
import '../../domain/entities/quiz.dart';

class HomeRepositoryImpl extends HomeRepository {
  @override
  Future<List<Quiz>> getQuizzes() async {
    final response = await rootBundle.loadString('database/quizzes.json');
    final quizzes = json.decode(response) as List;
    return quizzes.map((e) => QuizModel.fromMap(e).toEntity()).toList();
  }

  @override
  Future<User> getUser() async {
    final response = await rootBundle.loadString('database/user.json');
    final user = UserModel.fromJson(response);
    return user.toEntity();
  }
}
