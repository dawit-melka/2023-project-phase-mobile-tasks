# Todo Mobile App - Clean Architecture and Feature Enhancements

This project extends the existing Todo Mobile App by implementing new features and improving functionality using Clean Architecture principles and Test-Driven Development (TDD) practices. The app allows users to manage tasks, set due dates, mark tasks as completed, and provides better error handling. The codebase has been organized into distinct layers to improve maintainability and code quality.

## Features Implemented

### 1. Set Due Date Feature

Users can now set due dates for tasks when creating or editing them. The due dates are displayed in both the task list and task details screens.

![image](https://github.com/dawit-melka/2023-project-phase-mobile-tasks/assets/105089130/6529ec70-cd7a-47ae-9606-659cb63d4c8d)


### 2. Mark Task as Completed Feature

A new button has been added to allow users to mark tasks as completed. Completed tasks are visually differentiated from active tasks in the task list.

![image](https://github.com/dawit-melka/2023-project-phase-mobile-tasks/assets/105089130/1847c2f5-1de6-44f5-9eee-64166e8836d4)

### 3. Clean Architecture Organization

The codebase has been restructured into the following distinct layers, adhering to Clean Architecture principles:

- **Presentation Layer:** Contains UI components, screens, and presentation logic.
- **Domain Layer:** Holds the core business logic, including use cases and entities.
- **Data Layer:** Manages data sources and repositories for fetching and storing data.

## Folder Structure (Clean Architecture)

```
lib/
|-- data/
|   |-- datasources/
|   |   |-- remote_data_source.dart
|   |
|   |-- repositories/
|   |   |-- todo_repository_impl.dart
|   |
|
|-- domain/
|   |-- entities/
|   |   |-- todo.dart
|   |
|   |-- repositories/
|   |   |-- todo_repository.dart
|   |
|   |-- usecases/
|   |   |-- add.dart
|   |   |-- delete.dart
|   |   |-- list.dart
|   |   |-- complete.dart
|
|-- presentation/
|   |-- pages/
|   |   |-- get_started.dart
|   |   |-- todo_list.dart
|   |   |-- task_detail.dart
|   |   |-- create_new_task.dart
|
|-- shared/
|   |-- errors/
|   |   |-- failure.dart
|   |-- utils/
|   |   |-- useCase.dart
|
|-- main.dart
|-- ... (other files)
```

## `Todo` Entity

The `Todo` entity represents a task in the app. It contains the following attributes:

- `id`: Unique identifier for the task.
- `title`: Title of the task.
- `description`: Description of the task.
- `dueDate`: Due date for the task.

```dart
class Todo {
  final String id;
  final String title;
  final String description;
  final String dueDate;

  Todo({
    required this.id, 
    required this.title, 
    required this.description, 
    required this.dueDate
  });
}
```

## Error Handling and Either Type

Proper error handling has been implemented for scenarios such as failed API calls or data retrieval errors. The `Either<L, R>` type is used to manage both successful results and failures in the app. A `Failure` class is used to encapsulate error messages.

Example Use Case:
```dart
class AddTodoUseCase implements UseCase<Todo, Params<Todo>> {
  final TodoRepository repository;

  AddTodoUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, Todo>> call(Params params) async {
    return await repository.add(params.data);
  }
}
```
