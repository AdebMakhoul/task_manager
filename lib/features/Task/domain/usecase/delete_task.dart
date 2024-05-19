import 'package:injectable/injectable.dart';
import 'package:task_manager_app/core/domain/usecase/usecase.dart';
import 'package:task_manager_app/features/Task/domain/repository/order_repositpry.dart';


@injectable
class DeleteTaskUseCase extends UseCase<bool, int> {
  final OrderRepository repository;

  DeleteTaskUseCase({required this.repository});

  @override
  Future<bool> call(params) async {
    return repository.deleteTask(params);
  }
}
