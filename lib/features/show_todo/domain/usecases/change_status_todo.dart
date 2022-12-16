import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:google_dev_fest/core/error/failures.dart';
import 'package:google_dev_fest/core/usecases/usecases.dart';
import '../repositories/todo_repository.dart';

class ChangeStatusTodo implements UseCases<String, Params> {
  TodoRepository todoRepository;

  ChangeStatusTodo({required this.todoRepository});

  @override
  Future<Either<Failure, String>> call(Params params) {
    return todoRepository.changeStatusTodo(params.id);
  }
}

class Params extends Equatable {
  final String id;

  const Params({required this.id});

  @override
  List<Object?> get props => [id];
}
