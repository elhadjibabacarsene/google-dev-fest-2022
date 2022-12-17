import 'package:flutter/material.dart';
import 'package:google_dev_fest/features/show_todo/domain/entities/todo.dart';
import 'package:google_dev_fest/features/show_todo/presentation/bloc/todo_bloc.dart';
import 'package:google_dev_fest/single_app_variable.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({Key? key, required this.todo}) : super(key: key);

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle() => TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        decoration: todo.isDone == false ? null : TextDecoration.lineThrough);

    Widget checkBox() => Checkbox(
          value: todo.isDone,
          onChanged: (value) {
            sl<TodoBloc>().add(
              SetDoneTodo(id: todo.id!),
            );
          },
          shape: const StadiumBorder(),
        );

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            todo.title,
            style: titleStyle(),
          ),
          checkBox(),
        ],
      ),
    );
  }
}
