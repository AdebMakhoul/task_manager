import 'package:task_manager_app/core/presentation/resources/assets.gen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:ui' as ui;

import '../resources/theme/app_color.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController passwordLogin;

  const PasswordField({Key? key, required this.passwordLogin})
      : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextField(
        obscureText: isVisible,
        cursorColor: AppColors.fontGray,
        cursorWidth: 0.5,
        controller: widget.passwordLogin,
        decoration: InputDecoration(
          border: InputBorder.none,
          errorBorder: InputBorder.none,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isVisible = !isVisible;
              });
            },
            icon: Icon(
              isVisible
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: AppColors.fontGray.withOpacity(0.3),
            ),
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(vertical: 0.12.sh),
            child: SvgPicture.asset(Assets.icons.lockSvg),
          ),
          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(
          //     Icons.lock_outline,
          //     color: AppColors.TypingPrimary,
          //   ),
          // ),
        ),
        keyboardType:
            isVisible ? TextInputType.text : TextInputType.visiblePassword,
      ),
    );
  }
}
