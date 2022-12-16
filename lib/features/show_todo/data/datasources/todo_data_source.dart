import 'package:google_dev_fest/features/show_todo/data/models/todo_model.dart';
import 'package:http/http.dart' as http;

import '../../domain/entities/todo.dart';

abstract class TodoDataSource {
  Future<List<TodoModel>> getListTodo();
  Future<TodoModel> createTodo(Todo todo);
  // Future<Either<Failure, String>> deleteTodo(String id);
  //Future<Either<Failure, String>> changeStatusTodo(String id);
}

class TodoDataSourceImpl implements TodoDataSource {
  final http.Client client;
  
  const TodoDataSourceImpl({required this.client});

  @override
  Future<TodoModel> createTodo(Todo todo) {
    // TODO: implement createTodo
    throw UnimplementedError();
  }

  @override
  Future<List<TodoModel>> getListTodo() {
    // TODO: implement getListTodo
    throw UnimplementedError();
  }
}