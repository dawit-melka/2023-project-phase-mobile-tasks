import 'package:dartz/dartz.dart';
import 'package:todo_app_clean_architecture/features/todo/domain/repositories/todo_repository.dart';

import '../../../../shared/failure.dart';
import '../../../../shared/utils/useCase.dart';
import '../entities/todo.dart';

class DeleteTodoUseCase implements UseCase<Todo, Params<Todo>> {
  final TodoRepository repository;

  DeleteTodoUseCase({
    required this.repository,
  });
  
  @override
  Future<Either<Failure, Todo>> call(Params<Todo> params) {
    return repository.delete(params.data);
  }
  
}