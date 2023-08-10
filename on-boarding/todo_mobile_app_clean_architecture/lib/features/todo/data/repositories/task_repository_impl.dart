import 'package:dartz/dartz.dart' as Dartz;
import 'package:todo_mobile_app_clean_architecture/core/errors/failure.dart';
import 'package:todo_mobile_app_clean_architecture/features/todo/domain/entities/task.dart';
import 'package:todo_mobile_app_clean_architecture/features/todo/domain/repositories/task_repository.dart';

import '../datasource/task_remote_database.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskRemoteDatabase remoteDatabase;

  TaskRepositoryImpl({
    required this.remoteDatabase
    });
  
  @override
  Future<Dartz.Either<Failure, Task>> completeTask(Task task) async {
    try {
      final result = await remoteDatabase.completeTask(task);
      return Dartz.Right(result);
    } catch (e) {
      return Dartz.Left(Failure("Oops, we couldn't update this task status"));
    }
  }

  @override
  Future<Dartz.Either<Failure, Task>> createTask(Task task) async {
    try {
      final result = await remoteDatabase.createTask(task);
      return Dartz.Right(result);
    } catch (e) {
      return Dartz.Left(Failure("Oops, we couldn't add this task"));
    }
  }

  @override
  Future<Dartz.Either<Failure, Task>> deleteTask(Task task) async {
    try {
      final result = await remoteDatabase.deleteTask(task);
      return Dartz.Right(result);
    } catch (e) {
      return Dartz.Left(Failure("Oops, we couldn't delete this task"));
    }
  }

  @override
  Future<Dartz.Either<Failure, Task>> updateTask(Task task) async {
    try {
      final result = await remoteDatabase.updateTask(task);
      return Dartz.Right(result);
    } catch (e) {
      return Dartz.Left(Failure("Oops, we couldn't update this task"));
    }
  }

  @override
  Future<Dartz.Either<Failure, List<Task>>> getAllTasks() async {
    try {
      final result = await remoteDatabase.getAllTasks();
      return Dartz.Right(result);
    } catch (e) {
      return Dartz.Left(Failure("Oops, we couldn't fetch tasks from the database"));
    }
  }

  @override
  Future<Dartz.Either<Failure, Task>> getTask(String id) async {
    try {
      final result = await remoteDatabase.getTask(id);
      return Dartz.Right(result);
    } catch (e) {
      return Dartz.Left(Failure("Oops, we couldn't find this task"));
    }
  }
  
}