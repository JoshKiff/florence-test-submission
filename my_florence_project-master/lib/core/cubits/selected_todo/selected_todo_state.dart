part of 'selected_todo_cubit.dart';

class SelectedTodoState extends Equatable {
  final Todo selectedTodo;
  final String updatedTitle;

  const SelectedTodoState({
    required this.selectedTodo,
    required this.updatedTitle,
  });

  factory SelectedTodoState.initial() {
    return SelectedTodoState(
      selectedTodo: Todo.initial(),
      updatedTitle: '',
    );
  }

  @override
  List<Object> get props => [
        selectedTodo,
        updatedTitle,
      ];

  @override
  String toString() =>
      'SelectedTodoState(selectedTodo: $selectedTodo, updatedTitle: $updatedTitle,)';

  SelectedTodoState copyWith({
    Todo? selectedTodo,
    String? updatedTitle,
  }) {
    return SelectedTodoState(
      selectedTodo: selectedTodo ?? this.selectedTodo,
      updatedTitle: updatedTitle ?? this.updatedTitle,
    );
  }
}
