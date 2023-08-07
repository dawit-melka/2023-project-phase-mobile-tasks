import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_mobile_app/models/models.dart';
import 'package:todo_mobile_app/screens/todo_list.dart';


class TaskDetail extends StatelessWidget {
  const TaskDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final Task task = ModalRoute.of(context)!.settings.arguments as Task;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,
        leading: IconButton(
          icon: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Icon(Icons.arrow_back_ios_new, 
            color:Color.fromRGBO(241, 114, 88, 1),
            size: 40,)
            
            ),
          onPressed: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TodoList(),
                    ),
                  );
          },
          ),
          actions: [
          IconButton(
            color: Color.fromARGB(173, 0, 0, 0),
            padding: EdgeInsets.only(right: 40),
            icon: const Icon(Icons.more_vert, size: 45,),
            onPressed: () {
              // Handle the action button press here
            },
          ),
        ],
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: const Center(
          child: Text(
            "Task Detail", 
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              ),
              ),
              ),
      ),

      body: Column(
        children: [
          Center(child: 
          SvgPicture.asset(
              'assets/images/undraw_todo.svg',
              height: 220,
            ),
          ),

          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 18, left: 35),
              child: Text(
                "Title",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  ),
                ),
              )
          ),

          Padding(
            padding: const EdgeInsets.only(left:35, right: 35, top: 10),
            child: SizedBox(
              height: 55,
              
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 241, 238, 238),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left:10),
                    child: Text(
                      task.title,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    )
                ),
              )
            ),
          ),



          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 16, left: 35),
              child: Text(
                "Description",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  ),
                ),
              )
          ),

          Padding(
            padding: const EdgeInsets.only(left:35, right: 35, top: 10),
            child: SizedBox(
              height: 150,
              
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 241, 238, 238),
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top:15, left:10),
                    child: Text(
                      task.description,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    )
                ),
              )
            ),
          ),



                    const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 16, left: 35),
              child: Text(
                "Deadline",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  ),
                ),
              )
          ),

          Padding(
            padding: const EdgeInsets.only(left:35, right: 35, top: 10),
            child: SizedBox(
              height: 55,
              
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 241, 238, 238),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left:10),
                    child: Text(
                      task.dueDate,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    )
                ),
              )
            ),
          ),            
                        
      ],
      ),  
    );
  }
}