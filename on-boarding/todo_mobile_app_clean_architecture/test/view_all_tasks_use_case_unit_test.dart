import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart' as Dartz;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_mobile_app_clean_architecture/core/errors/failure.dart';
import 'package:todo_mobile_app_clean_architecture/core/usecases/usecase.dart';
import 'package:todo_mobile_app_clean_architecture/features/todo/domain/entities/task.dart';
import 'package:todo_mobile_app_clean_architecture/features/todo/domain/repositories/task_repository.dart';
import 'package:todo_mobile_app_clean_architecture/features/todo/domain/usecases/view_all_tasks.dart';
import 'view_all_tasks_use_case_unit_test.mocks.dart';
@GenerateNiceMocks([
  MockSpec<TaskRepository>()
])

void main() {

  group('ViewAllTasksUseCase', () {
    late ViewAllTasksUseCase useCase;
    late MockTaskRepository mockRepository;

    setUp(() {
      mockRepository = MockTaskRepository();
      useCase = ViewAllTasksUseCase(repository: mockRepository);
    });

    final tasks = [
      Task(
        id: '1',
        title: 'Task 1',
        description: 'Description 1',
        deadline: 'August 10, 2023 10:00 AM',
      ),
      Task(
        id: '2',
        title: 'Task 2',
        description: 'Description 2',
        deadline: 'August 11, 2023 2:00 PM',
      ),
    ];

    test('should retrieve a list of tasks from the repository', () async {
      // Arrange
      when(mockRepository.getAllTasks())
          .thenAnswer((_) async => Dartz.Right(tasks));

      // Act
      final result = await useCase(NoParams());

      // Assert
      expect(result, equals(Dartz.Right(tasks)));
      verify(mockRepository.getAllTasks());
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return a failure when repository call is unsuccessful', () async {
      // Arrange
      final failure = Failure('Failed to retrieve tasks');
      when(mockRepository.getAllTasks())
          .thenAnswer((_) async => Dartz.Left(failure));

      // Act
      final result = await useCase(NoParams());

      // Assert
      expect(result, equals(Dartz.Left(failure)));
      verify(mockRepository.getAllTasks());
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
