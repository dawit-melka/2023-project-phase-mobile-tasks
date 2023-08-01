import "dart:io";
void main(){
  TaskManager TM = TaskManager([]);
  while(true){
    print("press 1 to add task");
    print("press 2 to view all tasks");
    print("press 3 to view completed tasks");
    print("press 4 to view pending tasks");
    print("press 5 to edit a task");
    print("press 6 to delete a task");
    print("press 7 to complete a task");
    print("press 8 to exit");

    int input = int.parse(stdin.readLineSync() ?? "0");
    if (input == 1){
      print("Enter title");
      String title = stdin.readLineSync() ?? "";
      print("Enter Description");
      String description = stdin.readLineSync() ?? "";
      print('Enter task due date (YYYY-MM-DD):');
      String dueDateStr = stdin.readLineSync() ?? '';
      DateTime dueDate = DateTime.tryParse(dueDateStr) ?? DateTime.now();
      bool status = false;

      Task newTask = Task(title, description, dueDate, status);
      TM.addTask(newTask);
      print("You have successfully added a task!");
    } else if(input == 2) {
      TM.viewTasks();
    } else if(input == 3) {
      TM.completedTasks();
    } else if(input == 4) {
      TM.pendingTasks();
    } else if(input == 5) {
      print("Please enter the title");
      String title = stdin.readLineSync() ?? "";
      Task? task = TM.search(title);
      if(task != null) {
        print("Enter title");
        String title = stdin.readLineSync() ?? "";
        print("Enter Description");
        String description = stdin.readLineSync() ?? "";
        print('Enter task due date (YYYY-MM-DD):');
        String dueDateStr = stdin.readLineSync() ?? '';
        DateTime dueDate = DateTime.tryParse(dueDateStr) ?? DateTime.now();
        bool status = task.Status;

        TM.editTask(task, title, description, dueDate, status);
      }else {
        print("Not found");
      }
    } else if(input == 6) {
      print("Please enter the title");
      String title = stdin.readLineSync() ?? "";
      Task? task = TM.search(title);
      if (task != null) {
        TM.deleteTask(task);
        print("Task removed");
      } else{
        print("Task not found");
      }
    } else if(input == 7) {
      print("Please enter the title");
      String title = stdin.readLineSync() ?? "";
      Task? task = TM.search(title);
      if (task != null) {
        TM.completeTask(task);
        print("Task status updated");
      } else{
        print("Task not found");
      }
    } else if(input == 8) {
      break;
    } else {
      print("Please enter a valid input");
    }
  }
}

class Task {
  String Title, Description;
  DateTime Duedate;
  bool Status;

  Task(this.Title, this.Description, this.Duedate, this.Status);

  void display(){
    print("Title: ${this.Title}");
    print("Description: ${this.Description}");
    print("Duedate: ${this.Duedate}");
    if(this.Status){
      print("Status: completed");
    }else{
      print("Status: pending");
    }
  }

  void completed(){
    this.Status = true;
  }
}

class TaskManager {
  List <Task> tasks;
  TaskManager(this.tasks);

  void addTask(Task task){
    tasks.add(task);
  }
  void viewTasks(){
    if (tasks.isEmpty){
      print("There is no any task!");
      return;
    }

    for (var task in tasks){
      task.display();
    }
  }

  void completedTasks() {
    List <Task> completed = tasks.where((data)=> data.Status).toList();
    for (var task in completed){
      task.display();
    }
    if(completed.isEmpty){
      print("There is no completed task");
    }
  }

  void pendingTasks() {
    List <Task> pending = tasks.where((data)=> !data.Status).toList();
    for (var task in pending){
      task.display();
    }
    if(pending.isEmpty){
      print("There is no pending task");
    }
  }

  Task? search(String title){
    for(var task in tasks){
      if (task.Title.toLowerCase() == title.toLowerCase()){
        return task;
      }
    }
    return null;
  }

  void editTask(Task task, String title, String description, DateTime duedate, bool status){
    if(title != ""){
      task.Title = title;
    }

    if(description != ""){
      task.Description = description;
    }

    if(duedate != ""){
      task.Duedate = duedate;
    }

    if(task.Status != status){
      task.Status = status;
    }
  }

  void deleteTask(Task task){
    tasks.remove(task);
  }

  void completeTask(Task task){
    task.completed();
  }
}
