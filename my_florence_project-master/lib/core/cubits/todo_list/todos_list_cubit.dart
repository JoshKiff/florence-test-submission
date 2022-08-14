import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_florence_project/core/models/todo.dart';
import 'package:my_florence_project/core/repositories/network_client.dart';

part 'todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  final NetworkClient networkClient;

  TodoListCubit({required this.networkClient}) : super(TodoListState.initial());

  createTodo(String todo) {
    networkClient.createTodo(todo);
  }

  getTodoList() async {
    List<Todo> newList = [];

    final todoData = await networkClient.getTodos();

    try {
      newList = List<Todo>.from(json.decode(todoData).map((e) => Todo.from(e)));
      emit(state.copyWith(todoList: newList));
      return newList;
    } catch (e) {
      print(e);
      return e;
    }
  }
}
