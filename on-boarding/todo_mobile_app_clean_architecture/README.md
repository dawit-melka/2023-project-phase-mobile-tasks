<<<<<<< HEAD

# [Day 8 - Task 2] Todo App with Data Source Contracts

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


# [Day 8 - Task 1] Task Document: Data Overview Layer
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


# [Day 7 - Task 2] To-Do App: Domain Layer Refactoring
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
=======
# [Day 9 - Task 1] Todo App with Repository implementation

In this task, the Todo app was further extended to include the repository implementation. The repository acts as an intermediary between the domain layer and the data sources, providing the necessary logic to fulfill the contract-defined methods.

## Repository Implementation

The repository implementation is encapsulated in the `TaskRepositoryImpl` class. This class handles all the operations related to tasks, such as task completion, creation, deletion, and more. The repository is designed to interact with the remote database data source.

Here are snippets from the `task_repository_impl.dart` file that demonstrate the repository implementation:

```dart
class TaskRepositoryImpl implements TaskRepository {
  final TaskRemoteDatabase remoteDatabase;

  TaskRepositoryImpl({
    required this.remoteDatabase,
  });

  @override
  Future<Either<Failure, Task>> completeTask(Task task) async {
    try {
      final result = await remoteDatabase.completeTask(task);
      return Right(result);
    } catch (e) {
      return Left(Failure("Oops, we couldn't update this task status"));
    }
  }

  // ... other methods ...

  @override
  Future<Either<Failure, List<Task>>> getAllTasks() async {
    try {
      final result = await remoteDatabase.getAllTasks();
      return Right(result);
    } catch (e) {
      return Left(Failure("Oops, we couldn't fetch tasks from the database"));
    }
  }
  
}
```

### Data Source Interaction

The repository implementation uses the `remoteDatabase` instance to interact with the data source. This instance is injected into the repository during initialization and is responsible for handling data operations with the remote database.


# [Day 8 - Task 2] Todo App with Data Source Contracts
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

# [Day 8 - Task 1] Task Document: Data Overview Layer
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


# [Day 7 - Task 2] To-Do App: Domain Layer Refactoring
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
>>>>>>> 6623ce362c815603bc94630c3d4f65469bab52d4
