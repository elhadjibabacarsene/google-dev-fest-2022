import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:google_dev_fest/core/error/errors_text.dart';
import 'package:google_dev_fest/core/usecases/usecases.dart';
import 'package:google_dev_fest/features/show_todo/domain/entities/todo.dart';
import 'package:google_dev_fest/features/show_todo/domain/usecases/create_todo.dart';
import 'package:google_dev_fest/features/show_todo/domain/usecases/get_list_todo.dart';

import '../../../../core/error/failures.dart';

part 'todo_event.dart';

part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final GetListTodo getListTodo = GetListTodo();
  final CreateTodo createTodo = CreateTodo();

  TodoBloc() : super(TodoInitial()) {
    on<FetchListTodo>((event, emit) async {
      // emit loading state
      emit(TodoLoading());
      // get result or error
      final Either<Failure, List<Todo>> failureOrListTodo =
          await getListTodo(NoParams());
      // check state
      emit(
        failureOrListTodo.fold(
          (failure) => TodoError(errorMessage: getErrorMessage(failure)),
          (listTodo) => ListLoad(listTodo: listTodo),
        ),
      );
    });

    on<AddTodo>((event, emit) async {
      // emit loading state
      emit(TodoLoading());
      final Either<Failure, int> failureOrStatusCode = await createTodo(Params(
        todo: Todo(title: event.title),
      ));
      // check state
      emit(
        failureOrStatusCode.fold(
          (failure) => TodoError(errorMessage: getErrorMessage(failure)),
          (listTodo) => TodoAdded(),
        ),
      );
    });
  }

  String getErrorMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      default:
        return 'Unexpected Error';
    }
  }
}
