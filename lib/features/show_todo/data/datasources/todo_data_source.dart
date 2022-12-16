import 'dart:convert';

import 'package:google_dev_fest/core/error/exceptions.dart';
import 'package:google_dev_fest/core/firebase_helper/firebase_db.dart';
import 'package:google_dev_fest/features/show_todo/data/models/todo_model.dart';
// import 'package:http/http.dart' as http;
import '../../domain/entities/todo.dart';

abstract class TodoDataSource {
  Future<List<TodoModel>> getListTodo();
  Future<TodoModel> createTodo(TodoModel todo);
  // Future<Either<Failure, String>> deleteTodo(String id);
  //Future<Either<Failure, String>> changeStatusTodo(String id);
}

class TodoDataSourceImpl implements TodoDataSource {
  final FirebaseDB firebaseDB;
  TodoDataSourceImpl({required this.firebaseDB});

  @override
  Future<TodoModel> createTodo(TodoModel todo) async {
    try {
      var key = firebaseDB.dbRef.child('Todos').push().key;
      todo.id = key!;
      await firebaseDB.dbRef.child('Todos').child(key).set(todo.toJson());
      return todo;
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<TodoModel>> getListTodo() async {
    try {
      List<TodoModel> todoList = [];
      var data = await firebaseDB.dbRef.child('Todos').get();
      (data.value as Map).forEach((key, value) {
        final json = Map<String, dynamic>.from(value);
        todoList.add(TodoModel.fromJson(json));
      });
      return todoList;
    } catch (e) {
      throw ServerException();
    }
  }
}
