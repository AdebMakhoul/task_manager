import 'package:task_manager_app/core/data/model/base_response_model.dart';
import 'package:task_manager_app/features/Task/data/datasource/order_remote_datasource.dart';
import 'package:task_manager_app/features/Task/data/model/add_task_model.dart';
import 'package:task_manager_app/features/Task/data/model/get_my_occasions_model.dart';
import 'package:task_manager_app/features/Task/domain/repository/order_repositpry.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: OrderRepository)
class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource remoteDataSource;

  OrderRepositoryImpl(this.remoteDataSource);

  @override
  Future<TaskModel> editTask(Map<String, dynamic> body,int taskId) async {
    final BaseResponse<TaskModel> res = await remoteDataSource.editTask(body,taskId);
    return res.data!;
  }
   @override
  Future<bool> deleteTask(int taskId) async {
   final BaseResponse res =
        await remoteDataSource.deleteTask(taskId);
    return res.success!; 
  }
  @override
  Future<Page<TaskModel>> getMyTasks(
      Map<String, dynamic> params) async {
    final res = await remoteDataSource.getMyTasks(params);
    return res.data!;
  }

  @override
  Future<AddTaskModel> AddTask(Map<String, dynamic> body) async {
   final res = await remoteDataSource.addTask(body);
    return res.data!;
  }

}
