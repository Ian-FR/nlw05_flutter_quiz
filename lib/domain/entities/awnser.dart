import 'package:equatable/equatable.dart';

class Awnser extends Equatable {
  final String title;
  final bool isRight;

  Awnser({
    required this.title,
    this.isRight = false,
  });

  @override
  List<Object> get props => [
        title,
        isRight,
      ];
}
