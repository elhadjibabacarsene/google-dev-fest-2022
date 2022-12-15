import 'package:dartz/dartz.dart';
import 'package:google_dev_fest/core/error/failures.dart';
import 'package:google_dev_fest/core/usecases/usecases.dart';
import 'package:google_dev_fest/features/show_todo/domain/entities/todo.dart';

import '../repositories/todo_repository.dart';

class GetListTodo implements UseCases<List<Todo>, NoParams> {
  final TodoRepository todoRepository;

  const GetListTodo(this.todoRepository);

  @override
  Future<Either<Failure, List<Todo>>> call(NoParams params) async {
    return await todoRepository.getListTodo();
  }
}
