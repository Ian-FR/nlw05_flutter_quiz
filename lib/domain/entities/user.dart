import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final String photoUrl;
  final int score;

  User({
    required this.name,
    required this.photoUrl,
    required this.score,
  });

  @override
  List<Object?> get props => [
        name,
        photoUrl,
        score,
      ];
}
