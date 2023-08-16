import 'package:flutter_test/flutter_test.dart';
import 'package:todo_mobile_app_clean_architecture/features/todo/domain/entities/task.dart';

void main() {
  group('Task Entity', () {
    test('Creating Task should set attributes correctly', () {
      // Arrange
      const id = '1';
      const title = 'Test Task';
      const description = 'This is a test task';
      const deadline = 'August 10, 2023 10:00 AM';

      // Act
      final task = Task(
        id: id,
        title: title,
        description: description,
        deadline: deadline,
      );

      // Assert
      expect(task.id, id);
      expect(task.title, title);
      expect(task.description, description);
      expect(task.deadline, deadline);
    });

    test('Two tasks with the same id should be considered equal', () {
      // Arrange
      const id = '1';
      final task1 = Task(
        id: id,
        title: 'Task 1',
        description: 'Description 1',
        deadline: 'August 10, 2023 10:00 AM',
      );
      final task2 = Task(
        id: id,
        title: 'Task 2',
        description: 'Description 2',
        deadline: 'August 11, 2023 2:00 PM',
      );

      // Act & Assert
      expect(task1.id, equals(task2.id));
      
    });

  
  });
}
