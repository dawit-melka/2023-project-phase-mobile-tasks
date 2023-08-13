
import 'package:dartz/dartz.dart';
import 'package:todo_app_clean_architecture/features/todo/domain/entities/todo.dart';
import 'package:todo_app_clean_architecture/features/todo/domain/repositories/todo_repository.dart';
import 'package:todo_app_clean_architecture/shared/failure.dart';

import '../datasource/todo_remote_database.dart';

class TodoRepositoryImpl implements TodoRepository {

  final TodoRemoteDatabase remoteDatabase;
  TodoRepositoryImpl({
    required this.remoteDatabase,
  });

  @override
  Future<Either<Failure, Todo>> add(Todo todo) async {
    try{
      final result = await remoteDatabase.addTodo(todo);
      return Right(result);
    } catch (e) {
      return Left(Failure("Oops, we couldn't add this todo"));
    }
  }

  @override
  Future<Either<Failure, Todo>> delete(Todo todo) async {
    try{
      final result = await remoteDatabase.deleteTodo(todo);
      return Right(result);
    } catch (e) {
      return Left(Failure("Oops, we couldn't delete this todo"));
    }
  }

  @override
  Future<Either<Failure, Todo>> edit(Todo todo) async {
    try{
      final result = await remoteDatabase.editTodo(todo);
      return Right(result);
    } catch (e) {
      return Left(Failure("Oops, we couldn't edit this todo"));
    }
  }

  @override
  Future<Either<Failure, List<Todo>>> getAll() async {
    try{
      final results = await remoteDatabase.listTodos();
      return Right(results);
    } catch (e) {
      return Left(Failure("Oops, we couldn't fetch todos from the database"));
    }
  }
  
  @override
  Future<Either<Failure, Todo>> complete(Todo todo) async {
    try{
      final result = await remoteDatabase.completeTodo(todo);
      return Right(result);
    } catch (e) {
      return Left(Failure("Oops, we couldn't update this todo"));
    }
  }
}