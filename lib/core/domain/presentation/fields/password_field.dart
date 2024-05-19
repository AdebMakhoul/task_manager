import 'package:formz/formz.dart';

import '../../../utils/failures/field_failure/password_field_failure.dart';
import '../regular_expression_helper.dart';

class PasswordField extends FormzInput<String, PasswordFieldFailure> {
  final int minLength;

  PasswordField.pure({this.minLength = 8}) : super.pure('');

  PasswordField.dirty(String value, {this.minLength = 8}) : super.dirty(value);

  @override
  validator(String value) {
    if (value.isEmpty) {
      return PasswordFieldFailure(PasswordError.empty);
    }
    if (!RegularExpressionsHelper.lengthReg.hasMatch(value)) {
      return PasswordFieldFailure(PasswordError.lengthError);
    }
    if (!RegularExpressionsHelper.upperCaseReg.hasMatch(value)) {
      return PasswordFieldFailure(PasswordError.oneUpperCase);
    }
    if (!RegularExpressionsHelper.lowerCaseReg.hasMatch(value)) {
      return PasswordFieldFailure(PasswordError.oneLowerCase);
    }
    if (!RegularExpressionsHelper.specialCharacterReg.hasMatch(value)) {
      return PasswordFieldFailure(PasswordError.oneSpecialCharacter);
    }
    // if (!RegularExpressionsHelper.numberReg.hasMatch(value)) {
    //   return PasswordFieldFailure(PasswordError.oneNumber);
    // }

    return null;
  }

  factory PasswordField.fromJson(String json) {
    return PasswordField.dirty(json);
  }

  String toJson() {
    return super.value;
  }
}
