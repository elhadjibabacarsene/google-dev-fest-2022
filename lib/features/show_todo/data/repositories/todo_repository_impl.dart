import 'package:dartz/dartz.dart';
import 'package:google_dev_fest/core/error/failures.dart';
import 'package:google_dev_fest/features/show_todo/data/datasources/todo_data_source.dart';
import 'package:google_dev_fest/features/show_todo/domain/entities/todo.dart';
import 'package:google_dev_fest/features/show_todo/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource todoDataSource;

  TodoRepositoryImpl({required this.todoDataSource});

  @override
  Future<Either<Failure, String>> changeStatusTodo(String id) {
    // TODO: implement changeStatusTodo
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Todo>> createTodo(Todo todo) {
    // TODO: implement createTodo
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> deleteTodo(String id) {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Todo>>> getListTodo() {
    // TODO: implement getListTodo
    throw UnimplementedError();
  }
}
