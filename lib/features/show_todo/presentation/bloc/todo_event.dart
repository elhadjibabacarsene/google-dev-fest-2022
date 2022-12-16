part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
}

class FetchListTodo extends TodoEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AddTodo extends TodoEvent {
  final String title;

  const AddTodo({required this.title});

  @override
  // TODO: implement props
  List<Object?> get props => [title];
}

class DeleteTodo extends TodoEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
