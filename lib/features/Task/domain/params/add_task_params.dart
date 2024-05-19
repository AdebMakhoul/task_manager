import 'package:task_manager_app/features/auth/data/datasource/local_datasource/auth_local_datasource.dart';

class AddTaskParams {
  String? todo;
  int? userId;



  AddTaskParams(
      {this.todo,this.userId});

  factory AddTaskParams.empty() {
    return AddTaskParams(
        todo: '');
  }

  AddTaskParams.fromJson(Map<String, dynamic> json) {
    todo = json['todo'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['todo'] = todo;
    data['completed'] = false;
    data['userId'] =userId;
    return data;
  }

  AddTaskParams copyWith({
    String? todo, int? userId,
  }) {
    return AddTaskParams(
        todo:
            todo ?? this.todo,
            userId:
        userId ?? this.userId);
  }
}
