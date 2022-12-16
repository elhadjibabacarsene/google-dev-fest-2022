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
  final String title;

  const AddListTodo({required this.title});

  @override
  // TODO: implement props
  List<Object?> get props => [title];
}

class DeleteTodo extends TodoEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
