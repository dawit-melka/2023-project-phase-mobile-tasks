
import 'package:dartz/dartz.dart' as Dartz;
import 'package:todo_mobile_app_clean_architecture/core/errors/failure.dart';
import 'package:todo_mobile_app_clean_architecture/core/utils/usecase.dart';
import 'package:todo_mobile_app_clean_architecture/features/todo/domain/entities/task.dart';
import 'package:todo_mobile_app_clean_architecture/features/todo/domain/repositories/task_repository.dart';

class DeleteTaskUseCase implements UseCase<Task, Params<Task>> {
  final TaskRepository repository;

  DeleteTaskUseCase({
    required this.repository,
  });

  @override
  Future<Dartz.Either<Failure, Task>> call(Params<Task> params) async {
    return await repository.deleteTask(params.data);
  }
}