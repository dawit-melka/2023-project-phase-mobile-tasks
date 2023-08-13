import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final deadlineController = TextEditingController();
  final descriptionController = TextEditingController();
  final RxBool statusController = false.obs;

  Future<void> createTask() async {
    print("Title is ${titleController.text.trim()} and description: ${descriptionController.text.trim()}");
  }


}