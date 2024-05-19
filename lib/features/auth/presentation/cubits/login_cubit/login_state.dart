part of 'login_cubit.dart';

enum LoginStatus {
  initial,
  loading,
  error,
  success,
  unverifiedUser,
  notFoundUser
}

class LoginState {
  final LoginStatus status;
  // final CheckUserStatusParams checkUserStatusParams;
  final LoginParams params;
  final Failure? loginFailure;
  final bool validateField;
  GlobalKey<FormState> formKey;
  final bool isHidden;

  LoginState._({
    required this.status,
    required this.params,
    this.loginFailure,
    // required this.checkUserStatusParams,
    this.validateField = false,
    required this.formKey,
    this.isHidden = true,
  });

  LoginState.initial()
      : status = LoginStatus.initial,
        params = LoginParams.empty(),
        loginFailure = null,
        validateField = false,
        // checkUserStatusParams =
        //     CheckUserStatusParams(usernameOrEmailOrPhone: '', countryCode: ''),
        formKey = GlobalKey<FormState>(),
        isHidden = true;

  LoginState emailChanged(String newEmail) {
    return copyWith(
        params: params.copyWith(username: newEmail),
        // checkUserStatusParams:
        //     checkUserStatusParams.copyWith(usernameOrEmailOrPhone: newEmail)
            
            );
  }


  LoginState changeState(LoginStatus status) {
    return copyWith(status: status);
  }

  LoginState passwordChanged(String newPassword) {
    return copyWith(
      params: params.copyWith(password: newPassword),
    );
  }

  LoginState loginError(Failure failure) {
    return copyWith(status: LoginStatus.error, loginFailure: failure);
  }

  LoginState enableValidation() {
    return copyWith(validateField: true);
  }

  LoginState disableValidation() {
    return copyWith(validateField: false, formKey: GlobalKey<FormState>());
  }

  copyWith(
      {LoginStatus? status,
      LoginParams? params,
      Failure? loginFailure,
      bool? validateField,
      bool? isHidden,
      bool? saveInfoWithBiometrics,
      bool? hasBiometrics,
      GlobalKey<FormState>? formKey,
      bool? hasBiometricsData}) {
    return LoginState._(
      status: status ?? this.status,
      params: params ?? this.params,
      formKey: formKey ?? this.formKey,
      loginFailure: loginFailure ?? this.loginFailure,
      validateField: validateField ?? this.validateField,
      isHidden: isHidden ?? this.isHidden,
    );
  }
}
