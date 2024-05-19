import 'package:task_manager_app/core/data/enums/location_states.dart';
import 'package:task_manager_app/core/data/model/base_response_model.dart';

abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}
abstract class LocationUseCase<Type, Params> {
  Future<Type> call(Params params,Location location);
}
abstract class ImgUseCase<Type, Params> {
   Future<BaseResponse<String>> callImg(Params params);
}
class NoParams {
  Map<String, dynamic> toJson() => {};
}
