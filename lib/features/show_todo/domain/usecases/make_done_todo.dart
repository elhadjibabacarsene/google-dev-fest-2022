
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:google_dev_fest/core/error/failures.dart';
import 'package:google_dev_fest/core/usecases/usecases.dart';
import 'package:google_dev_fest/features/show_todo/data/repositories/todo_repository_impl.dart';

import '../../../../single_app_variable.dart';

class MakeDoneTodo implements UseCases<void, MakeDoneTodoParam> {

  @override
  Future<Either<Failure, void>> call(MakeDoneTodoParam param) async {
    final TodoRepositoryImpl todoRepositoryImpl = sl<TodoRepositoryImpl>();
    return await todoRepositoryImpl.makeDone(param.id);
  }

}

class MakeDoneTodoParam extends Equatable {
  final String id;

  const MakeDoneTodoParam({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];


}