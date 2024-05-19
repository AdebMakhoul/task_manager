import '../../../../../core/data/model/base_response_model.dart';
import '../../model/login_model.dart';

abstract class AuthRemoteDataSource {
  Future<BaseResponse<LoginModel>> login(Map<String, dynamic> body);

}
