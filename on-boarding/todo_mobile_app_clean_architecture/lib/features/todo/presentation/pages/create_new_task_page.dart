import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../widgets/create_new _task_form.dart';

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage({super.key});

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: IconButton(
            onPressed: () {Navigator.pop(context);},
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xFFF17258),
              size: 40,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Ionicons.ellipsis_vertical,
              color: Colors.black,
              size: 45,
            ),
          ),
        ],
      ),
      body: const CreateNewTaskForm(),
    );
  }
}
