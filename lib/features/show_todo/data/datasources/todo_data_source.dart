import 'package:google_dev_fest/features/show_todo/data/models/todo_model.dart';

import '../../domain/entities/todo.dart';

abstract class TodoDataSource {
  Future<List<TodoModel>> getListTodo();
  Future<TodoModel> createTodo(Todo todo);
  // Future<Either<Failure, String>> deleteTodo(String id);
  //Future<Either<Failure, String>> changeStatusTodo(String id);
}