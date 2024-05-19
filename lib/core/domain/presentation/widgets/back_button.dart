import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBackButton extends StatelessWidget {
  final void Function()? onPressed;

  const CustomBackButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pop();
      },
      child: Platform.isIOS
          ? const Icon(Icons.arrow_back_ios)
          : const Icon(Icons.arrow_back),
    );
  }
}
