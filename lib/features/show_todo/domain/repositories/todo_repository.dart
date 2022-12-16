import 'package:dartz/dartz.dart';
import 'package:google_dev_fest/features/show_todo/data/models/todo_model.dart';

import '../../../../core/error/failures.dart';
import '../entities/todo.dart';

abstract class TodoRepository {
  Future<Either<Failure, List<Todo>>> getListTodo(); // return todoList
  Future<Either<Failure, int>> createTodo(Todo todo); // return todoObject
  Future<Either<Failure, String>> deleteTodo(String id); // return id
  Future<Either<Failure, void>> changeStatus(Todo todo); // return id
}