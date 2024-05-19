import 'package:task_manager_app/core/data/enums/auth_state.dart';
import 'package:task_manager_app/core/utils/failures/local_storage/local_storage_failure.dart';
import 'package:task_manager_app/core/utils/handler/auth_handler.dart';
import 'package:task_manager_app/features/auth/data/datasource/local_datasource/auth_local_datasource.dart';
import 'package:task_manager_app/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/data/model/base_response_model.dart';
import '../datasource/remote_datasource/auth_remote_datasource.dart';
import '../model/login_model.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource authLocalDataSource;
  final AuthHandler authHandler;
  late String? token;

  AuthRepositoryImpl(
      this.remoteDataSource, this.authLocalDataSource, this.authHandler) {
    token = authLocalDataSource.getToken();
  }

  @override
  Future<LoginModel> login(Map<String, dynamic> body) async {
    final BaseResponse<LoginModel> res = await remoteDataSource.login(body);

    //UserInfoParams userInfoParams = UserInfoParams(res.data!.userId ?? 0);
    //loadRemoteUserInfo(userInfoParams.toJson());
    authLocalDataSource.storeToken(res.data?.token ?? '');
    token = res.data?.token;
    authHandler.changeAuthState(AuthState.authenticated);
    return res.data!;
  }

  @override
  Future<String> getLocalToken() {
    token = authLocalDataSource.getToken();

    if (token == null) {
      throw (DataNotExistFailure());
    } else {
      return Future.value((token));
    }
  }

  @override
  Future<String> checkToken() async {
    token = authLocalDataSource.getToken();
    bool isFirstTime = await authLocalDataSource.isFirstTimeOpen();
    if (token == null) {
      if (isFirstTime) {
        authHandler.changeAuthState(AuthState.firstTime);
        throw (DataNotExistFailure());
      } else {
        authHandler.changeAuthState(AuthState.unAuthenticated);
        throw (DataNotExistFailure());
      }
    } else {
      authHandler.changeAuthState(AuthState.authenticated);
      return Future.value((token));
    }
  }

  // @override
  // Future<String> getLocalUserInfo() async {
  //   UserInfoModel userInfo = await authLocalDataSource.getUserInfo();
  //   return userInfo.fullName;
  // }

  @override
  Future<bool> logOut() async {
    //todo call logout API
    //await remoteDataSource.logOut();
    await authLocalDataSource.deleteToken();

    ///delete cached token from dio
    authHandler.changeAuthState(AuthState.unAuthenticated);
    return (true);
  }

  @override
  Future<bool> changeIsFirstTime() async {
    return await authLocalDataSource.changeFirstTimeOpen();
  }


  @override
  void guestMode() {
    authHandler.changeAuthState(AuthState.guestMode);
  }
  


}
