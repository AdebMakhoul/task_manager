import 'package:task_manager_app/core/presentation/resources/assets.gen.dart';
import 'package:task_manager_app/core/utils/extentions.dart';
import 'package:task_manager_app/router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../resources/theme/app_material_color.dart';
import 'custom_container.dart';

class NotAuthWidget extends StatelessWidget {
  const NotAuthWidget({Key? key, required this.content}) : super(key: key);
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          Image.asset(
            Assets.icons.bialah.path,
            height: 160.h,
          ),
          SizedBox(
            height: 30.h,
          ),
          DefaultTextStyle(
              style: context.textTheme.displayLarge!, child: content),
          SizedBox(
            height: 50.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: CustomContainer(
              width: MediaQuery.of(context).size.width,
              borderRadius: 8.r,
              borderColor: AppMaterialColors.grey.shade400,
              child: TextButton(
                child: Text(
                  "sign_in".tr(),
                  style: context.textTheme.bodyLarge,
                ),
                onPressed: () {
                  context.push(AppPaths.auth.welcomeScreen);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
