import 'package:task_manager_app/features/auth/data/datasource/local_datasource/auth_local_datasource.dart';

class EditTaskParams {
  String? todo;
  int? userId;
  String? completed;



  EditTaskParams(
      {this.todo,this.userId,this.completed});

  factory EditTaskParams.empty() {
    return EditTaskParams(
        todo: '');
  }

  EditTaskParams.fromJson(Map<String, dynamic> json) {
    todo = json['todo'];
    userId = json['userId'];
    completed = json['completed'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['todo'] = todo;
    data['completed'] = completed ?? false;
    data['userId'] =userId;
    return data;
  }

  EditTaskParams copyWith({
    String? todo, int? userId,String? completed
  }) {
    return EditTaskParams(
        todo:
            todo ?? this.todo,
                 completed:
            completed ?? this.completed,
            userId:
        userId ?? this.userId);
  }
}
