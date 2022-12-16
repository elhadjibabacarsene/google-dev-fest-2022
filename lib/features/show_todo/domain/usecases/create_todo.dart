import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:google_dev_fest/core/error/failures.dart';
import 'package:google_dev_fest/core/usecases/usecases.dart';
import 'package:google_dev_fest/features/show_todo/data/models/todo_model.dart';
import 'package:google_dev_fest/features/show_todo/domain/entities/todo.dart';
import '../../data/repositories/todo_repository_impl.dart';

class CreateTodo implements UseCases<Todo, Params> {
  
  @override
  Future<Either<Failure, Todo>> call(Params params) async {
     var todoRepository = GetIt.instance<TodoRepositoryImpl>();
    return await todoRepository.createTodo(params.todo);
  }
}

class Params extends Equatable {
  final Todo todo;

  const Params({required this.todo});

  @override
  // TODO: implement props
  List<Object?> get props => [todo];
}
