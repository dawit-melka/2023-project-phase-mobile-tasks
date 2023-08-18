# Todo Mobile App 
## Screen Shots

<img width="200" height="450" src="https://github.com/dawit-melka/2023-project-phase-mobile-tasks/assets/105089130/6318d7fb-4d5f-4909-a4a6-449b0c154370">

<img width="200" height="450" src="https://github.com/dawit-melka/2023-project-phase-mobile-tasks/assets/105089130/c5b61354-c48a-4ce1-9714-09dc6a59cdaf">

<img width="200" height="450" src="https://github.com/dawit-melka/2023-project-phase-mobile-tasks/assets/105089130/c2ddc79c-4343-4163-ac40-ca21e07015bd">

<img width="200" height="450" src="https://github.com/dawit-melka/2023-project-phase-mobile-tasks/assets/105089130/807f241f-cfd1-4f45-b1a6-6c1255aabfd4">

<img width="200" height="450" src="https://github.com/dawit-melka/2023-project-phase-mobile-tasks/assets/105089130/73d9e1a1-846f-4022-b8f4-540eb1c3ec5a">



## [Day 13 - Task 1] Todo App Dependency Injection

This README provides an overview of the dependency injection setup for the Todo app. Dependency injection is a design pattern used to manage and provide dependencies to different parts of the application. The `get_it` library is used to handle dependency injection in the app.

## Setup

The dependency injection is configured using the `injection_container.dart` file. This file contains the setup for all the dependencies used in the app, including BLoCs, use cases, network-related components, and more.

### Features - Todo App

#### Bloc

The Todo BLoC is registered using the `sl.registerFactory` method. This registration allows the BLoC to be instantiated and managed by the dependency injection container.

```dart
sl.registerFactory(() => TodoBloc());
```

#### Use Cases

Various use cases for the Todo app, such as creating, updating, deleting, and viewing tasks, are registered as singletons. These use cases are essential for implementing the business logic of the app.

```dart
sl.registerSingleton(() => CreateTaskUseCase(sl()));
sl.registerSingleton(() => UpdateTaskUseCase(sl()));
sl.registerSingleton(() => DeleteTaskUseCase(sl()));
sl.registerSingleton(() => ViewTaskUseCase(sl()));
sl.registerSingleton(() => ViewAllTasksUseCase(sl()));
```

### Core

#### Network Info

The `NetworkInfo` class, responsible for checking network connectivity, is registered as a lazy singleton using the `sl.registerLazySingleton` method.

```dart
sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
```

### External

External dependencies such as the HTTP client and `InternetConnectionChecker` are registered as lazy singletons as well.

```dart
sl.registerLazySingleton(() => http.Client());
sl.registerLazySingleton(() => InternetConnectionChecker());
```

## Initialization

In the `main.dart` file, the `init` function from the `injection_container.dart` file is called to initialize the dependency injection container before the app is run.

```dart
void main() async {
  await di.init();
  runApp(MyApp());
}
```

## [Day 12 - Task 1] Todo App BLoC State Management

<details>
<summary>Click To Expand</summary>
This README provides an overview of the BLoC state management implementation for the Todo app. The BLoC pattern is used to manage the UI state, handle business logic, and process user interactions.

## Event Classes

Event classes represent different user actions that trigger changes in the app's state. These events guide the logic of the BLoC. The following event classes have been defined:

- **TaskInitialEvent**: Represents the initial event.
- **CreateTaskEvent**: Dispatched when the user wants to create a new task.
- **UpdateTaskEvent**: Dispatched when the user wants to update a task's details.
- **DeleteTaskEvent**: Dispatched when the user wants to delete a task.
- **GetSingleTaskEvent**: Dispatched when the user wants to retrieve a single task using its ID.
- **LoadAllTasksEvent**: Dispatched when the user wants to load all tasks from the repository.

```dart
// todo_event.dart

// Define event classes for different user actions
part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

class TaskInitialEvent extends TodoEvent {}

class CreateTaskEvent extends TodoEvent {
  final Task task;

  CreateTaskEvent({required this.task});
}

// ... Other event classes

```

