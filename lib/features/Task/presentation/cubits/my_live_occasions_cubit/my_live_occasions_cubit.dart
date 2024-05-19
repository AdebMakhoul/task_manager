import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:task_manager_app/core/data/datasource/base_local_sqlite_database.dart';
import 'package:task_manager_app/core/data/model/base_response_model.dart';
import 'package:task_manager_app/core/utils/constants.dart';
import 'package:task_manager_app/core/utils/failures/base_failure.dart';
import 'package:task_manager_app/di/injection.dart';
import 'package:task_manager_app/features/Task/data/model/get_my_occasions_model.dart';
import 'package:task_manager_app/features/Task/domain/params/get_occasions_param.dart';
import 'package:task_manager_app/features/Task/domain/usecase/get_my_occasions_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart' as ui;
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'my_live_occasions_state.dart';

class MyLiveOccasionsCubit extends Cubit<MyLiveOccasionsState> {
  MyLiveOccasionsCubit() : super(MyLiveOccasionsState.initial()) {
    getMyOccasionsUseCase = getIt<GetMyOccasionsUseCase>();
  }

  late GetMyOccasionsUseCase getMyOccasionsUseCase;

  getLiveList({bool isRefresh = true}) async {
    bool result = await InternetConnectionChecker().hasConnection;
if(result == true) {
      if (isRefresh) {
      emit(state.createReLoadState());
    } else {
      emit(state.copyWith(status: MyLiveOccasionsStatus.loadingMoreData));
    }
    try {
      emit(state.changeRequestModel());

      final Page<TaskModel> res =
          (await getMyOccasionsUseCase(state.getMyOccasionParams!));
          for(int i=0;i< res.list.length;i++){
            DatabaseHelper.addTask(res.list[i]);
          }
      if (isRefresh) {
        emit(state.copyWith(
            status: MyLiveOccasionsStatus.success,
            myLiveOccasionsListModel: res,
            skip: state.skip + state.limit!,
            refreshController: state.refreshController..refreshCompleted()));
      } else {
        emit(state.copyWith(
            status: MyLiveOccasionsStatus.success,
            myLiveOccasionsListModel: state.myLiveOccasionsListModel!
              ..list.addAll(res.list),
            skip: state.skip + state.limit!,
            refreshController: state.refreshController..loadComplete()));
      }
      if (res.list.isEmpty) {
        emit(state.copyWith(
            refreshController: state.refreshController..loadNoData()));
      }
    } on Failure catch (l) {
      if (isRefresh) {
        emit(
          state.copyWith(
              getMyLiveOccasionsListFailure: l,
              status: MyLiveOccasionsStatus.error,
              refreshController: state.refreshController..refreshFailed()),
        );
      } else {
        emit(
          state.copyWith(
              getMyLiveOccasionsListFailure: l,
              status: MyLiveOccasionsStatus.errorMoreData,
              refreshController: state.refreshController..loadFailed()),
        );
      }
    }
} 

  }
}
