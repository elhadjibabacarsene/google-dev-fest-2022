import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_dev_fest/features/show_todo/domain/entities/todo.dart';
import 'package:google_dev_fest/features/show_todo/presentation/bloc/todo_bloc.dart';
import 'package:google_dev_fest/features/show_todo/presentation/widgets/add_todo_dialog.dart';

import '../../../../single_app_variable.dart';
import '../widgets/todo_item.dart';

class ListTodo extends StatelessWidget {
  const ListTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // function who call dialog
    displayDialog() {
      return showDialog(
        context: context,
        builder: (_) {
          return const AddTodoDialog();
        },
      );
    }

    return BlocProvider(
      create: (BuildContext context) => sl<TodoBloc>()..add(FetchListTodo()),
      child: BlocListener<TodoBloc, TodoState>(
        listener: (context, state) {
          if (state is TodoAdded || state is TodoIsDone) {
            sl<TodoBloc>().add(FetchListTodo());
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('My Todo App'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
              return state is ListLoad
                  ? state.listTodo.isNotEmpty
                      ? Column(
                          children: List.generate(
                          state.listTodo.length,
                          (index) => TodoItem(
                            todo: Todo(
                              id: state.listTodo[index].id,
                              title: state.listTodo[index].title,
                              isDone: state.listTodo[index].isDone,
                            ),
                          ),
                        ))
                      : const CircularProgressIndicator()
                  : const Center(
                      child: Text('Aucune tâche'),
                    );
            }),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: displayDialog,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
