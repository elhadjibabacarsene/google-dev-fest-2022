import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_dev_fest/core/firebase_helper/firebase_db.dart';
import 'package:google_dev_fest/features/show_todo/data/datasources/todo_data_source.dart';
import 'package:google_dev_fest/features/show_todo/domain/entities/todo.dart';
import 'package:google_dev_fest/features/show_todo/domain/usecases/create_todo.dart';
import 'package:google_dev_fest/features/show_todo/domain/usecases/get_list_todo.dart';
import '../../data/repositories/todo_repository_impl.dart';
part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    final frebaseDB = FirebaseDB();
    final todoRepoImpl = TodoDataSourceImpl(firebaseDB: frebaseDB);
    final todoRepositoryImpl = TodoRepositoryImpl(todoDataSourceImpl: todoRepoImpl);
    final createTodo = CreateTodo(todoRepositoryImpl);
    final getListTodo = GetListTodo(todoRepositoryImpl);

    on<GetListTodoEnvent>((event, emit) async {
      //await createTodo(Params(todo: TodoModel(id: '', title: '', isDone: false))); // POUR CREE UN TODO
      //var todoList = await getListTodo(NoParams()); // POUR LIRE LES TODO SUR FIREBASE
      emit(TodoLoading());
    });
  }
}
