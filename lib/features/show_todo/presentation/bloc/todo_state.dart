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

class TodoDeleted extends TodoState {}

class TodoAdding extends TodoState {}

class ListLoad extends TodoState {}
