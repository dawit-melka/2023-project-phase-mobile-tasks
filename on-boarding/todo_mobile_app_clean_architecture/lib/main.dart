import 'package:flutter/material.dart';
import 'package:todo_mobile_app_clean_architecture/features/todo/presentation/pages/get_started.dart';
import 'package:todo_mobile_app_clean_architecture/features/todo/presentation/pages/task_detail_page.dart';

import 'features/todo/presentation/pages/create_new_task_page.dart';
import 'features/todo/presentation/pages/todo_list_page.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Todo Mobile App",
    theme: ThemeData(
      colorSchemeSeed: const Color.fromRGBO(241, 114, 88, 1),
    ),
    initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const GetStartedPage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/todo-list': (context) => const TodoListPage(),
        '/create-new-task': (context) => const CreateTaskPage(),
        '/task-detail': (context) => const TaskDetailPage(),
      },
    )
  );
}

