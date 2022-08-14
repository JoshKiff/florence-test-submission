import 'package:flutter/material.dart';
import 'package:my_florence_project/core/cubits/selected_todo/selected_todo_cubit.dart';
import 'package:my_florence_project/core/cubits/snackbar/snackbar_cubit.dart';
import 'package:my_florence_project/core/cubits/todo_list/todos_list_cubit.dart';
import 'package:my_florence_project/core/repositories/network_client.dart';
import 'package:my_florence_project/ui/pages/edit_todo_screen/edit_todo_screen.dart';
import 'package:my_florence_project/ui/pages/todo_screen/todos_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Bug fixes and best practices implemented:
// Removed all unused packages
// Null safety implemented
// All code refactored into folders for easy access
// Named routes used for easy access for navigation
// FutureBuilder used to get the todo list, CircularProgressIndicator shows when data is being fetched
// Used BloC state management package to managed state and separate business logic
// All widgets are now stateless to improve performance
// Repository provider used for the network client, makes it obvious where all the http requests are made and makes it possible to call from each cubit
// Try/Catch blocks used on Futures to catch network/request errors
// Snackbar separated into a cubit - makes it possible to show a snackbar update from anywhere in the UI if needed
// Todo list made into a cubit so access is available anywhere in the code if needed
// Data is now passed through each cubit and not to each widget through the Navigator.push... makes the logic scalable
// Null error solved when Navigating back from the error screen

//Improvements:
// Toast messages to users to show if an edit has been made successfully or not
// A stream could be used to fetch updates automatically when changes to the database have been made
// Tick box next to each todo to check if it has been done or not
// Offline caching could be done to access list offline

void main() {
  runApp(const AppSetup());
}

class AppSetup extends StatelessWidget {
  const AppSetup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: ((context) => NetworkClient()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SnackbarCubit(),
          ),
          BlocProvider(
            create: (context) => SelectedTodoCubit(
              networkClient: context.read<NetworkClient>(),
              snackbarCubit: context.read<SnackbarCubit>(),
            ),
          ),
          BlocProvider(
            create: (context) => TodoListCubit(
              networkClient: context.read<NetworkClient>(),
            ),
          ),
        ],
        child: const Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        routes: {
          EditTodoScreen.routeName: (context) => const EditTodoScreen(),
        },
        home: const TodosScreen());
  }
}
