part of 'my_live_occasions_cubit.dart';

enum MyLiveOccasionsStatus {
  initial,
  loading,
  loadingMoreData,
  error,
  errorMoreData,
  noDataToGet, //on refresh success
  success
}

class MyLiveOccasionsState {
  final MyLiveOccasionsStatus status;
  final Failure? getMyLiveOccasionsListFailure;
  final Page<TaskModel>? myLiveOccasionsListModel;
  final RefreshController refreshController;
  final ui.Color backgroundColor;
  final GetMyOccasionParams? getMyOccasionParams;
  final int skip;
  final int? limit;

  MyLiveOccasionsState._({
    required this.status,
    this.getMyLiveOccasionsListFailure,
    this.getMyOccasionParams,
    this.myLiveOccasionsListModel,
    required this.backgroundColor,
    required this.refreshController,
    this.limit = AppConstant.listMaxResult,
    this.skip = 0,
  });

  MyLiveOccasionsState.initial()
      : status = MyLiveOccasionsStatus.initial,
        getMyLiveOccasionsListFailure = null,
        myLiveOccasionsListModel = null,
        skip = 0,
        limit = AppConstant.listMaxResult,
        getMyOccasionParams = GetMyOccasionParams(status: 0),
        backgroundColor = ui.Colors.white,
        refreshController = RefreshController();

  MyLiveOccasionsState getRefillListError(Failure failure) {
    return copyWith(
      status: MyLiveOccasionsStatus.error,
      getMyLiveOccasionsListFailure: failure,
    );
  }

  MyLiveOccasionsState createReLoadState() {
    return copyWith(
      status: MyLiveOccasionsStatus.loading,
      refreshController: refreshController
        ..refreshToIdle()
        ..loadComplete(),
      myLiveOccasionsListModel: null,
      getMyLiveOccasionsListFailure: null,
      skip: 0,
    );
  }

  MyLiveOccasionsState changeRequestModel() {
    return copyWith(
        getMyOccasionParams: GetMyOccasionParams(
            skip: skip,
            limit: limit,
            status: 0));
  }

  copyWith(
      {MyLiveOccasionsStatus? status,
      Failure? getMyLiveOccasionsListFailure,
      Page<TaskModel>? myLiveOccasionsListModel,
      int? currentSlid,
      GetMyOccasionParams? getMyOccasionParams,
      ui.Color? backgroundColor,
      int? skip,
      RefreshController? refreshController}) {
    return MyLiveOccasionsState._(
        status: status ?? this.status,
        getMyOccasionParams: getMyOccasionParams ?? this.getMyOccasionParams,
        backgroundColor: backgroundColor ?? this.backgroundColor,
        getMyLiveOccasionsListFailure:
            getMyLiveOccasionsListFailure ?? this.getMyLiveOccasionsListFailure,
        myLiveOccasionsListModel:
            myLiveOccasionsListModel ?? this.myLiveOccasionsListModel,
        skip: skip ?? this.skip,
        refreshController: refreshController ?? this.refreshController);
  }
}
