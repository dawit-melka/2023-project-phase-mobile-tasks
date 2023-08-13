import 'package:dartz/dartz.dart';
import 'package:todo_app_clean_architecture/features/todo/domain/entities/todo.dart';
import 'package:todo_app_clean_architecture/features/todo/domain/repositories/todo_repository.dart';
import 'package:todo_app_clean_architecture/shared/failure.dart';
import 'package:todo_app_clean_architecture/shared/utils/useCase.dart';

class AddTodoUseCase implements UseCase<Todo, Params<Todo>> {
  final TodoRepository repository;

  AddTodoUseCase({
    required this.repository,
  });
  
  @override
  Future<Either<Failure, Todo>> call(Params params) async {
    return await repository.add(params.data);
  }
}
