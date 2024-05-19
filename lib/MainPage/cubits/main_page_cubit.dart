import 'package:task_manager_app/core/utils/failures/base_failure.dart';
import 'package:bloc/bloc.dart';

part 'main_page_state.dart';

class MainPageCubit extends Cubit<MainPageState> {
  MainPageCubit() : super(MainPageState.initial()) {
  }
}
