import 'package:flutter/material.dart';
import 'package:google_dev_fest/features/show_todo/domain/entities/todo.dart';
import 'package:google_dev_fest/features/show_todo/presentation/widgets/add_todo_dialog.dart';

import '../widgets/todo_item.dart';

class ListTodo extends StatelessWidget {
  const ListTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // function who call dialog
    displayDialog() {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AddTodoDialog();
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Todo App'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            TodoItem(
              todo: Todo(id: '12', title: 'Daily meeting', isDone: false),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: displayDialog,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
