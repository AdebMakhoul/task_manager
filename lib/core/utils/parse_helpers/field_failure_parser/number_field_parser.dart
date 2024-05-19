import 'package:task_manager_app/core/utils/failures/field_failure/required_field_number_failure.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';


class NumberFieldFailureParser {
  static String mapFieldFailureToErrorMessage(
      {required NumberFieldFailure failure,}) {
    switch (failure.error) {
      case NumberFieldError.empty:
        return tr("failures.required");
      case NumberFieldError.notValid:
        return "Number Invalid";
    }
  }
}
