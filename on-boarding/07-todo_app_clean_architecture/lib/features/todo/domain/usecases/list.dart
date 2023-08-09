import 'package:dartz/dartz.dart';
import 'package:todo_app_clean_architecture/features/todo/domain/entities/todo.dart';
import 'package:todo_app_clean_architecture/features/todo/domain/repositories/todo_repository.dart';
import 'package:todo_app_clean_architecture/shared/failure.dart';
import 'package:todo_app_clean_architecture/shared/utils/useCase.dart';

class ListTodoUseCase implements UseCase<List<Todo>, NoParams> {
  final TodoRepository repository;

  ListTodoUseCase({
    required this.repository,
  });
  
  @override
  Future<Either<Failure, List<Todo>>> call(NoParams params) async {
    return await repository.getAll();
  }
}
