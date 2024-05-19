import 'package:task_manager_app/core/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/failures/field_failure/field_failure.dart';
import '../resources/theme/app_material_color.dart';
import 'custom_app_text.dart';

class CustomFormField extends StatefulWidget {
  const CustomFormField({
    Key? key,
    required this.hintText,
    this.title,
    this.initValue,
    this.prefixIcon,
    this.prefix,
    this.suffixIcon,
    this.suffix,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.validator,
    this.autoValidate = true,
    this.onChange,
    this.onTap,
    this.textInputAction,
    this.fillColor,
    this.textInputType,
    this.suffixText,
    this.readOnly = false,
    this.hintStyle,
    this.maxLines = 1,
    this.inputFormatters,
    this.maxLength,
    this.enable = true, this.focusNode, this.onFieldSubmitted,
  }) : super(key: key);

  final bool autoValidate;
  final TextInputType? textInputType;
  final int maxLines;
  final String? initValue;
  final Widget? prefix;
  final Widget? suffix;
  final String hintText;
  final String? title;
  final Widget? suffixIcon;
  final String? suffixText;
  final Widget? prefixIcon;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final Function(String)? onChange;
  final Function(String)? onFieldSubmitted;
  final FieldFailure? Function(String)? validator;
  final bool isPassword;
  final Function()? onTap;
  final bool readOnly;
  final Color? fillColor;
  final TextInputAction? textInputAction;
  final TextStyle? hintStyle;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final bool? enable;
  final FocusNode? focusNode;

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.title == null
            ? Container()
            : Column(
                children: [
                  CustomText.p14(
                    widget.title!,
                    color: AppMaterialColors.grey.shade400,
                  ),
                  SizedBox(
                    height: 5.h,
                  )
                ],
              ),
        TextFormField(
          onFieldSubmitted: widget.onFieldSubmitted,
          initialValue: widget.initValue,
          onTap: widget.onTap,
          enabled: widget.enable,
          focusNode: widget.focusNode,
          maxLines: widget.maxLines,
          validator: widget.validator != null
              ? (value) {
                  return context
                      .fieldFailureParser(widget.validator!(value ?? ''));
                }
              : null,
          readOnly: widget.readOnly,
          onChanged: widget.onChange,
          keyboardType: widget.keyboardType,
          controller: widget.controller,
          autovalidateMode: widget.autoValidate
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          obscureText: widget.isPassword,
          inputFormatters: widget.inputFormatters,
          maxLength: widget.maxLength,
          decoration: InputDecoration(
            hintText: widget.hintText,
            fillColor: widget.fillColor,
            hintStyle: widget.hintStyle,
            suffixText: widget.suffixText,
            suffixIcon: widget.suffix,
            prefixIcon: widget.prefixIcon,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 14.w, vertical: 11),
            prefixIconConstraints: widget.prefixIcon == null
                ? null
                : BoxConstraints(maxWidth: 40.w),

          ),
        ),
      ],
    );
  }
/*
  Widget? getSuffixIcon() {
    if (widget.suffixIcon != null) {
      return widget.suffixIcon;
    }
    if (widget.isPassword) {
      return IconButton(
        icon: widget.showPassword
            ? CustomSvgIcon(Assets.icons.lockIcon)
            : CustomSvgIcon(Assets.icons.lockIcon),
        onPressed: () {
          {
            setState(() {
              widget.showPassword = (!showPassword);
            });
          }
        },
      );
    }
    return null;
  }*/
}
