import 'package:task_manager_app/core/domain/usecase/usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../di/injection.dart';
import '../../../domain/usecase/change_is_first_time_usecase.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingState.initial()){
    changeIsFirstTimeUseCase = getIt<ChangeIsFirstTimeUseCase>();
  }

  late ChangeIsFirstTimeUseCase changeIsFirstTimeUseCase;
   changeIsFirstTime() async {
   await changeIsFirstTimeUseCase(NoParams());
  }
}
