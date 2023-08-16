## [Day 9 - Task 2] Network Info Tak

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
