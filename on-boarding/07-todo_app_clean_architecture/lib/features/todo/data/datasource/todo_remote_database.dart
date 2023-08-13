import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/todo.dart';

abstract class TodoRemoteDatabase{
  // Add Todo
  Future<Todo> addTodo(Todo todo);

  // Edit Todo
  Future<Todo> editTodo(Todo todo);
  // Delete
  Future<Todo> deleteTodo(Todo todo);
  // Complete
  Future<Todo> completeTodo(Todo todo);

  // Get All Todo
  Future<List<Todo>> listTodos();
}


class TodoRemoteDatabaseImpl implements TodoRemoteDatabase{
  @override
  Future<Todo> addTodo(Todo todo) async {
    await FirebaseFirestore.instance.collection('todos').doc(todo.id).set(todo.toMap());
    return todo;
  }

  @override
  Future<Todo> deleteTodo(Todo todo) async {
    await FirebaseFirestore.instance.collection('todos').doc(todo.id).delete();
    return todo;
  }

  @override
  Future<Todo> editTodo(Todo todo) async {
    await FirebaseFirestore.instance.collection('todos').doc(todo.id).update(todo.toMap());
    return todo;
  }

  @override
  Future<List<Todo>> listTodos() async {
    final todosData = await FirebaseFirestore.instance.collection('todos').get();
    return todosData.docs.map((item) => Todo.fromMap(item.data())).toList();
  }
  
  @override
  Future<Todo> completeTodo(Todo todo) async {
    await FirebaseFirestore.instance.collection('todos').doc(todo.id).update(todo.toMap());
    return todo;
  }

}