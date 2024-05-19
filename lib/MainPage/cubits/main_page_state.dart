part of 'main_page_cubit.dart';

enum MainPageStatus { initial, loading, error, success }

class MainPageState {
  final MainPageStatus status;
  final Failure? mainPageFailure;

  MainPageState._({
    required this.status,
    this.mainPageFailure,
  });

  MainPageState.initial()
      : status = MainPageStatus.initial,
        mainPageFailure = null;

  MainPageState getRefillListError(Failure failure) {
    return copyWith(
      status: MainPageStatus.error,
      mainPageFailure: failure,
    );
  }

  copyWith({
    MainPageStatus? status,
    Failure? mainPageFailure,
  }) {
    return MainPageState._(
      status: status ?? this.status,
      mainPageFailure: mainPageFailure ?? this.mainPageFailure,
    );
  }
}
