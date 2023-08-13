import '../../domain/entities/task.dart';

class TaskModel extends Task {
  TaskModel({
    required String id,
    required String title,
    required String description,
    required String deadline,
    bool status = false,
  }) : super(
          id: id,
          title: title,
          description: description,
          deadline: deadline,
          status: status,
        );

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      deadline: json['deadline'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'deadline': deadline,
      'status': status,
    };
  }
}

List<TaskModel> tasks = [
  TaskModel(id:"1", title: "UI/UX App Design", deadline: "April 29, 2023", description: "Complete the UI/UX Design tonight"),
  TaskModel(id:"2", title: "UI/UX App Design", deadline: "April 29, 2023", description: "Complete the UI/UX Design tonight", status: true),
  TaskModel(id:"3", title: "View Candidates", deadline: "April 29, 2023", description: "Complete the UI/UX Design tonight", status: true),
  TaskModel(id:"4", title: "Football Cup Drybiling", deadline: "April 29, 2023", description: "Complete the UI/UX Design tonight"),
  TaskModel(id:"5", title: "Gym workout", deadline: "April 29, 2023", description: "Complete the UI/UX Design tonight", status: true)
];
