class Todo {
  int id;
  String title;
  bool completed;
  int userId;

  Todo(
      {required this.title,
      required this.completed,
      required this.userId,
      required this.id});

  factory Todo.initial() {
    return Todo(title: '', completed: false, userId: 0, id: 0);
  }

  Todo.from(Map<String, dynamic> data)
      : id = data["id"] ?? 0,
        title = data["title"] ?? '',
        completed = data["completed"] ?? false,
        userId = data["userId"] ??
            0; //null check and equate to empty string if so to avoid null errors

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "user_id": userId,
      "completed": completed,
    };
  }
}
