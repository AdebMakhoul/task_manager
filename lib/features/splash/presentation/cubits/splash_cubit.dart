import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/utils/failures/base_failure.dart';
import '../../../../di/injection.dart';
import '../../../auth/domain/repository/auth_repository.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void startCounter() async {
    await Future.delayed(const Duration(seconds: 3));
    try {
      (await getIt<AuthRepository>().checkToken());
      emit(SplashLogedIn());
    } on Failure catch (l) {
      emit(SplashLogedOut());
    }
  }
}
