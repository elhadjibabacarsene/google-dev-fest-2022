import 'package:dartz/dartz.dart';
import 'package:google_dev_fest/core/error/exceptions.dart';
import 'package:google_dev_fest/core/error/failures.dart';
import 'package:google_dev_fest/core/firebase_helper/firebase_db.dart';
import 'package:google_dev_fest/features/show_todo/data/datasources/todo_data_source.dart';
import 'package:google_dev_fest/features/show_todo/domain/entities/todo.dart';
import 'package:google_dev_fest/features/show_todo/domain/repositories/todo_repository.dart';
import '../models/todo_model.dart';

class TodoRepositoryImpl implements TodoRepository {
  //final TodoDataSource todoDataSource;
  final TodoDataSourceImpl todoDataSourceImpl;
  TodoRepositoryImpl({required this.todoDataSourceImpl});

  @override
  Future<Either<Failure, String>> changeStatusTodo(String id) {
    // TODO: implement changeStatusTodo
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Todo>> createTodo(Todo todo) async {
    try {
      await todoDataSourceImpl.createTodo(TodoModel(id: todo.id, title: todo.title, isDone: todo.isDone));
      return Right(todo);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> deleteTodo(String id) {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Todo>>> getListTodo() async {
    try {
      final List<TodoModel> listTodo = await todoDataSourceImpl.getListTodo();
      return Right(listTodo);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
