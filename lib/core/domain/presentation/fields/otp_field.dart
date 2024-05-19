import 'package:formz/formz.dart';

import '../../../utils/failures/field_failure/otp_field_failure.dart';

class OtpField extends FormzInput<String, OtpFieldFailure> {


  OtpField.pure() : super.pure('');

  OtpField.dirty(
    String value, ) : super.dirty(value);

  @override
  validator(String value) {
    return value.isEmpty
        ?OtpFieldFailure(OtpFieldError.empty):
    value.length < 4
            ? OtpFieldFailure(OtpFieldError.otpLessThanNumber)
            : null;
  }

  factory OtpField.fromJson(String json, int length) {
    return OtpField.dirty(json,);
  }

  String toJson() {
    return super.value;
  }
}
