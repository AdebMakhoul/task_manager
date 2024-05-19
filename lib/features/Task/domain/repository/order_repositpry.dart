import 'package:task_manager_app/core/data/model/base_response_model.dart';
import 'package:task_manager_app/features/Task/data/model/get_my_occasions_model.dart';

import '../../data/model/add_task_model.dart';

abstract class OrderRepository {

  Future<Page<TaskModel>> getMyTasks(Map<String, dynamic> params);

  Future<AddTaskModel> AddTask(Map<String, dynamic> body);
  Future<TaskModel > editTask(Map<String, dynamic> body,int taskId);
  Future<bool> deleteTask(int taskId);

}
