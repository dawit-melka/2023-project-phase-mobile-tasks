import "task.dart";

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
