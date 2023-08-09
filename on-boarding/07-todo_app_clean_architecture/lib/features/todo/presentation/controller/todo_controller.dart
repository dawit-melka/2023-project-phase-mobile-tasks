import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final dueDateController = TextEditingController();
  final descriptionController = TextEditingController();

  Future<void> addTodo() async {
    print("Title is ${titleController.text.trim()} and description: ${descriptionController.text.trim()}");
  }
}