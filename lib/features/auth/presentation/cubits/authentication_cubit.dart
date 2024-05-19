import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/data/enums/auth_state.dart';
import '../../../../core/utils/handler/auth_handler.dart';

part 'authentication_state.dart';

@singleton
class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthHandler authHandler;

  AuthenticationCubit(this.authHandler)
      : super(const AuthenticationState(authState: AuthState.unKnown)) {
    authHandler.listen().listen(
      (event) {
        authStateChanges(event);
      },
    );
  }

  void authStateChanges(AuthState authState) {
    emit(AuthenticationState(authState: authState));
  }

  bool getAuthState() {
    return state.authState == AuthState.authenticated;
  }

  AuthState getAuthStateName() {
    return state.authState;
  }
}
