import 'package:task_manager_app/features/auth/domain/params/login_params.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../../core/utils/failures/base_failure.dart';
import '../../../../../di/injection.dart';
import '../../../domain/usecase/login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial()) {
    _loginUseCase = getIt<LoginUseCase>();
  }

  late LoginUseCase _loginUseCase;

  submit() async {
    if (!(state.formKey.currentState!.validate())) {
      emit(state.enableValidation());
    } else {
      emit(state.changeState(LoginStatus.loading));

      try {
        await _loginUseCase(state.params);
        emit(state.changeState(LoginStatus.success));
      } on Failure catch (l) {
        emit(state.loginError(l));
      }
    }
  }

  changePasswordVisibility() {
    emit(state.copyWith(isHidden: !(state.isHidden)));
  }

  onChangeEmail(String val) {
    emit(state.emailChanged(val));
  }

  onChangePassword(String val) {
    emit(state.passwordChanged(val));
  }

  showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