## State Classes

State classes represent the various UI states that the app can be in. These states dictate how the UI should behave based on user interactions and data updates. The following state classes have been defined:

- **TodoInitial**: Represents the initial state before any data is loaded.
- **LoadingState**: Indicates that the app is currently fetching data.
- **LoadedAllTasksState**: Represents the state where all tasks are successfully loaded from the repository.
- **LoadedSingleTaskState**: Represents the state where a single task is successfully retrieved.
- **ErrorState**: Indicates that an error has occurred during data retrieval or processing.

```dart
// todo_state.dart

// Define state classes representing UI states
part of 'todo_bloc.dart';

@immutable
sealed class TodoState {}

class TodoInitial extends TodoState {}

class LoadingState extends TodoState {}

class LoadedAllTasksState extends TodoState {
  final List<Task> tasks;

  LoadedAllTasksState({required this.tasks});
}

class LoadedSingleTaskState extends TodoState {
  final Task task;
  final List<Task> tasks;

  LoadedSingleTaskState({required this.task, required this.tasks});
}

class ErrorState extends TodoState {}

```

## TodoBloc

The `TodoBloc` class is the core component responsible for handling the business logic, processing events, and emitting states. It is set up to handle various events such as creating, updating, deleting tasks, loading tasks, and more.

The BLoC's primary responsibilities include:

- Mapping events to corresponding state changes using the `mapEventToState` method.
- Implementing logic for each event, interacting with the provided use cases and transforming states accordingly.
- Utilizing Streams to emit the appropriate states based on the logic and events processed.
- Ensuring proper error handling for events that could result in failures, and emitting the `ErrorState` when necessary.

The BLoC is properly integrated into the app's components to manage the UI state effectively.

```dart
// todo_bloc.dart

// Implement the TodoBloc class
class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    on<TaskInitialEvent>(taskInitialEvent);
    on<CreateTaskEvent>(createTaskEvent);
    on<UpdateTaskEvent>(updateTaskEvent);
    on<DeleteTaskEvent>(deleteTaskEvent);
    on<GetSingleTaskEvent>(getSingleTaskEvent);
    on<LoadAllTasksEvent>(loadAllTasksEvent);
  }

  // ... Event handlers

  FutureOr<void> createTaskEvent(
      CreateTaskEvent event, Emitter<TodoState> emit) {
    try {
      // Perform the task creation logic using the CreateTaskUseCase
      // Check the result and emit appropriate states
      final state = this.state;
      if (state is LoadedAllTasksState) {
        emit(LoadedAllTasksState(tasks: List.from(state.tasks)..add(event.task)));
      }
    } catch(e) {
      // Handle unexpected exceptions and emit an error state
      emit(ErrorState());
    }
  }

  // ... Other event handlers
}

```
</details>


## [Day 10 - Task 2] Implement Code Organization and Reusability in the Todo List App

<details>
<summary>Click To Expand</summary>
## Overview

In this task, the objective was to enhance the code organization and reusability of the Todo List app by focusing on the presentation layer. The primary focus was on reorganizing the UI components, implementing reusability through widgets, and ensuring a well-structured and maintainable codebase.



### Naming Conventions and Folder Structure

