import 'package:task_manager_app/core/domain/usecase/usecase.dart';
import 'package:task_manager_app/features/Task/data/model/add_task_model.dart';
import 'package:task_manager_app/features/Task/domain/params/add_task_params.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/failures/base_failure.dart';
import '../repository/order_repositpry.dart';

@injectable
class AddTaskUseCase extends UseCase<AddTaskModel, AddTaskParams> {
  final OrderRepository repository;

  AddTaskUseCase({required this.repository});

  @override
  Future< AddTaskModel> call(params) async {
    var result=await repository.AddTask(params.toJson());
    return result;
  }
}
