import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  String? id;
  final String title;
  final bool isDone;

  Todo({this.id, required this.title, this.isDone = false});

  @override
  List<Object?> get props => [id, title, isDone];
}
