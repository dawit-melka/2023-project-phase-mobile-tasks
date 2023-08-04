import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:todo_list/task_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      theme: ThemeData(
        
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        // useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Todo List Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new, 
            color:Color.fromRGBO(241, 114, 88, 1),
            size: 40,),
          onPressed: () {},
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
              'assets/stickman-todo.svg',
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
          Padding(
            padding: const EdgeInsets.only(left:15.0, right: 15.0, top: 5),
            child: SizedBox(
              height: 80,
              
              child: Stack(
                children: [
                  Card(
                    
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                
                      children: [
                        Text(
                          "U",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                            ),
                          ),
                        SizedBox(
                          width: 120,
                          child: Text(
                            'UI/UX App Design',
                            
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text('April 29, 2023')
                            ),
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
          


          Padding(
            padding: const EdgeInsets.only(left:15.0, right: 15.0, top: 5),
            child: SizedBox(
              height: 80,
              
              child: Stack(
                children: [
                  Card(
                    
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                
                      children: [
                        Text(
                          "U",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                            ),
                          ),
                        SizedBox(
                          width: 120,
                          child: Text(
                            'UI/UX App Design',
                            
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text('April 29, 2023')
                            ),
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
            padding: const EdgeInsets.only(left:15.0, right: 15.0, top: 5),
            child: SizedBox(
              height: 80,
              
              child: Stack(
                children: [
                  Card(
                    
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                
                      children: [
                        Text(
                          "V",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                            ),
                          ),
                        SizedBox(
                          width: 120,
                          child: Text(
                            'View candidates',
                            
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text('April 29, 2023')
                            ),
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
            padding: const EdgeInsets.only(left:15.0, right: 15.0, top: 5),
            child: SizedBox(
              height: 80,
              
              child: Stack(
                children: [
                  Card(
                    
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                
                      children: [
                        Text(
                          "F",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                            ),
                          ),
                        SizedBox(
                          width: 120,
                          child: Text(
                            'Football Cu Drybling',
                            
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text('April 29, 2023')
                            ),
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
                    MaterialPageRoute(
                      builder: (context) => const TaskDetail(),
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
      ],
      ),

    
      
    );
  }
}
