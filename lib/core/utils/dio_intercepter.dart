import 'dart:async';
import 'dart:io';

import 'package:task_manager_app/core/data/enums/auth_state.dart';
import 'package:task_manager_app/core/data/model/error/error_model.dart';
import 'package:dio/dio.dart';
import '../../di/injection.dart';
import '../../features/auth/domain/repository/auth_repository.dart';
import 'failures/http/http_failure.dart';
import 'handler/auth_handler.dart';

class AppInterceptors extends Interceptor {
  final AuthHandler authHandler;

  AppInterceptors(this.authHandler);

  @override
  FutureOr<dynamic> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.headers.containsKey("withToken")) {
      try {
        final res = ((await getIt<AuthRepository>().getLocalToken()));
        Map<String, dynamic> headers = {'Authorization': 'Bearer $res'};
        options.headers.addAll(headers);
      } catch (e) {
        print("there is no token in local storage ${e.toString()}");
      }
    }
    options.sendTimeout = const Duration(seconds: 60);
    options.connectTimeout = const Duration(seconds: 60);
    options.receiveTimeout = const Duration(seconds: 60);

    handler.next(options);
  }

  @override
  FutureOr<dynamic> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    switch (err.type) {
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
        throw const TimeOutFailure();
      case DioExceptionType.unknown:
        throw const NoInternetFailure();

      case DioExceptionType.connectionError:
        int statusCode = err.response?.statusCode ?? -1;

        HttpFailure failure;
        if (statusCode == HttpStatus.unauthorized ||
            statusCode == HttpStatus.forbidden) {
          failure = const UnauthorizedFailure();
          authHandler.changeAuthState(AuthState.unAuthenticated);
        } else if (statusCode == HttpStatus.badRequest) {
          failure =
              BadRequestFailure(err.response?.data['error']["message"] ?? "");
        } else if (statusCode > 500) {
          failure = const ServerFailure();
        }
        // else if (statusCode == 412) {
        //   //fixed value to check if user is registered but not verified yet
        //   failure = const NotVerifiedFailure();
        // }
        else {
          String errorMessage = 'Unknown Error!';
          try {
            errorMessage = err.response?.data['error'] != null
                ? ErrorModel.fromJson(err.response?.data['error']).message ??
                    "Unknown Error!"
                : 'Unknown Error!';
          } finally {
            failure = CustomFailure(message: errorMessage);
          }
        }
        throw failure;

      case DioExceptionType.badCertificate:
        throw const BadRequestFailure("Bad Certificate");
      case DioExceptionType.badResponse:
        HttpFailure failure;
        String errorMessage = 'Unknown Error!';
        try {
          errorMessage = err.response?.data['error'] != null
              ? ErrorModel.fromJson(err.response?.data['error']).message ??
                  "Unknown Error!"
              : 'Unknown Error!';
        } finally {
          failure = CustomFailure(message: errorMessage);
        }
        throw failure;
      case DioExceptionType.cancel:
        throw const CancelRequestFailure();
    }

    // handler.next(err);
  }

// @override
// FutureOr<dynamic> onResponse(
//   Response response,
//   ResponseInterceptorHandler handler,
// ) async {
//   // if (options.headers.value("verifyToken") != null) {
//   //   //if the header is present, then compare it with the Shared Prefs key
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   var verifyToken = prefs.get("VerifyToken");
//   //
//   //   // if the value is the same as the header, continue with the request
//   //   if (options.headers.value("verifyToken") == verifyToken) {
//   //     return options;
//   //   }
//   // }
//   //
//   // return DioError(request: options.request, message: "User is no longer active");
// }
}
