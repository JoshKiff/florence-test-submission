import 'package:flutter/material.dart';
import 'package:my_florence_project/core/cubits/selected_todo/selected_todo_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

String _textValue = '';

class EditTodoScreen extends StatelessWidget {
  static String routeName = '/EditTodoScreen';

  const EditTodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 80.0),
          child: Center(
            child: Column(
              children: [
                const Text("Current todo title:"),
                Text(
                    context.read<SelectedTodoCubit>().state.selectedTodo.title),
                const SizedBox(height: 80),
                const Text("New value"),
                TextField(
                  onChanged: (val) {
                    _textValue = val;
                  },
                ),
                TextButton(
                    onPressed: () {
                      context
                          .read<SelectedTodoCubit>()
                          .updateTodo(_textValue)
                          .then((value) {
                        if (value) {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        }
                        ;
                      });
                    },
                    child: const Text("Submit")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