Adhere to consistent naming conventions for variables, functions, classes, and files. Organize your project's folder structure in a clean architecture manner.
```
lib/
|-- core/
|   |-- errors/
|   |   |- failure.dart
|   |-- network/
|   |   |-- network_info.dart
|   |-- utils/
|   |   |-- usecase.dart
|   |   |
|-- features/
|   |-- todo/
|   |   |-- data/
|   |   |   |-- datasources/
|   |   |   |   |-- task_remote_database.dart
|   |   |   |
|   |   |   |-- repositories/
|   |   |   |   |-- todo_repository_impl.dart
|   |   |   |
|   |   |   |-- models/
|   |   |   |   |-- task_model.dart
|   |   |
|   |   |-- domain/
|   |   |   |-- entities/
|   |   |   |   |-- task.dart
|   |   |   |
|   |   |   |-- repositories/
|   |   |   |   |-- task_repository.dart
|   |   |   |
|   |   |   |-- usecases/
|   |   |   |   |-- create_task.dart
|   |   |   |   |-- delete_task.dart
|   |   |   |   |-- update_task.dart
|   |   |   |   |-- view_all_tasks.dart
|   |   |   |   |-- view_task.dart
|   |   |
|   |   |-- presentation/
|   |   |   |-- controller/
|   |   |   |   |-- task_controller.dart
|   |   |   |-- pages/
|   |   |   |   |-- get_started.dart
|   |   |   |   |-- todo_list_page.dart
|   |   |   |   |-- task_detail_page.dart
|   |   |   |   |-- create_new_task_page.dart
|   |   |   |-- widgets/
|   |   |   |   |-- create_new_task_form.dart
|   |   |   |   |-- custom_form_field.dart
|   |   |   |   |-- task_list_card.dart
|   |   |
|   |
|-- main.dart
|-- ... (other files)

```
### Code Organization and Refactoring

To improve code organization and maintainability, the following steps were taken:

1. **Identifying Code Duplication:** Identified areas of code duplication within the presentation layer of the app. This included redundant UI elements, similar layouts, and repetitive code blocks.

2. **Reorganizing Widgets:** Introduced a modular structure by creating separate widget classes for reusable UI components. This modular approach ensured that similar UI elements were encapsulated within individual widgets.

3. **Folder Structure Enhancement:** Arranged the widgets into appropriate folders, such as `pages/`, `widgets/`, and `controller/`, to maintain a clear separation of concerns. This structure allowed for easier navigation and code maintenance.

### Reusability through Widgets

The reusability of the presentation layer was achieved through the creation of reusable widgets:

1. **Reusable UI Components:** Designed widgets that encapsulate specific UI components like buttons, input fields, list items, and more. These widgets were designed to be flexible and adaptable, allowing them to be reused across different parts of the app.

2. **Widget Customization:** Implemented widget customization through parameters and properties. This approach enabled the same widget to be customized and utilized in various contexts without rewriting code.

3. **Composition of Widgets:** Composed larger UI sections by combining multiple reusable widgets. This composability approach enhanced code readability and reduced the need for repetitive coding.

### Integration and Functionality

While reorganizing and refactoring the presentation layer, it was ensured that the app's existing features remained fully functional:

**Seamless Integration:** The new widget-based approach seamlessly integrated with the existing app structure. The reorganized codebase enhanced the app's performance and maintainability.

</details>

## [Day 9 - Task 2] Network Info Tak

<details>
<summary>Click To Expand</summary>
## Overview

This repository contains the implementation of a NetworkInfo class and its integration into the TODO mobile app. The app is designed to manage tasks, including adding, updating, and deleting items from the TODO list. The NetworkInfo class enhances the app's functionality by determining the presence or absence of a network connection, providing a more robust task management experience.

## Features and Enhancements

### NetworkInfo Class

The `NetworkInfo` class has been implemented to determine the network connectivity status. It abstracts the process of checking for an active network connection and provides a unified way to access this information throughout the app.

```dart
abstract class NetworkInfo {
  Future<bool> get isConnected;
}
```

### NetworkInfoImpl Class

The `NetworkInfoImpl` class implements the `NetworkInfo` interface and uses the `InternetConnectionChecker` package to check for network connectivity. This class is responsible for determining whether the device is connected to the internet.

```dart
class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
```

### Repository Integration

The `NetworkInfo` instance is injected into the repository to enable network-aware operations. The repository can now utilize the `NetworkInfo` instance to check for network connectivity before proceeding with network-dependent operations.

```dart
class TaskRepositoryImpl implements TaskRepository {
  final NetworkInfo networkInfo;
  final TaskRemoteDatabase remoteDatabase;

  TaskRepositoryImpl({
    required this.networkInfo,
    required this.remoteDatabase,
  });

  @override
  Future<Either<Failure, Task>> createTask(Task task) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDatabase.createTask(task);
        return Right(result);
      } catch (e) {
        return Left(Failure("Oops, we couldn't add this task"));
      }
    } else {
      return Left(Failure("No internet connection available"));
    }
  }
  
  // Other repository methods follow a similar pattern
}
```
</details>

