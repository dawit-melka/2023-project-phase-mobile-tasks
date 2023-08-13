import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../pages/task_detail_page.dart';
import 'custom_form_field.dart';
// import '../pages/todo_list_page.dart';

class CreateNewTaskForm extends StatelessWidget {
  const CreateNewTaskForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    "Create new task",
                    style: TextStyle(
                      fontFamily:'Roboto',
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(
                  color: Color.fromARGB(31, 123, 120, 120),
                  thickness: 2,
                ),
                const SizedBox(height: 20),
                const Text("Main task name",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(241, 114, 88, 1),
                      fontWeight: FontWeight.bold,
                    ),),
                CustomFormField(
                  height: 60,
                  child: TextFormField(
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                    decoration: const InputDecoration(
                      hintText: "Enter task title",
                      hintStyle: TextStyle(),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text("Due date",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(241, 114, 88, 1),
                      fontWeight: FontWeight.bold,
                    ),),
                CustomFormField(
                  height: 60,
                  child: DateTimeFormField(
                    // dateFormat: ,
                    dateFormat: DateFormat("MMMM d, y hh:mm a"),
                    dateTextStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),

                    decoration: const InputDecoration(
                      hintText: "Select deadline",
                      hintStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      border: InputBorder.none,
                      suffixIcon: Icon(
                        Icons.calendar_month_rounded,
                        color: Color.fromRGBO(241, 114, 88, 1),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Description",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(241, 114, 88, 1),
                      fontWeight: FontWeight.bold,
                    )),
                CustomFormField(
                  height: 80,
                  child: TextFormField(
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: null,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      hintText: "Enter task description",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // navigate to GetStartedRoute
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
                          return const TaskDetailPage(); 
                        },
                      ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffEE6F57),
                      minimumSize: const Size(170, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text('Add task',
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}