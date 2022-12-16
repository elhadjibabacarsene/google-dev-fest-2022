import 'package:dartz/dartz.dart';
import 'package:google_dev_fest/features/show_todo/data/models/todo_model.dart';

import '../../../../core/error/failures.dart';
import '../entities/todo.dart';

abstract class TodoRepository {
  Future<Either<Failure, List<Todo>>> getListTodo(); // return todoList
  Future<Either<Failure, int>> createTodo(TodoModel todo);
}