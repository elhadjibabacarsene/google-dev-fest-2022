import 'package:google_dev_fest/features/show_todo/domain/entities/todo.dart';

class TodoModel extends Todo {
  TodoModel({required id, required title, required isDone})
      : super(id: id, title: title, isDone: isDone);

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      title: json['title'],
      isDone: json['isDone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'isDone': isDone,
    };
  }
}
