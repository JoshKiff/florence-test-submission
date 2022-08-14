import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_florence_project/core/cubits/snackbar/snackbar_cubit.dart';
import 'package:my_florence_project/core/models/todo.dart';
import 'package:my_florence_project/core/repositories/network_client.dart';

part 'selected_todo_state.dart';

class SelectedTodoCubit extends Cubit<SelectedTodoState> {
  final NetworkClient networkClient;
  final SnackbarCubit snackbarCubit;

  SelectedTodoCubit({required this.networkClient, required this.snackbarCubit})
      : super(SelectedTodoState.initial());

  void selectTodo(Todo todo) {
    emit(state.copyWith(selectedTodo: todo));
  }

  void updateNewTitle(String title) {
    emit(state.copyWith(updatedTitle: title));
  }

  Future<bool> updateTodo(String newTitle) async {
    updateNewTitle(newTitle);
    bool updateSucess = false;
    try {
      networkClient.updateTodo(Todo(
          title: state.updatedTitle,
          completed: state.selectedTodo.completed,
          userId: state.selectedTodo.userId,
          id: state.selectedTodo.id));
      snackbarCubit.showSnackbar(state.updatedTitle);
      updateSucess = true;
    } catch (e) {
      updateSucess = false;
    }
    return updateSucess;
  }

  Future<bool> deleteTodo() async {
    bool updateSucess = false;
    try {
      networkClient.deleteTodo(state.selectedTodo.id);
      snackbarCubit.showSnackbar('${state.selectedTodo.title} deleted!');
      updateSucess = true;
    } catch (e) {
      updateSucess = false;
    }
    return updateSucess;
  }
}
