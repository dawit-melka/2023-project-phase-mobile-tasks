
import 'package:dartz/dartz.dart' as Dartz;
import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/task.dart';
import '../repositories/task_repository.dart';

class ViewAllTasksUseCase implements UseCase<List<Task>, NoParams> {
  final TaskRepository repository;

  ViewAllTasksUseCase(this.repository);



  @override
  Future<Dartz.Either<Failure, List<Task>>> call(NoParams params) async {
    return await repository.getAllTasks();
  }
}
