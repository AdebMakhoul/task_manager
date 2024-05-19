import 'package:task_manager_app/core/utils/extentions.dart';
import 'package:task_manager_app/core/utils/failures/field_failure/field_failure.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneNumberField extends StatefulWidget {
  final bool autoValidate;
  final String? hintText;
  final String? initialValue;
  final FieldFailure? Function(String)? validator;
  final TextEditingController controller;
  final bool isPhoneNumber;
  final bool isReadOnly;
  final Function(String) onChange;
  final ValueChanged<Country>? onCountryChanged;
  final TextInputAction? textInputAction;
  final TextInputType keyboardType;
  final TextInputType? textInputType;
  final List<Country>? countries;

  const PhoneNumberField({
    Key? key,
    this.hintText,
    this.validator,
    this.initialValue,
    required this.controller,
    this.isPhoneNumber = false,
    this.onCountryChanged,
    this.isReadOnly = false,
    this.autoValidate = true,
    required this.onChange,
    this.textInputAction,
    this.countries,
    this.keyboardType = TextInputType.text,
    this.textInputType,
  }) : super(key: key);

  @override
  State<PhoneNumberField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      autovalidateMode: widget.autoValidate
          ? AutovalidateMode.always
          : AutovalidateMode.disabled,
      readOnly: widget.isReadOnly,
      onCountryChanged: widget.onCountryChanged,
      textAlignVertical: TextAlignVertical.center,
      countries: ((widget.countries??[]).isNotEmpty)
          ? widget.countries
          : const [
              Country(
                  name: "SA",
                  flag: "🇸🇦",
                  code: "SAU",
                  dialCode: "966",
                  nameTranslations: {
                    "ar": "المملكة العربية السعودية",
                    "en": "Saudi Arabia",
                    "fr": "Arabie Saoudite",
                    "es": "Arabia Saudita"
                  },
                  minLength: 7,
                  maxLength: 10)
            ],
      onChanged: (value) {
        widget.onChange(value.number);
      },
      showCountryFlag: false,
      languageCode: context.locale.toString(),
      controller: widget.controller,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      validator: widget.validator != null
          ? (value) {
              if (value != null) {
                return context
                    .fieldFailureParser(widget.validator!(value.number));
              } else {
                return context.fieldFailureParser(widget.validator!(''));
              }
            }
          : null,
      inputFormatters: [
        FilteringTextInputFormatter.allow((RegExp("[0-9]"))),
      ],
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 1),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }
}
