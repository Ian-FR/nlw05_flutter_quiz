import '../entities/quiz.dart';
import '../entities/user.dart';

abstract class HomeRepository {
  Future<User> getUser();
  Future<List<Quiz>> getQuizzes();
}
