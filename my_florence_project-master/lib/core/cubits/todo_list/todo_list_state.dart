part of 'todos_list_cubit.dart';

class TodoListState extends Equatable {
  final List<Todo> todoList;

  const TodoListState({
    required this.todoList,
  });

  factory TodoListState.initial() {
    return const TodoListState(todoList: []);
  }

  @override
  List<Object> get props => [todoList];

  @override
  String toString() => 'TodosState(todoList: $todoList)';

  TodoListState copyWith({
    List<Todo>? todoList,
  }) {
    return TodoListState(
      todoList: todoList ?? this.todoList,
    );
  }
}
