
import 'package:dartz/dartz.dart' as Dartz;
import 'package:todo_mobile_app_clean_architecture/core/errors/failure.dart';
import 'package:todo_mobile_app_clean_architecture/core/utils/usecase.dart';
import 'package:todo_mobile_app_clean_architecture/features/todo/domain/entities/task.dart';
import 'package:todo_mobile_app_clean_architecture/features/todo/domain/repositories/task_repository.dart';

class ViewAllTasksUseCase implements UseCase<List<Task>, NoParams> {
  final TaskRepository repository;

  ViewAllTasksUseCase({
    required this.repository,
  });

  @override
  Future<Dartz.Either<Failure, List<Task>>> call(NoParams params) async {
    return await repository.getAllTasks();
  }
}
