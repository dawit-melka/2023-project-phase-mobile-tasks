// import 'dart:convert';


class Task {
  final String id;
  final String title;
  final String description;
  final String deadline;
  final bool status;

  Task({
    required this.id, 
    required this.title, 
    required this.description, 
    required this.deadline,
    this.status = false,
    });


  // Map<String, dynamic> toMap() {
  //   final result = <String, dynamic>{};
  
  //   result.addAll({'id': id});
  //   result.addAll({'title': title});
  //   result.addAll({'description': description});
  //   result.addAll({'deadline': deadline});
  //   result.addAll({'status': status});
  
  //   return result;
  // }

  // factory Task.fromMap(Map<String, dynamic> map) {
  //   return Task(
  //     id: map['id'] ?? '',
  //     title: map['title'] ?? '',
  //     description: map['description'] ?? '',
  //     deadline: map['deadline'] ?? '',
  //     status: map['status'] ?? false,
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory Task.fromJson(String source) => Task.fromMap(json.decode(source));
}
