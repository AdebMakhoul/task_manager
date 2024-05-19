
import 'package:task_manager_app/core/domain/params/show_image_params.dart';
import 'package:task_manager_app/core/domain/presentation/resources/theme/app_material_color.dart';
import 'package:task_manager_app/core/domain/presentation/widgets/svg_icon.dart';
import 'package:task_manager_app/core/presentation/resources/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'dart:convert';

import '../widgets/network_image.dart';

class ShowImagePage extends StatelessWidget {
  const ShowImagePage({Key? key, required this.params}) : super(key: key);
  final ShowImageParams params;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 1.sh,
        width: 1.sw,
        child: Stack(
          children: [
            Center(
              child: params.isBase64
                  ? getImageBase64(params.image)
                  : CustomNetworkImage(
                url: params.image,
                boxFit: BoxFit.contain,
              ),
            ),
            PositionedDirectional(
              start: 20.w,
              top: 40.h,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppMaterialColors.green.shade200),
                child: Center(
                  child: InkWell(
                    onTap: () {
                      context.pop();
                    },
                    child: CustomSvgIcon(
                      Assets.icons.backIcon,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getImageBase64(String image) {
    var imageBase64 = image;
    const Base64Codec base64 = Base64Codec();
    if (imageBase64 == null) return Container();
    var bytes = base64.decode(imageBase64);
    return Image.memory(
      bytes,
      fit: BoxFit.cover,
    );
  }
}
