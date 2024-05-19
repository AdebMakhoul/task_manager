part of 'add_task_cubit.dart';

enum TaskStatus {
  initial,
  loading,
  error,
  success,
  unverifiedUser,
  notFoundUser
}

class AddTaskState {
  final TaskStatus status;
  // final CheckUserStatusParams checkUserStatusParams;
  final AddTaskParams params;
  final EditTaskParams editParams;

  final Failure? AddTaskFailure;
  final bool validateField;
  GlobalKey<FormState> formKey;
  final bool isHidden;
  AuthLocalDataSource? authLocalDataSource;
  AddTaskState._({
    required this.status,
    required this.params,
    required this.editParams,

    this.AddTaskFailure,
    // required this.checkUserStatusParams,
    this.validateField = false,
    required this.formKey,
    this.isHidden = true,
  });

  AddTaskState.initial()
      : status = TaskStatus.initial,
        params = AddTaskParams.empty(),
        editParams = EditTaskParams.empty(),

        AddTaskFailure = null,
        validateField = false,
        formKey = GlobalKey<FormState>(),
        isHidden = true;

  AddTaskState todoChange(String newTodo) {

    return copyWith(
        params: params.copyWith(todo: newTodo),
            );
  }
   AddTaskState completeChange(String complete) {

    return copyWith(
        editParams: editParams.copyWith(completed: complete),
            );
  }
  AddTaskState userIdChange(int? userId) {
 
    return copyWith(
        params: params.copyWith(userId: userId ),
        editParams: editParams.copyWith(userId: userId ),

            );
  }

  AddTaskState changeState(TaskStatus status) {
    return copyWith(status: status);
  }

  AddTaskState addTaskError(Failure failure) {
    return copyWith(status: TaskStatus.error, AddTaskFailure: failure);
  }

  AddTaskState enableValidation() {
    return copyWith(validateField: true);
  }

  AddTaskState disableValidation() {
    return copyWith(validateField: false, formKey: GlobalKey<FormState>());
  }

  copyWith(
      {TaskStatus? status,
      AddTaskParams? params,
      EditTaskParams? editParams,

      Failure? AddTaskFailure,
      bool? validateField,
      bool? isHidden,
      bool? saveInfoWithBiometrics,
     // CheckUserStatusParams? checkUserStatusParams,
      bool? hasBiometrics,
      GlobalKey<FormState>? formKey,
      bool? hasBiometricsData}) {
    return AddTaskState._(
      status: status ?? this.status,
      params: params ?? this.params,
      editParams: editParams ?? this.editParams,

      // checkUserStatusParams:
      //     checkUserStatusParams ?? this.checkUserStatusParams,
      formKey: formKey ?? this.formKey,
      AddTaskFailure: AddTaskFailure ?? this.AddTaskFailure,
      validateField: validateField ?? this.validateField,
      isHidden: isHidden ?? this.isHidden,
    );
  }
}
