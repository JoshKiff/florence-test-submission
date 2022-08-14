import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_florence_project/core/models/todo.dart';
import 'package:my_florence_project/core/constants/constants.dart';

class NetworkClient {
  // GETS Users
  getUsers() async {
    try {
      var url = Uri.parse('$urlBody/users/');
      var response = await http.get(url);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    } catch (e) {
      print(e);
    }
  }

  // GETS Todos: Gets all todos
  getTodos() async {
    var url = Uri.parse('$urlBody/todos/');

    //try catch block to catch errors
    try {
      var response = await http.get(url);
      return response.body;
    } catch (e) {
      print(e);
    }
  }

  // PUTS Todos: Updates a _todo
  Future<dynamic> updateTodo(Todo todo) async {
    try {
      var url = Uri.parse('$urlBody/todos/${todo.id}');
      var body = json.encode(todo.toMap());
      var response = await http.put(url,
          headers: {"Content-Type": "application/json"}, body: body);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      return response.body;
    } catch (e) {
      print(e);
    }
  }

  // POST Todos: Creates a new _todo
  createTodo(String title) async {
    try {
      var url = Uri.parse('$urlBody/todos/');
      final body = json.encode({"title": title}); //mistake in 'title'
      var response = await http.post(url,
          headers: {"Content-Type": "application/json"}, body: body);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    } catch (e) {
      print(e);
    }
  }

  // DELETE Todos: Deletes a _todo
  Future<bool> deleteTodo(int id) async {
    http.Response? response;

    try {
      var url = Uri.parse('$urlBody/todos/$id');
      response = await http.delete(url);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    } catch (e) {
      print(e);
    }
    return response!.statusCode == 200;
  }
}
