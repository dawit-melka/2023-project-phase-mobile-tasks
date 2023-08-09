import 'package:flutter/material.dart';

import 'features/todo/presentation/pages/create_new_task.dart';
import 'features/todo/presentation/pages/get_started.dart';
import 'features/todo/presentation/pages/task_detail.dart';
import 'features/todo/presentation/pages/todo_list.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Todo Mobile App",
    initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const GetStartedPage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/todo-list': (context) => const TodoList(),
        '/create-new-task': (context) => const CreateNewTask(),
        '/task-detail': (context) => const TaskDetail(),
      },
    )
  );
}

