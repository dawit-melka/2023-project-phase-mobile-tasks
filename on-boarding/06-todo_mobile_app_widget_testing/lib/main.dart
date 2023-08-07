import 'package:flutter/material.dart';
import 'package:todo_mobile_app/screens/get_started.dart';
import 'package:todo_mobile_app/screens/task_detail.dart';
import 'package:todo_mobile_app/screens/todo_list.dart';
import 'package:todo_mobile_app/screens/create_new_task.dart';

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

