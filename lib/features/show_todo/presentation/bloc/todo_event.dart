part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
}

class GetListTodoEnvent extends TodoEvent {
  const GetListTodoEnvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AddListTodo extends TodoEvent {
  final Todo todo;

  const AddListTodo({required this.todo});

  @override
  // TODO: implement props
  List<Object?> get props => [todo];
}

class DeleteTodo extends TodoEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
