part of 'todo_bloc.dart';

@immutable
sealed class TodoState {}

final class TodoInitial extends TodoState {}

class LoadingState extends TodoState {}

class LoadedAllTasksState extends TodoState {
  final List<Task> tasks;

  LoadedAllTasksState({required this.tasks});
}

class LoadedSingleTaskState extends TodoState {
  final Task task;
  final List<Task> tasks;

  LoadedSingleTaskState({required this.task,
    required this.tasks,
  });
  
}

class ErrorState extends TodoState {}


