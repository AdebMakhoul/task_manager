import 'package:task_manager_app/core/utils/constants.dart';
import 'package:task_manager_app/features/auth/data/datasource/remote_datasource/auth_remote_datasource.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/data/datasource/base_remote_datasource.dart';
import '../../../../../core/data/model/base_response_model.dart';
import '../../model/login_model.dart';

@Singleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl extends BaseRemoteDataSourceImpl
    implements AuthRemoteDataSource {
  String loginEndPoint = '${AppConstant.baseUrl}/auth/login';
  AuthRemoteDataSourceImpl({required super.dio});

  @override
  Future<BaseResponse<LoginModel>> login(Map<String, dynamic> body) async {
    final res = await post(
        url: loginEndPoint,
        body: body,
        decoder: (json) => LoginModel.fromJson(json),
        requiredToken: false);

    return res;
  }
}
