import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_mobile_app/screens/create_new_task.dart';
import 'package:todo_mobile_app/models/models.dart';
import 'package:todo_mobile_app/screens/get_started.dart';

void main() {
  // Test scenarios here

  // 1 Test Task Creation
  testWidgets('Create new task', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const CreateNewTask());

    // Enter task details into text fields
    await tester.enterText(find.byType(TextField).first, 'Test Task');
    await tester.enterText(
        find.byType(TextField).at(1), 'August 10, 2023 10:00 AM');
    await tester.enterText(find.byType(TextField).last, 'Test description');

    // Tap the "Add task" button
    await tester.tap(find.text('Add task'));
    await tester.pump();

    // Verify that the task has been added to the list
    expect(find.text('Test Task'), findsOneWidget);
  });


  // 2 Test Task Listing
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


  // Test Onboarding Page Navigation
  testWidgets(
    'Navigate to main page from onboarding',
    (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const GetStartedPage());

      // Tap the "Get Started" button
      await tester.tap(find.text('Get Started'));
      await tester.pumpAndSettle();

      // Verify that the main page is displayed
      expect(find.text('Todo List'), findsOneWidget);
    },
  );
}

class TodoListMock extends StatelessWidget {
  final List<Task> tasks;

  const TodoListMock({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(tasks[index].title),
            );
          },
        ),
      ),
    );
  }
}
