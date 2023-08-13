import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../widgets/task_list_card.dart';
import 'create_new_task_page.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left:15),
          child: IconButton(
            onPressed: () {Navigator.pop(context);},
            icon: const Icon(Icons.arrow_back_ios,
              color: Color(0xFFF17258),
              size: 40,
            ),
          ),
        ),
        centerTitle: true,
        title: const Text("Todo List",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Ionicons.ellipsis_vertical,
              size: 45,
              color: Colors.black,
            ),
          )
        ],
      ),

      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        children: [
          Image.asset("assets/images/tasks.png",
            height: 200,
          ),
          const Text("Tasks list",
            style: TextStyle(
              fontFamily: "Roboto",
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 20),
          //Task List
          const TaskListCards(),
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(left: 60, right: 60, bottom: 20),
        height: 45,
        child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 500),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          const begin = Offset(1.0, 0.0);
                          const end = Offset.zero;
                          const curve = Curves.easeInOut;
                          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                          var offsetAnimation = animation.drive(tween);
                          return SlideTransition(position: offsetAnimation, child: child);
                        },
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return const CreateTaskPage(); 
                        },
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(241, 114, 88, 1),
                    minimumSize: const Size(250, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text('Create task',
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
      ),
    );
  }
}