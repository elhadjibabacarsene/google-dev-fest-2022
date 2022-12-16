import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:google_dev_fest/core/error/failures.dart';
import 'package:google_dev_fest/core/usecases/usecases.dart';
import 'package:google_dev_fest/features/show_todo/data/repositories/todo_repository_impl.dart';
import 'package:google_dev_fest/features/show_todo/domain/entities/todo.dart';
import 'package:google_dev_fest/single_app_variable.dart';
import '../repositories/todo_repository.dart';

class ChangeStatusTodo implements UseCases<void, Params> {
  @override
  Future<Either<Failure, void>> call(Params params) {
    final TodoRepositoryImpl todoRepository = sl<TodoRepositoryImpl>();
    return todoRepository.changeStatus(params.todo);
  }
}

class Params extends Equatable {
  Todo todo;
  Params({required this.todo});

  @override
  List<Object?> get props => [id];
}
