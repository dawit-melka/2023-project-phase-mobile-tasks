# To-Do App Widget Testing

This project includes widget tests for the To-Do app user interface to ensure UI components and user interactions work correctly. Widget testing is used to verify app stability during changes or feature additions.

## Getting Started

Follow the steps below to set up and run widget tests for the To-Do app.

### Prerequisites

- Flutter SDK installed
- Emulator or physical device for testing

### Installation

1. Clone the repository to your local machine:

```bash
git clone <repository_url>
```

2. Navigate to the project directory:

```bash
cd <project_directory>
```

3. Install dependencies:

```bash
flutter pub get
```

## Running Widget Tests

Run widget tests to ensure the correctness of the To-Do app UI and functionality.

1. Open a terminal and navigate to the project directory:

```bash
cd <project_directory>
```

2. Run the widget tests:

```bash
flutter test
```

The tests will be executed, and the results will be displayed in the terminal.

## Test Scenarios

The widget tests cover the following scenarios:

### Create New Task

- Test the creation of a new task.
- Verify behavior with different input scenarios (empty task names, valid task names).
```dart
testWidgets('Create new task', (WidgetTester tester) async {
  // Build our app and trigger a frame.
  await tester.pumpWidget(const CreateNewTask());

  // Enter task details into text fields
  await tester.enterText(find.byType(TextField).first, 'Test Task');
  await tester.enterText(find.byType(TextField).at(1), 'August 10, 2023 10:00 AM');
  await tester.enterText(find.byType(TextField).last, 'Test description');

  // Tap the "Add task" button
  await tester.tap(find.text('Add task'));
  await tester.pump();

  // Verify that the task has been added to the list
  expect(find.text('Test Task'), findsOneWidget);
});

```

### List Tasks

- Test the display of the list of tasks in the UI.
- Verify that the list updates correctly when new tasks are added or completed.
```dart
testWidgets('List tasks', (WidgetTester tester) async {
  // Create a list of sample tasks
  final tasks = [
    Task('Task 1', 'August 10, 2023 10:00 AM', 'Description 1'),
    Task('Task 2', 'August 11, 2023 2:00 PM', 'Description 2'),
  ];

  // Build our app and trigger a frame.
  await tester.pumpWidget(TodoListMock(tasks: tasks));

  // Verify that both tasks are displayed
  expect(find.text('Task 1'), findsOneWidget);
  expect(find.text('Task 2'), findsOneWidget);
});
```


### Onboarding Page Navigation

- Test if tapping the onboarding button navigates to the main To-Do list page.
```dart
testWidgets('Navigate to main page from onboarding', (WidgetTester tester) async {
  // Build our app and trigger a frame.
  await tester.pumpWidget(const GetStartedPage());

  // Tap the "Get Started" button
  await tester.tap(find.text('Get Started'));
  await tester.pumpAndSettle();

  // Verify that the main page is displayed
  expect(find.text('Todo List'), findsOneWidget);
});
```

## Test Files

- `test\todo_app_test.dart`: Contains the widget tests for various app functionalities.
- `create_new_task.dart`: Defines the `CreateNewTask` screen.
- `get_started.dart`: Defines the `GetStartedPage` screen.
- `models.dart`: Defines the `Task` class for task data.
