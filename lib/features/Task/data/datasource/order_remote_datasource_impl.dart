import 'package:task_manager_app/core/data/datasource/base_remote_datasource.dart';
import 'package:task_manager_app/core/data/model/base_response_model.dart';
import 'package:task_manager_app/core/utils/constants.dart';
import 'package:task_manager_app/features/Task/data/model/add_task_model.dart';
import 'package:task_manager_app/features/Task/data/model/get_my_occasions_model.dart';
import 'package:injectable/injectable.dart';

import 'order_remote_datasource.dart';

@Singleton(as: OrderRemoteDataSource)
class FavoriteRemoteDataSourceImpl extends BaseRemoteDataSourceImpl
    implements OrderRemoteDataSource {
  String getMyTasksEndPoint =
      "${AppConstant.baseUrl}/todos";
        String addTaskEndPoint =
      "${AppConstant.baseUrl}/todos/add";
          String updateTaskEndPoint =
       "${AppConstant.baseUrl}/todos/";
          String deleteTaskEndPoint =
       "${AppConstant.baseUrl}/todos/";

  FavoriteRemoteDataSourceImpl({required super.dio});
 
  @override
  Future<BaseResponse<AddTaskModel>> addTask(Map<String, dynamic> body) async {
    final res = await post(
        url: addTaskEndPoint,
        body: body,
        decoder: (json) => AddTaskModel.fromJson(json),
        requiredToken: false);

    return res;
  }
    @override
  Future<BaseResponse<TaskModel>> editTask(
      Map<String, dynamic> body, int taskId) async {
    final res = await put(
        url: updateTaskEndPoint+taskId.toString(),
       params: {"Id": taskId},
        body: body,
        decoder: (json) => TaskModel.fromJson(json),
        requiredToken: true);

    return res;
  }
 @override
  Future<BaseResponse> deleteTask(int taskId) async {
    final res = await delete(
        url: deleteTaskEndPoint+taskId.toString(),
        params: {"Id": taskId},
        decoder: (json) => {},
        requiredToken: true);
    return res;
  }

  @override
  Future<BaseResponse<Page<TaskModel>>> getMyTasks(
      Map<String, dynamic> params) async {
    final res = await get(
        url: getMyTasksEndPoint,
        params: params,
        decoder: (json) => Page.fromJson(
            json, TaskModel.fromJson, ListKeysPage.todos),
        requiredToken: true);
    return res;
  }


}
