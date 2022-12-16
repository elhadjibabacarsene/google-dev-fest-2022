import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_dev_fest/core/firebase_helper/firebase_db.dart';
import 'package:google_dev_fest/features/show_todo/data/models/todo_model.dart';
import 'package:google_dev_fest/features/show_todo/presentation/pages/list_todo.dart';
import 'dart:async';
import 'features/show_todo/data/datasources/todo_data_source.dart';
import 'features/show_todo/domain/usecases/create_todo.dart';
import 'features/show_todo/presentation/bloc/todo_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

// options: const FirebaseOptions(
//           apiKey: "AIzaSyAm-zd9HT0QD-_mNm04c4h22bRV4hu9C-0",
//           appId: "com.example.googleDevFest",
//           messagingSenderId: "744011737025",
//           projectId: "dev-fest-83f72")
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const ListTodo(),
    );
  }
}
