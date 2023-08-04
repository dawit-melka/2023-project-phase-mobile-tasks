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
