part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

class TaskInitialEvent extends TodoEvent {}

class CreateTaskEvent extends TodoEvent {
  final Task task;

  CreateTaskEvent({required this.task});
}

class UpdateTaskEvent extends TodoEvent {
  final Task task;

  UpdateTaskEvent({required this.task});
}

class DeleteTaskEvent extends TodoEvent {
  final Task task;

  DeleteTaskEvent({required this.task});
}

class GetSingleTaskEvent extends TodoEvent {
  final Task task;
  final List<Task> tasks;

  GetSingleTaskEvent({required this.task, required this.tasks});
}

class LoadAllTasksEvent extends TodoEvent {
  final List<Task> tasks;

  LoadAllTasksEvent({required this.tasks});
}



