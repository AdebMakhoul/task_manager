class TaskModel {
  TaskModel(
      {required this.todo,
      required this.completed,
      required this.userId,
      required this.id});

  final String todo;
  final int completed;
  final int userId;
  final int id;

  TaskModel copyWith({
    String? todo,
    int? completed,
    int? userId,
    int? id,
  }) {
    return TaskModel(
      todo:
          todo ?? this.todo,
      completed: completed ?? this.completed,
      userId: userId ?? this.userId,
      id: id ?? this.id,
    );
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    TaskModel temp = TaskModel(
      todo: json["todo"] ?? "",
      completed:  json["completed"]== 1?1:0 ?? 0,
      userId: json["userId"] ?? 0,
      id: json["id"] ?? 0,
    );
    return temp;
  }

  Map<String, dynamic> toJson() => {
        "todo": todo,
        "completed": completed,
        "userId": userId,
        "id": id,
      };

  @override
  String toString() {
    return "$todo, $completed, $userId,$id, ";
  }
}
