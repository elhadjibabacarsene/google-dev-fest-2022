part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

class TodoInitial extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoLoading extends TodoState {}

class TodoAdded extends TodoState {}

class TodoError extends TodoState {
  final String errorMessage;

  const TodoError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class ListLoad extends TodoState {
  final List<Todo> listTodo;

  const ListLoad({required this.listTodo});

  @override
  List<Object> get props => [listTodo];
}
