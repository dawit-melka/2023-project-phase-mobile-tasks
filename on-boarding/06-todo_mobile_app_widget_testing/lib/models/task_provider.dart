import 'package:flutter/material.dart';
import 'package:todo_mobile_app/models/models.dart';

class TaskProvider extends ChangeNotifier {
  final List<Task> _tasks = [
    Task('Sample Task 1', '2023-08-10 12:00 PM', 'This is the first sample task.'),
    Task('Sample Task 2', '2023-08-15 3:30 PM', 'This is the second sample task.'),
  ];

  List<Task> get tasks => _tasks;
  
  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }
}