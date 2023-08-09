import 'package:flutter_test/flutter_test.dart';
import 'package:todo_mobile_app_clean_architecture/features/todo/data/models/task_model.dart';

void main() {
  final taskModelJson = {
    'id': '123',
    'title': 'Test Task',
    'description': 'Test description',
    'deadline': 'August 10, 2023 10:00 AM',
    'status': true,
  };

  test('should be able to create TaskModel from JSON', () {
    final taskModel = TaskModel.fromJson(taskModelJson);

    expect(taskModel.id, '123');
    expect(taskModel.title, 'Test Task');
    expect(taskModel.description, 'Test description');
    expect(taskModel.deadline, 'August 10, 2023 10:00 AM');
    expect(taskModel.status, true);
  });

  test('should be able to convert TaskModel to JSON', () {
    final taskModel = TaskModel(
      id: '123',
      title: 'Test Task',
      description: 'Test description',
      deadline: 'August 10, 2023 10:00 AM',
      status: true,
    );

    final json = taskModel.toJson();

    expect(json['id'], '123');
    expect(json['title'], 'Test Task');
    expect(json['description'], 'Test description');
    expect(json['deadline'], 'August 10, 2023 10:00 AM');
    expect(json['status'], true);
  });
}
