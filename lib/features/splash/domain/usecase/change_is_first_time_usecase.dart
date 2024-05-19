import 'package:task_manager_app/core/domain/usecase/usecase.dart';
import 'package:task_manager_app/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';


@injectable
class ChangeIsFirstTimeUseCase extends UseCase<bool, NoParams> {
  final AuthRepository repository;

  ChangeIsFirstTimeUseCase({required this.repository});

  @override
  Future<bool> call(params) async {
    var result = await repository.changeIsFirstTime();
    return result;
  }
}
