import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:todo_mobile_app_clean_architecture/features/todo/domain/entities/task.dart';
import 'package:todo_mobile_app_clean_architecture/features/todo/presentation/pages/create_new_task.dart';
import 'package:todo_mobile_app_clean_architecture/features/todo/presentation/pages/get_started.dart';



class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
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
                    builder: (context) => const GetStartedPage(),
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
            "Todo List", 
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
              'assets/images/stickman-todo.svg',
              height: 220,
            ),
          ),

          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                "Task list",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  ),
                ),
              )
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left:15.0, right: 15.0, top: 15),
              child: SizedBox(
                height: 80,
                
                child: Stack(
                  children: [
                    GestureDetector(
            
                      onTap: () {
                        Navigator.pushNamed(
                          context, '/task-detail', 
                          // arguments: Task(
                          //   'UI/UX App Design', 
                          //   'April 29, 2023 12:30 AM', 
                          //   "First I have to animate the logo and later prototyping my design. It's very important "));
                    );},
                      child: Container(
                        height: 75,
                        // padding: const EdgeInsets.symmetric(vertical: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(255, 214, 214, 214),
                              offset: Offset(0.0, 0.0),
                              blurRadius: 5.0,
                              spreadRadius: 0.0,
                            )
                          ]
                        ),
                        
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    
                          children: [
                            const Text(
                              "U",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w400,
                                ),
                              ),
                            const SizedBox(
                              width: 120,
                              child: Text(
                                'UI/UX App Design',
                                
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                ),
                            ),
                            Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text('April 29, 2023')
                                    ),
                                ),
                                ElevatedButton(onPressed: (){}, 
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.greenAccent,
                                    minimumSize: const Size(60, 15),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                child: const Text('completed',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)),
                                )
                              ],
                            ),
                          ],
                        ),
                        
                      ),
                    ),
                    Positioned(
                      right: 25,
                      bottom:20,
                      child: Container(
                      width: 5,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.redAccent,
                        )
                      )
                    )
                  ],
                ),
          
              )
                  ),
          ),
          

        Padding(
            padding: const EdgeInsets.only(left:15.0, right: 15.0, top: 10),
            child: SizedBox(
              height: 80,
              
              child: Stack(
                children: [
                  Container(
                    height: 75,
                    // padding: const EdgeInsets.symmetric(vertical: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 214, 214, 214),
                          offset: Offset(0.0, 0.0),
                          blurRadius: 5.0,
                          spreadRadius: 0.0,
                        )
                      ]
                    ),
                    
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                
                      children: [
                        const Text(
                          "U",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                            ),
                          ),
                        const SizedBox(
                          width: 120,
                          child: Text(
                            'UI/UX App Design',
                            
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                        ),
                        Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text('April 29, 2023')
                                    ),
                                ),
                                ElevatedButton(onPressed: (){}, 
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    minimumSize: const Size(60, 15),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                child: const Text('pending',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                )
                              ],
                            ),
                      ],
                    ),
                    
                  ),
                  Positioned(
                    right: 25,
                    bottom:20,
                    child: Container(
                    width: 5,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      
                    )))
                ],
              ),

            )
        ),



        Padding(
            padding: const EdgeInsets.only(left:15.0, right: 15.0, top: 10),
            child: SizedBox(
              height: 80,
              
              child: Stack(
                children: [
                  Container(
                    height: 75,
                    // padding: const EdgeInsets.symmetric(vertical: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 214, 214, 214),
                          offset: Offset(0.0, 0.0),
                          blurRadius: 5.0,
                          spreadRadius: 0.0,
                        )
                      ]
                    ),
                    
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                
                      children: [
                        const Text(
                          "V",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                            ),
                          ),
                        const SizedBox(
                          width: 120,
                          child: Text(
                            'view candidates',
                            
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                        ),
                        Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text('April 29, 2023')
                                    ),
                                ),
                                ElevatedButton(onPressed: (){}, 
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    minimumSize: const Size(60, 15),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                child: const Text('pending',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                )
                              ],
                            ),
                      ],
                    ),
                    
                  ),
                  Positioned(
                    right: 25,
                    bottom:20,
                    child: Container(
                    width: 5,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.yellow,
                      
                    )))
                ],
              ),

            )
        ),




        Padding(
            padding: const EdgeInsets.only(left:15.0, right: 15.0, top: 10),
            child: SizedBox(
              height: 80,
              
              child: Stack(
                children: [
                  Container(
                    height: 75,
                    // padding: const EdgeInsets.symmetric(vertical: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 214, 214, 214),
                          offset: Offset(0.0, 0.0),
                          blurRadius: 5.0,
                          spreadRadius: 0.0,
                        )
                      ]
                    ),
                    
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                
                      children: [
                        const Text(
                          "F",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                            ),
                          ),
                        const SizedBox(
                          width: 120,
                          child: Text(
                            'Football Cu Drybling',
                            
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                        ),
                        Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text('April 29, 2023')
                                    ),
                                ),
                                ElevatedButton(onPressed: (){}, 
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.greenAccent,
                                    minimumSize: const Size(60, 15),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                child: const Text('completed',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)),
                                )
                              ],
                            ),
                      ],
                    ),
                    
                  ),
                  Positioned(
                    right: 25,
                    bottom:20,
                    child: Container(
                    width: 5,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.redAccent,
                      
                    )))
                ],
              ),

            )
        ),


        const SizedBox(height: 23),
        Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
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
                        return const CreateNewTask(); 
                      },
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(241, 114, 88, 1),
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
      ],
      ),
    );
  }
}
