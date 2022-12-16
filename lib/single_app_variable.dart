import 'package:get_it/get_it.dart';
import 'package:google_dev_fest/core/firebase_helper/firebase_db.dart';
import 'package:google_dev_fest/features/show_todo/data/datasources/todo_data_source.dart';
import 'package:google_dev_fest/features/show_todo/data/repositories/todo_repository_impl.dart';

final singelvariable = GetIt.instance;

void init(){
  singelvariable.registerSingleton<FirebaseDB>(FirebaseDB());
  singelvariable.registerSingleton<TodoDataSourceImpl>(TodoDataSourceImpl(firebaseDB: singelvariable()));
  singelvariable.registerSingleton<TodoRepositoryImpl>(TodoRepositoryImpl(todoDataSourceImpl: singelvariable()));
}