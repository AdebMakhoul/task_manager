import 'dart:ui';

import 'package:task_manager_app/core/domain/presentation/widgets/svg_icon.dart';
import 'package:task_manager_app/core/presentation/resources/assets.gen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_app/core/utils/extentions.dart';

import '../resources/theme/app_material_color.dart';
import 'custom_container.dart';

class CustomDialog extends StatelessWidget {
  final String? title, descriptions;
  final String? img;
  final VoidCallback? onPress;
  final bool? withOutButton;
  final bool isActiveCancelButton;

  const CustomDialog(
      {Key? key,
      required this.title,
      required this.descriptions,
      this.withOutButton = true,
      this.onPress,
      this.img,
      this.isActiveCancelButton = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: contentBox(context),
      ),
    );
  }

  contentBox(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: context.isDark
            ? AppMaterialColors.black.shade200
            : AppMaterialColors.white,
        borderRadius: BorderRadius.circular(21.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (withOutButton!)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: CustomSvgIcon(
                    Assets.icons.cancelIcon,
                    color: context.isDark
                        ? AppMaterialColors.white
                        : AppMaterialColors.black.shade200,
                    size: 16.w,
                  ),
                ),
              ],
            ),
          if (!withOutButton!)
            Text(
              title!,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontSize: 18.sp, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            descriptions!,
            style: Theme.of(context).textTheme.titleSmall,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 40.h,
          ),
          if (!withOutButton!)
            Row(
              children: [
                if (isActiveCancelButton)
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: CustomContainer(
                          height: 40.h,
                          borderRadius: 8.r,
                          backgroundColor: AppMaterialColors.grey.shade300,
                          child: Center(
                            child: Text(
                              "no".tr(),
                              style: TextStyle(
                                  color: AppMaterialColors.white,
                                  fontSize: 14.sp),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: InkWell(
                      onTap: onPress,
                      child: CustomContainer(
                        height: 40.h,
                        borderRadius: 8.r,
                        backgroundColor: context.theme.primaryColor,
                        child: Center(
                          child: Text(
                            "yes".tr(),
                            style: TextStyle(
                                color: AppMaterialColors.white,
                                fontSize: 14.sp),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
