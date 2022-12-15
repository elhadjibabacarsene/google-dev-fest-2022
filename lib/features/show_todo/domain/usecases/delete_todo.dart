import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:google_dev_fest/core/error/failures.dart';
import 'package:google_dev_fest/core/usecases/usecases.dart';
import 'package:google_dev_fest/features/show_todo/domain/repositories/todo_repository.dart';

class DeleteTodo implements UseCases<String, Params> {
  final TodoRepository todoRepository;

  DeleteTodo(this.todoRepository);

  @override
  Future<Either<Failure, String>> call(Params params) async {
    return await todoRepository.deleteTodo(params.idTodo);
  }
}

class Params extends Equatable {
  final String idTodo;

  const Params({required this.idTodo});

  @override
  List<Object?> get props => [idTodo];
}
