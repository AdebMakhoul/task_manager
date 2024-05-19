import 'package:injectable/injectable.dart';
import 'package:task_manager_app/core/domain/usecase/usecase.dart';
import 'package:task_manager_app/features/Task/data/model/get_my_occasions_model.dart';
import 'package:task_manager_app/features/Task/domain/params/edit_task_params.dart';
import 'package:task_manager_app/features/Task/domain/repository/order_repositpry.dart';



@injectable
class EditTaskUseCase extends UseCase<TaskModel, EditTaskParams> {
  final OrderRepository repository;

  EditTaskUseCase({required this.repository});

  @override
  Future< TaskModel> call(params) async {
    var result=await repository.editTask(params.toJson(), params.userId!);
    return result;
  }
}
