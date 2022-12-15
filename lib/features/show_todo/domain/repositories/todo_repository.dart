import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/todo.dart';

abstract class TodoRepository {
  Future<Either<Failure, List<Todo>>> getListTodo(); // return todoList
  Future<Either<Failure, Todo>> createTodo(Todo todo); // return todoObject
  Future<Either<Failure, String>> deleteTodo(String id); // return id
  Future<Either<Failure, String>> changeStatusTodo(String id); // return id
}