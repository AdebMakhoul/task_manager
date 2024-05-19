import 'package:task_manager_app/core/data/datasource/base_local_datasource.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/data/datasource/shared_prefrences_keys.dart';

abstract class AuthLocalDataSource {
  String? getToken();

  Future<bool> isFirstTimeOpen();

  Future<bool> changeFirstTimeOpen();

  Future<bool> storeToken(String token);

  Future<bool> storeUserId(int id);

  int? getUserId();

  Future<bool> deleteToken();

  Future<String> getEmail();

  Future<bool> hasDataInBiometricsData();
}

@LazySingleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImp extends BaseLocalDataSourceImp
    implements AuthLocalDataSource {
  AuthLocalDataSourceImp(super.sharedPreferences);

  @override
  String? getToken() {
    final result = sharedPreferences.getString(SharedPreferencesKeys.token);
    return result;
  }

  @override
  Future<bool> storeToken(String token) async {
    final result =
        await sharedPreferences.setString(SharedPreferencesKeys.token, token);
    return result;
  }

  @override
  int? getUserId() {
      final result = sharedPreferences.getInt(SharedPreferencesKeys.userId);
    return result;

  }
  
  @override
  Future<bool> storeUserId(int id) async {
    final result =
        await sharedPreferences.setInt(SharedPreferencesKeys.userId, id);
    return result;
  }
  @override
  Future<bool> deleteToken() async {
    final result = await sharedPreferences.remove(SharedPreferencesKeys.token);
    return result;
  }
  @override
  Future<String> getEmail() async {
    return (sharedPreferences.getString(SharedPreferencesKeys.email))!;
  }

  @override
  Future<bool> hasDataInBiometricsData() async {
    if (sharedPreferences.getString(SharedPreferencesKeys.email) != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> isFirstTimeOpen() async {
    if (sharedPreferences.getString(SharedPreferencesKeys.isFirstTimeLogged) ==
        null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> changeFirstTimeOpen() async {
    final result = await sharedPreferences.setString(
        SharedPreferencesKeys.isFirstTimeLogged, "true");
    return result;
  }
  

}
