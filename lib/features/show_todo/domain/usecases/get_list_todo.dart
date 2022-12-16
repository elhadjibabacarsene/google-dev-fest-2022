import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:google_dev_fest/core/error/failures.dart';
import 'package:google_dev_fest/core/usecases/usecases.dart';
import 'package:google_dev_fest/features/show_todo/domain/entities/todo.dart';

import '../../../../single_app_variable.dart';
import '../../data/repositories/todo_repository_impl.dart';
import '../repositories/todo_repository.dart';

class GetListTodo implements UseCases<List<Todo>, NoParams> {
  @override
  Future<Either<Failure, List<Todo>>> call(NoParams params) async {
    var todoRepository = sl<TodoRepositoryImpl>();
    return await todoRepository.getListTodo();
  }
}
