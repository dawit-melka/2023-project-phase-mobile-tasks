import 'package:dartz/dartz.dart' as Dartz;
import '../../../../core/errors/failure.dart';
import '../entities/task.dart';

abstract class TaskRepository {
  Future<Dartz.Either<Failure, Task>> createTask(Task task);
  Future<Dartz.Either<Failure, Task>> updateTask(Task task);
  Future<Dartz.Either<Failure, Task>> deleteTask(Task task);
  Future<Dartz.Either<Failure, Task>> completeTask(Task task);
  Future<Dartz.Either<Failure, Task>> getTask(String id);
  Future<Dartz.Either<Failure, List<Task>>> getAllTasks();
}
