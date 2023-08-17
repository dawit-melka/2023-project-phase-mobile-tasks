import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
// import 'package:todo_mobile_app_clean_architecture/core/utils/usecase.dart';
import 'package:todo_mobile_app_clean_architecture/features/todo/domain/entities/task.dart';

// import '../../domain/usecases/create_task.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    on<TaskInitialEvent>(taskInitialEvent);
    on<CreateTaskEvent>(createTaskEvent);
    on<UpdateTaskEvent>(updateTaskEvent);
    on<DeleteTaskEvent>(deleteTaskEvent);
    on<GetSingleTaskEvent>(getSingleTaskEvent);
    on<LoadAllTasksEvent>(loadAllTasksEvent);
  }

  FutureOr<void> taskInitialEvent(
      TaskInitialEvent event, Emitter<TodoState> emit) {}

  FutureOr<void> createTaskEvent(
      CreateTaskEvent event, Emitter<TodoState> emit) {
        try {
          // Perform the task creation logic using the CreateTaskUseCase
          // final result = await CreateTaskUseCase()
          // Check the result and emit appropriate states
          // result.fold(
            // (failure) {
            //   emit(ErrorState(errorMessage: 'Failed to create task'));
            // },
            // (createdTask) {
            //   // If successful, update the state with the new task
            //   final state = this.state;
            //   if (state is LoadedAllTasksState) {
            //     emit(LoadedAllTasksState(tasks: List.from(state.tasks)..add(createdTask)));
            //   }
            // },
        final state = this.state;
        if (state is LoadedAllTasksState){
          emit(
            LoadedAllTasksState(tasks: List.from(state.tasks)..add(event.task))
          );
        }

        } catch(e) {
          // Handle unexpected exceptions and emit an error state
          emit(ErrorState());
        }
      }

  FutureOr<void> updateTaskEvent(
      UpdateTaskEvent event, Emitter<TodoState> emit) {
        final state = this.state;
        if (state is LoadedSingleTaskState){
          List <Task> tasks = (state.tasks.map((task) {
            return task.id == event.task.id ? event.task : task;
          })).toList();
          emit(LoadedSingleTaskState(task: event.task, tasks: tasks));
        }
      }

  FutureOr<void> deleteTaskEvent(
      DeleteTaskEvent event, Emitter<TodoState> emit) {
        final state = this.state;
        if (state is LoadedAllTasksState){
          List<Task> tasks = state.tasks.where((task){
            return task.id != event.task.id;
          }).toList();
          emit(LoadedAllTasksState(tasks: tasks));
        }
      }

  FutureOr<void> getSingleTaskEvent(
      GetSingleTaskEvent event, Emitter<TodoState> emit) {
        emit(LoadedSingleTaskState(task: event.task, tasks: event.tasks));
      }

  FutureOr<void> loadAllTasksEvent(
      LoadAllTasksEvent event, Emitter<TodoState> emit) {
    emit(
      LoadedAllTasksState(tasks: event.tasks),
    );
  }
}
