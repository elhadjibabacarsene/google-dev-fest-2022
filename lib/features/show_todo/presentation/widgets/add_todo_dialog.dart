import 'package:flutter/material.dart';

import '../../../../single_app_variable.dart';
import '../bloc/todo_bloc.dart';

class AddTodoDialog extends StatefulWidget {
  const AddTodoDialog({Key? key}) : super(key: key);

  @override
  State<AddTodoDialog> createState() => _AddTodoDialogState();
}

class _AddTodoDialogState extends State<AddTodoDialog> {
  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Ajouter une tâche'),
      content: TextField(
        controller: _textFieldController,
        decoration: const InputDecoration(hintText: 'Entrer un titre ...'),
      ),
      actions: [
        TextButton(
          child: const Text('ANNULER'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('AJOUTER'),
          onPressed: () {
            sl<TodoBloc>().add(AddTodo(title: _textFieldController.text));
            Navigator.of(context).pop();
            // _addTodoItem(_textFieldController.text);
          },
        )
      ],
    );
  }
}
