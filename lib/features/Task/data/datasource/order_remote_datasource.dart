import 'package:task_manager_app/features/Task/data/model/get_my_occasions_model.dart';
import '../../../../core/data/model/base_response_model.dart';
import '../model/add_task_model.dart';

abstract class OrderRemoteDataSource {
  Future<BaseResponse<Page<TaskModel>>> getMyTasks(
      Map<String, dynamic> params);
  Future<BaseResponse<TaskModel>> editTask(Map<String, dynamic> body,int taskId);
  Future<BaseResponse> deleteTask(int addressId);
  Future<BaseResponse<AddTaskModel>> addTask(Map<String, dynamic> body);

}
