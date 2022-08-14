import 'package:flutter/material.dart';
import 'package:my_florence_project/core/cubits/selected_todo/selected_todo_cubit.dart';
import 'package:my_florence_project/core/cubits/snackbar/snackbar_cubit.dart';
import 'package:my_florence_project/core/cubits/todo_list/todos_list_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_florence_project/ui/pages/todo_screen/components/todo_model_sheet.dart';

//Removed all unused packages

class TodosScreen extends StatelessWidget {
  const TodosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SnackbarCubit, SnackbarState>(
      listener: (context, state) {
        if (state.showSnackbar) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.snackbarText),
              backgroundColor: Colors.green,
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Todos"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context
                .read<TodoListCubit>()
                .createTodo('Test'); //Using Bloc state management
          },
          child: const Icon(Icons.add),
        ),
        body: FutureBuilder(
            future: context.read<TodoListCubit>().getTodoList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .stretch, //Strech the column so the whole screen width is the button
                    children: context
                        .watch<TodoListCubit>()
                        .state
                        .todoList
                        .map((todo) => GestureDetector(
                              onTap: () {
                                context
                                    .read<SelectedTodoCubit>()
                                    .selectTodo(todo);
                                showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const TodoModelSheet();
                                    });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  todo.title,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.toString()),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}  //Removed all business logic from UI elements
