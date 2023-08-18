
import 'package:dartz/dartz.dart' as Dartz;
import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/task.dart';
import '../repositories/task_repository.dart';

class UpdateTaskUseCase implements UseCase<Task, Params<Task>> {
  final TaskRepository repository;

  UpdateTaskUseCase(this.repository);

 
  @override
  Future<Dartz.Either<Failure, Task>> call(Params<Task> params) async {
    return await repository.updateTask(params.data);
  }
}
