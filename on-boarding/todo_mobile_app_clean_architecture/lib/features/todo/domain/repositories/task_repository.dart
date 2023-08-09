import 'package:dartz/dartz.dart' as Dartz;
import 'package:todo_mobile_app_clean_architecture/core/errors/failure.dart';
import 'package:todo_mobile_app_clean_architecture/features/todo/domain/entities/task.dart';

abstract class TaskRepository {
  Future<Dartz.Either<Failure, Task>> createTask(Task task);
  Future<Dartz.Either<Failure, Task>> editTask(Task task);
  Future<Dartz.Either<Failure, Task>> deleteTask(Task task);
  Future<Dartz.Either<Failure, Task>> completeTask(Task task);
  Future<Dartz.Either<Failure, Task>> getTask(String id);
  Future<Dartz.Either<Failure, List<Task>>> getAllTasks();
}