## [Day 9 - Task 1] Todo App Repository Implementation 
<details>
<summary>Click To Expand</summary>
## Overview
This task involved implementing repository functionality for a Todo app using Flutter. The primary objective was to set up a basic structure for the repository, implement logic based on the repository contracts from the domain layer, and integrate repository dependencies, including local and remote data sources.

## Task Description
The task required the following key steps:

Implement a TaskRepository interface based on the defined contract from the domain layer.
Create the TaskRepositoryImpl class, which implements the TaskRepository interface.
Integrate repository dependencies, including TaskRemoteDatabase for remote data interaction.
Implementation
TaskRepository Interface
The TaskRepository interface was defined as per the contract provided in the domain layer. It included methods such as createTask, updateTask, deleteTask, completeTask, getTask, and getAllTasks.

## TaskRepositoryImpl Implementation
The TaskRepositoryImpl class was created to implement the repository functionality. It accepted an instance of TaskRemoteDatabase as a dependency and utilized it to interact with the remote data source.

For each repository method, appropriate try-catch blocks were implemented to handle potential failures and return appropriate responses using Dartz.Either<Failure, T>. This ensured proper error handling and a clear separation of concerns.

## Code Structure
The codebase was organized following best practices for clean architecture and modularity. The relevant files were organized within the respective folders:

features/todo/data/repositories for repository implementation.
features/todo/data/datasource for remote data source (TaskRemoteDatabase).
core/errors for error handling (Failure class).

### Snippets of Code
```dart
class TaskRepositoryImpl implements TaskRepository {
  final TaskRemoteDatabase remoteDatabase;

  TaskRepositoryImpl({
    required this.remoteDatabase,
  });

  @override
  Future<Dartz.Either<Failure, Task>> createTask(Task task) async {
    try {
      final result = await remoteDatabase.createTask(task);
      return Dartz.Right(result);
    } catch (e) {
      return Dartz.Left(Failure("Oops, we couldn't add this task"));
    }
  }

  // other repository methods...
}
```
</details>

## [Day 8 - Task 2] Todo App with Data Source Contracts

<details>
<summary>Click To Expand</summary>
  
In this task, the Todo app was extended to include data source contracts, repository dependencies, and a basic repository structure. The focus was on implementing a clear separation between data sources and the repository layer, following the principles discussed in the learning material.

## Contract and Repository Implementation

A contract was defined to outline the methods that a repository must fulfill. This contract ensures consistency and a clear API for the repository's interactions with data sources. Below is an example of the contract, as seen in the `task_repository.dart` file:

```dart
abstract class TaskRepository {
  Future<Either<Failure, Task>> createTask(Task task);
  Future<Either<Failure, Task>> editTask(Task task);
  Future<Either<Failure, Task>> deleteTask(Task task);
  Future<Either<Failure, Task>> completeTask(Task task);
  Future<Either<Failure, Task>> getTask(String id);
  Future<Either<Failure, List<Task>>> getAllTasks();
}
```

### Interfaces and Abstract Classes

Interfaces or abstract classes were introduced to represent repository dependencies. These abstractions provide a clear contract for different data sources, such as remote and local sources. By implementing these interfaces, the app ensures that data sources follow a consistent structure.

### Basic Repository Structure

The basic structure of the repository was established following the contract-defined methods. This structure acts as an intermediary between the domain layer and the data sources. The repository handles data retrieval, modification, and other operations while adhering to the contract.
</details>

## [Day 8 - Task 1] Task Document: Data Overview Layer
<details>
<summary>Click To Expand</summary>
## Unit Tests for Task Entity

In this task, unit tests were implemented to ensure the correctness of the `Task` entity. The entity contains attributes such as `id`, `title`, `description`, `deadline`, and `status`. The tests validate the behavior of the `Task` entity constructor and its attributes.

