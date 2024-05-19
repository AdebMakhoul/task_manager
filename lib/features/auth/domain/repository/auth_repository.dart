
import 'package:task_manager_app/features/auth/data/model/login_model.dart';

abstract class AuthRepository {
  Future<LoginModel> login(Map<String, dynamic> body);

  Future<String> getLocalToken();

  Future<String> checkToken();

  Future<bool> logOut();

  Future<bool> changeIsFirstTime();

  void guestMode();
}
