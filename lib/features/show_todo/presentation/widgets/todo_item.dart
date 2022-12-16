import 'package:flutter/material.dart';
import 'package:google_dev_fest/features/show_todo/domain/entities/todo.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({Key? key, required this.todo}) : super(key: key);

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle() => const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        );

    Widget checkBox() => Checkbox(
      value: todo.isDone,
      onChanged: null,
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