```dart
test('Task entity should be correctly initialized', () {
  final task = Task(
    id: '1',
    title: 'Test Task',
    description: 'This is a test task',
    deadline: '2023-08-10',
    status: false,
  );

  expect(task.id, '1');
  expect(task.title, 'Test Task');
  expect(task.description, 'This is a test task');
  expect(task.deadline, '2023-08-10');
  expect(task.status, false);
});
```

## Unit Tests for ViewAllTasksUseCase

In this task, unit tests were written for the `ViewAllTasksUseCase` class. The use case is responsible for retrieving a list of all tasks. The tests ensure that the use case interacts correctly with the repository and returns the expected result.

```dart
test('ViewAllTasksUseCase should return a list of tasks', () async {
  final mockRepository = MockTodoRepository(); // Create a mock repository
  final useCase = ViewAllTasksUseCase(repository: mockRepository);

  when(mockRepository.getAllTasks())
      .thenAnswer((_) async => Right([Task(id: '1', title: 'Task 1')]));

  final result = await useCase(); // Call the use case

  expect(result, isA<Right>());
  expect(result.getOrElse(() => []), [Task(id: '1', title: 'Task 1')]);
});
```

## Implement Models

In this task, models were implemented in the `features/todo/data/models` directory. The `TaskModel` class mirrors the `Task` entity and includes conversion logic to and from JSON using `fromJson` and `toJson` methods. Unit tests were written to ensure the correctness of the `TaskModel` class.

```dart
class TaskModel {
  final String id;
  final String title;
  final String description;
  final String deadline;
  final bool status;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.deadline,
    this.status = false,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      deadline: json['deadline'],
      status: json['status'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'deadline': deadline,
      'status': status,
    };
  }
}
```
</details>


## [Day 7 - Task 2] To-Do App: Domain Layer Refactoring
<details>
<summary>Click To Expand</summary>
  
In this task, I have successfully completed the domain layer refactoring for the To-Do App. The goal of this task was to implement entities and use cases to enable the functionality of viewing all tasks, viewing a specific task, and creating a new task.

## Updates Made

### Entities

I created an entity class named `Task` that represents a single to-do task. Each task includes the following attributes:
- id: The unique identifier of the task.
- title: The title of the task.
- description: The description of the task.
- dueDate: The deadline for the task.

```dart
class Task {
  final String id;
  final String title;
  final String description;
  final String dueDate;
  final bool status;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    this.status = false,
  });
}
```

### Use Cases

I implemented the following use cases using callable classes:

#### View All Tasks

I created a use case class named `ViewAllTasksUseCase` that interacts with the domain layer to retrieve a list of all tasks. This use case follows the callable class principles and interacts with the repository to fetch tasks.

```dart
class ViewAllTasksUseCase implements UseCase<List<Task>, NoParams> {
  final TaskRepository repository;

  ViewAllTasksUseCase({
    required this.repository,
  });

  @override
  Future<Dartz.Either<Failure, List<Task>>> call(NoParams params) async {
    return await repository.getAllTasks();
  }
}
```

#### View Specific Task

I implemented the `ViewTaskUseCase` use case class to retrieve a specific task using its id. This use case accepts a parameter indicating the id of the task to be retrieved and fetches the task from the repository.

```dart
class ViewTaskUseCase implements UseCase<Task, String> {
  final TaskRepository repository;

  ViewTaskUseCase({
    required this.repository,
  });

  @override
  Future<Dartz.Either<Failure, Task>> call(String id) async {
    return await repository.getTask(id);
  }
}
```

#### Create New Task

I implemented the `CreateTaskUseCase` use case class to add a new task to the list of tasks. This use case accepts a `Task` object as a parameter, representing the new task to be created. It adds the new task to the repository.

```dart
class CreateTaskUseCase implements UseCase<Task, Params<Task>> {
  final TaskRepository repository;

  CreateTaskUseCase({
    required this.repository,
  });

  @override
  Future<Dartz.Either<Failure, Task>> call(Params<Task> params) async {
    return await repository.createTask(params.data);
  }
}
```
</details>
