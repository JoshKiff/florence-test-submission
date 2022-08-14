import 'package:flutter/material.dart';
import 'package:my_florence_project/core/cubits/selected_todo/selected_todo_cubit.dart';
import 'package:my_florence_project/ui/pages/edit_todo_screen/edit_todo_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoModelSheet extends StatelessWidget {
  const TodoModelSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TextButton(
          onPressed: () async {
            context.read<SelectedTodoCubit>().deleteTodo().then((value) {
              if (value) {
                Navigator.pop(context);
              }
            });
          },
          child: const Text("Delete"),
        ),
        TextButton(
          onPressed: () async {
            Navigator.pushNamed(context, EditTodoScreen.routeName);
          },
          child: const Text("Edit"),
        ),
      ],
    );
  }
}
