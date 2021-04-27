import 'package:flutter/foundation.dart';

import '../../data/repositories/home_repository_impl.dart';
import '../../domain/entities/quiz.dart';
import '../../domain/entities/user.dart';
import 'home_state.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  User? user;
  List<Quiz>? quizzes;

  final homeRepository = HomeRepositoryImpl();

  void getUser() async {
    state = HomeState.loading;

    await Future.delayed(Duration(seconds: 2));

    user = await homeRepository.getUser();

    state = HomeState.success;
  }

  void getQuizzes() async {
    state = HomeState.loading;

    await Future.delayed(Duration(seconds: 2));

    quizzes = await homeRepository.getQuizzes();

    state = HomeState.success;
  }
}
