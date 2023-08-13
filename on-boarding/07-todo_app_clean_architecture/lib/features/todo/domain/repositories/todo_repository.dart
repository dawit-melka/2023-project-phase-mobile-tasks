import 'package:dartz/dartz.dart';
import 'package:todo_app_clean_architecture/features/todo/domain/entities/todo.dart';
import 'package:todo_app_clean_architecture/shared/failure.dart';

abstract class TodoRepository {
  // Add Todo
  Future<Either<Failure, Todo>> add(Todo todo);

  // Edit Todo
  Future<Either<Failure, Todo>> edit(Todo todo);
  // Delete
  Future<Either<Failure, Todo>>delete(Todo todo);

  // Complete
  Future<Either<Failure, Todo>>complete(Todo todo);

  // Get All Todo
  Future <Either<Failure, List<Todo>>> getAll();
}