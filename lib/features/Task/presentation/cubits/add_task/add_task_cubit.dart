import 'package:task_manager_app/features/Task/domain/params/add_task_params.dart';
import 'package:task_manager_app/features/Task/domain/params/edit_task_params.dart';
import 'package:task_manager_app/features/Task/domain/usecase/add_task_usecase.dart';
import 'package:task_manager_app/features/Task/domain/usecase/delete_task.dart';
import 'package:task_manager_app/features/Task/domain/usecase/edit_task_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../../core/utils/failures/base_failure.dart';
import '../../../../../di/injection.dart';
import '../../../../auth/data/datasource/local_datasource/auth_local_datasource.dart';
part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskState.initial()) {
    _AddTaskUseCase = getIt<AddTaskUseCase>();
    editTaskUseCase = getIt<EditTaskUseCase>();
    deleteTaskUseCase = getIt<DeleteTaskUseCase>();

  }

  late AddTaskUseCase _AddTaskUseCase;
  late EditTaskUseCase editTaskUseCase;
  late DeleteTaskUseCase deleteTaskUseCase;


  submit() async {
    if (!(state.formKey.currentState!.validate())) {
      emit(state.enableValidation());
    } else {
      emit(state.changeState(TaskStatus.loading));

      try {
        await _AddTaskUseCase(state.params);
        emit(state.changeState(TaskStatus.success));
      } on Failure catch (l) {
        emit(state.addTaskError(l));
      }
    }
  }

  editSubmit() async {
    if (!(state.formKey.currentState!.validate())) {
      emit(state.enableValidation());
    } else {
      emit(state.changeState(TaskStatus.loading));

      try {
        await editTaskUseCase(state.editParams);
        emit(state.changeState(TaskStatus.success));
        //because of listener called 7 times (widget in screen call emit)
        emit(state.changeState(TaskStatus.success));
      } on Failure catch (l) {
        emit(state.addTaskError(l));
      }
    }
  }

    deleteSubmit() async {
    if (!(state.formKey.currentState!.validate())) {
      emit(state.enableValidation());
    } else {
      emit(state.changeState(TaskStatus.loading));

      try {
        await deleteTaskUseCase(state.editParams.userId!);
        emit(state.changeState(TaskStatus.success));
        //because of listener called 7 times (widget in screen call emit)
        emit(state.changeState(TaskStatus.success));
      } on Failure catch (l) {
        emit(state.addTaskError(l));
      }
    }
  }
  changeStatus(TaskStatus taskStatus) {
    emit(state.copyWith(status: taskStatus));
  }

  changePasswordVisibility() {
    emit(state.copyWith(isHidden: !(state.isHidden)));
  }

  onChangeTodo(String val) {
    emit(state.todoChange(val));
  }
   onChangeComplete(String val) {
    emit(state.completeChange(val));
  }
  onChangeId(int? val) {
    emit(state.userIdChange(val));
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
