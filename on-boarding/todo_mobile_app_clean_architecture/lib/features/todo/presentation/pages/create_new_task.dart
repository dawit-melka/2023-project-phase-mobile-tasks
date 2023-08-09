import 'package:flutter/material.dart';
import 'package:todo_mobile_app_clean_architecture/features/todo/presentation/pages/todo_list.dart';



class CreateNewTask extends StatefulWidget {
  const CreateNewTask({super.key});

  @override
  State<CreateNewTask> createState() => _CreateNewTaskState();
}

class _CreateNewTaskState extends State<CreateNewTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new, 
            color:Color.fromRGBO(241, 114, 88, 1),
            size: 40,),
          onPressed: () {
                // navigate to GetStartedRoute
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
            color: const Color.fromARGB(173, 0, 0, 0),
            padding: const EdgeInsets.only(right: 40),
            icon: const Icon(Icons.more_vert, size: 45,),
            onPressed: () {
              // Handle the action button press here
            },
          ),
        ],
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: const Center(
          child: Text(
            "", 
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              ),
              ),
              ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Center(
              child: Text(
                "Create new task",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Divider(
              color: Color.fromARGB(31, 123, 120, 120),
              thickness: 2,),
          
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left:40, top: 20),
            child: const Text(
              "Main task name",
              style: TextStyle(
                fontSize: 16,
                color: Color.fromRGBO(241, 114, 88, 1),
                fontWeight: FontWeight.bold,
              )
              ),
          ),
      
          Container(
            margin: const EdgeInsets.only(left:20, right: 20),
            child: const Card(
              color: Colors.white,
              elevation: 1,
              
              child: SizedBox(
                height: 60,
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: TextField(
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900),
                    decoration: InputDecoration(
                      hintText: "Enter task name",
                      fillColor: Color.fromRGBO(255, 255, 255, 1),
                      border: InputBorder.none,
                    ),
                  ),
                
                ),
              ),
            ),
          ),
      
      
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left:40, top: 20),
            child: const Text(
              "Due date",
              style: TextStyle(
                fontSize: 16,
                color: Color.fromRGBO(241, 114, 88, 1),
                fontWeight: FontWeight.bold,
              )
              ),
          ),
      
      
          Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              color: Colors.white,
            child: const Card(
              elevation: 0.4,
              child: SizedBox(
                height: 60,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            TextField(
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                      decoration: InputDecoration(
                        hintText: "Enter due date and time",
                        fillColor: Color.fromRGBO(255, 255, 255, 1),
                        border: InputBorder.none,
                      ),
                    ),
                          ],
                        ),
                      ),
                      // Add the date selector icon here
                      Icon(
                        Icons.date_range,
                        size: 24,
                        color: Color.fromRGBO(238, 111, 87, 1),
                      ),
                    ],
                  ),
                ),
              ),
      
            )
              // surfaceTintColor: Colors.white,
              // elevation: 4,
              // shadowColor: Color.fromRGBO(149, 157, 165, 0.2),
            ),
      
          
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left:40, top: 20),
            child: const Text(
              "Description",
              style: TextStyle(
                fontSize: 16,
                color: Color.fromRGBO(241, 114, 88, 1),
                fontWeight: FontWeight.bold,
              )
              ),
          ),
      
      
          Container(
            margin: const EdgeInsets.only(left:20, right: 20),
            child: const Card(
              color: Colors.white,
              elevation: 1,
              
              child: SizedBox(
                height: 85,
                child: Padding(
                  padding: EdgeInsets.all(14.0),
                  
                  child: TextField(
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800),
                      
                    decoration: InputDecoration(
                      
                      hintText: "Enter description",
                      contentPadding: EdgeInsets.all(8.0),
                      fillColor: Color.fromRGBO(255, 255, 255, 1),
                      border: InputBorder.none,
                    ),
                  ),
                
                ),
              ),
            ),
          ),
      
          SizedBox(height: 50,),
      
          Container(
              margin: const EdgeInsets.only(left: 25, right: 25),
              child: ElevatedButton(
                onPressed: () {
                  // navigate to GetStartedRoute
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TodoList(),
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
      )
    );
  }
}