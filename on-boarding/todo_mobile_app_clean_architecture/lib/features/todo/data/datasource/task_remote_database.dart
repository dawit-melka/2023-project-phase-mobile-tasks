


import '../../domain/entities/task.dart';

abstract class TaskRemoteDatabase{
  Future<Task> createTask(Task task);
  Future<Task> updateTask(Task task);
  Future<Task> deleteTask(Task task);
  Future<Task> completeTask(Task task);
  Future<Task> getTask(String id);
  Future<List<Task>> getAllTasks();
}

class TaskRemoteDatabaseImpl implements TaskRemoteDatabase {
  @override
  Future<Task> createTask(Task task) async {
    // TODO: implement completeTask
    throw UnimplementedError();
  }

  @override
  Future<Task> completeTask(Task task) {
    // TODO: implement completeTask
    throw UnimplementedError();
  }

  @override
  Future<Task> deleteTask(Task task) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<Task> updateTask(Task task) {
    // TODO: implement editTask
    throw UnimplementedError();
  }

  @override
  Future<List<Task>> getAllTasks() {
    // TODO: implement getAllTasks
    throw UnimplementedError();
  }

  @override
  Future<Task> getTask(String id) {
    // TODO: implement getTask
    throw UnimplementedError();
  }

}