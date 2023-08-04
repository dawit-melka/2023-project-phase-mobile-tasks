import "dart:io";
import "task.dart";
import "task_manager.dart";
void main(){
  TaskManager TM = TaskManager([]);
  while(true){
    print("press 1 to add task");
    print("press 2 to view all tasks");
    print("press 3 to view only completed tasks");
    print("press 4 to view only pending tasks");
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

