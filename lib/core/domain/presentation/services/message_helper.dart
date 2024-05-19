import 'package:task_manager_app/core/utils/failures/base_failure.dart';
import 'package:task_manager_app/core/utils/parse_helpers/parse_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


abstract class MessageHelper {
  static showErrorMessage(Failure failure, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(ParseHelper.parseFailureToErrorMessage(failure))));
  }

  static showMessage(String message, BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
