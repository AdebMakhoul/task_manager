import 'package:task_manager_app/core/domain/presentation/widgets/svg_icon.dart';
import 'package:task_manager_app/core/presentation/resources/assets.gen.dart';
import 'package:task_manager_app/core/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomEmptyData extends StatelessWidget {
  const CustomEmptyData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomSvgIcon(Assets.images.noResultSearch, size: 220.w),
        SizedBox(
          height: 24.h,
        ),
        Text(
          "No Items Found",
          style: context.textTheme.headline1,
        ),
      ],
    ));
  }
}
