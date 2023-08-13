// import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../data/models/task_model.dart';
import '../pages/task_detail_page.dart';


class TaskListCards extends StatelessWidget {
  const TaskListCards({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(tasks.length, (index) {
        return Slidable(
          endActionPane: ActionPane(
            motion: BehindMotion(),
            extentRatio: 0.25,
            
            children: [
              SlidableAction(
                autoClose: true,
                flex: 2,
                onPressed: (BuildContext context){},
                backgroundColor: Color.fromRGBO(229, 115, 115, 1),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
                borderRadius: BorderRadius.circular(10),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: InkWell(
              borderRadius: BorderRadius.circular(25),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const TaskDetailPage();
                }));
              },
              child: Container(
                // color: Colors.blue,
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.black26,
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      tasks[index].title[0],
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      width: 130,
                      child: Text(
                        tasks[index].title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(tasks[index].deadline),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: tasks[index].status
                                ? Colors.greenAccent
                                : Colors.red,
                            minimumSize: const Size(30, 25),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: Text(
                              tasks[index].status ? 'completed' : 'pending',
                              style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 5,
                      height: 50,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: index % 3 == 0
                              ? Colors.green
                              : index % 3 == 1
                                  ? Colors.yellow
                                  : Colors.red,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
