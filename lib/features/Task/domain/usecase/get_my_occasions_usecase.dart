import 'package:task_manager_app/core/data/model/base_response_model.dart';
import 'package:task_manager_app/core/domain/usecase/usecase.dart';
import 'package:task_manager_app/features/Task/data/model/get_my_occasions_model.dart';
import 'package:task_manager_app/features/Task/domain/params/get_occasions_param.dart';
import 'package:task_manager_app/features/Task/domain/repository/order_repositpry.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetMyOccasionsUseCase extends UseCase<Page<TaskModel>, GetMyOccasionParams> {
  final OrderRepository repository;

  GetMyOccasionsUseCase({required this.repository});

  @override
  Future<Page<TaskModel>> call(params) async {
    return repository.getMyTasks(params.toJson());
  }
}
