import 'package:task_manager_app/core/domain/usecase/usecase.dart';
import 'package:task_manager_app/features/auth/domain/params/login_params.dart';
import 'package:task_manager_app/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/login_model.dart';

@injectable
class LoginUseCase extends UseCase<LoginModel, LoginParams> {
  final AuthRepository repository;

  LoginUseCase({required this.repository});

  @override
  Future< LoginModel> call(params) async {
    var result=await repository.login(params.toJson());
    return result;
  }
}
