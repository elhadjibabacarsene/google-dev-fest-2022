import 'package:get_it/get_it.dart';
import 'package:google_dev_fest/core/firebase_helper/firebase_db.dart';
import 'package:google_dev_fest/features/show_todo/data/datasources/todo_data_source.dart';
import 'package:google_dev_fest/features/show_todo/data/repositories/todo_repository_impl.dart';

import 'features/show_todo/presentation/bloc/todo_bloc.dart';

final sl = GetIt.instance;

void init(){
  sl.registerSingleton<FirebaseDB>(FirebaseDB());
  sl.registerSingleton<TodoDataSourceImpl>(TodoDataSourceImpl(firebaseDB: sl()));
  sl.registerSingleton<TodoRepositoryImpl>(TodoRepositoryImpl(todoDataSourceImpl: sl()));
  sl.registerSingleton<TodoBloc>(TodoBloc());
}