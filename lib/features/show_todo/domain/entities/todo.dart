import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  String id;
  final String title;
  final bool isDone;

  Todo({required this.id, required this.title, required this.isDone});

  @override
  List<Object?> get props => [id, title, isDone];
}
