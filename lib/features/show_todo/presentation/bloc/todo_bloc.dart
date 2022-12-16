import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_dev_fest/core/usecases/usecases.dart';
import 'package:google_dev_fest/features/show_todo/domain/entities/todo.dart';
import 'package:google_dev_fest/features/show_todo/domain/usecases/create_todo.dart';
import 'package:google_dev_fest/features/show_todo/domain/usecases/get_list_todo.dart';
part 'todo_event.dart';
part 'todo_state.dart';


class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final getListTodo = GetListTodo();
  final createTodo = CreateTodo();

  TodoBloc() : super(TodoInitial()) {
    on<GetListTodoEnvent>((event, emit) async {
      var todoList = await getListTodo(NoParams()); 
      emit(TodoLoading());
    });

    on<AddListTodo>((event, emit){
      createTodo(Params(todo: Todo(id: '', title: event.title, isDone: false)));
    });
  }
}
