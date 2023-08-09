# [Day 8 - Task 1] Task Document: Data Overview Layer

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
