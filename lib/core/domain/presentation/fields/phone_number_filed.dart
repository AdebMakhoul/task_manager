import 'package:formz/formz.dart';

import '../../../utils/failures/field_failure/phone_number_field_failure.dart';
import '../regular_expression_helper.dart';




class PhoneNumberField extends FormzInput<String, PhoneNumberFieldFailure> {
  PhoneNumberField.pure() : super.pure('');

  PhoneNumberField.dirty(String value) : super.dirty(value);

  @override
  validator(String value) {
    if (value.isEmpty) {
      return PhoneNumberFieldFailure(PhoneNumberError.empty);
    }
    if (!RegularExpressionsHelper.phoneNumberReg.hasMatch(value)) {
      return PhoneNumberFieldFailure(PhoneNumberError.notValid);
    }
    return null;
  }

  factory PhoneNumberField.fromJson(String json) {
    return PhoneNumberField.dirty(json);
  }

  String toJson() {
    return super.value;
  }
}
