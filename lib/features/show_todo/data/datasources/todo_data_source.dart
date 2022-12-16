import 'dart:convert';

import 'package:google_dev_fest/core/error/exceptions.dart';
import 'package:google_dev_fest/core/firebase_helper/firebase_db.dart';
import 'package:google_dev_fest/features/show_todo/data/models/todo_model.dart';
// import 'package:http/http.dart' as http;
import '../../domain/entities/todo.dart';

abstract class TodoDataSource {
  Future<List<Todo>> getListTodo();
  Future<int> createTodo(TodoModel todo);
  Future<void> makeDone(String id);

}

class TodoDataSourceImpl implements TodoDataSource {
  final FirebaseDB firebaseDB;
  TodoDataSourceImpl({required this.firebaseDB});

  @override
  Future<int> createTodo(TodoModel todo) async {
    try {
      var key = firebaseDB.dbRef.child('Todos').push().key;
      todo.id = key!;
      await firebaseDB.dbRef.child('Todos').child(key).set(todo.toJson());
      return 200;
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<Todo>> getListTodo() async {
    try {
      List<Todo> todoList = [];
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
  
  @override
  Future<void> makeDone(String id) async{
    try {
      firebaseDB.dbRef.child('Todos').child(id).update({'isDone': true});
    } catch (e) {
       throw ServerException();
    }
  }


}
