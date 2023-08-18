
import 'package:dartz/dartz.dart' as Dartz;
import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/task.dart';
import '../repositories/task_repository.dart';

class ViewTaskUseCase implements UseCase<Task, String> {
  final TaskRepository repository;

  ViewTaskUseCase(this.repository);

  

  @override
  Future<Dartz.Either<Failure, Task>> call(String id) async {
    return await repository.getTask(id);
  }
}
