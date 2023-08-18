import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:todo_mobile_app_clean_architecture/core/network/network_info.dart';
import 'package:http/http.dart' as http;

import 'features/todo/domain/usecases/create_task.dart';
import 'features/todo/domain/usecases/delete_task.dart';
import 'features/todo/domain/usecases/update_task.dart';
import 'features/todo/domain/usecases/view_all_tasks.dart';
import 'features/todo/domain/usecases/view_task.dart';
import 'features/todo/presentation/bloc/todo_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Todo app
  // Bloc
  sl.registerFactory(() => TodoBloc());

  // Use cases
  sl.registerSingleton(() => CreateTaskUseCase(sl()));
  sl.registerSingleton(() => UpdateTaskUseCase(sl()));
  sl.registerSingleton(() => DeleteTaskUseCase(sl()));
  sl.registerSingleton(() => ViewTaskUseCase(sl()));
  sl.registerSingleton(() => ViewAllTasksUseCase(sl()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  sl.registerLazySingleton(()=> http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}