// import 'package:add_task_app/get_started.dart';
import 'package:todo_mobile_app/screens/todo_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(241, 114, 88, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              'assets/images/stickman.svg',
              height: 350,
            ),
            const SizedBox(height: 180),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/todo-list');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 27, 149, 249),
                  minimumSize: const Size(270, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                child: const Text('Get Started',
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}