import 'package:equatable/equatable.dart';

import 'awnser.dart';

class Question extends Equatable {
  final String title;
  final List<Awnser> awnsers;

  Question({
    required this.title,
    required this.awnsers,
  });

  @override
  List<Object> get props => [
        title,
        awnsers,
      ];
}
