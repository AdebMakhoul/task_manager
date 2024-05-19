import 'package:task_manager_app/core/domain/presentation/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShimmerProductCardWidget extends StatelessWidget {
  const ShimmerProductCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomShimmer(
          baseColor: Colors.grey.shade300,
          hightlightColor: Colors.grey.shade200.withOpacity(0.5),
          child: Container(
            width: 140.w,
            height: 140.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.r),
                  topRight: Radius.circular(12.r)),
            ),
          ),
        ),
        const SizedBox(height: 8),
        CustomShimmer(
          baseColor: Colors.grey.shade300,
          hightlightColor: Colors.grey.shade200.withOpacity(0.5),
          child: Container(
            width: 140.w,
            height: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
          ),
        ),
        const SizedBox(height: 8),
        CustomShimmer(
          baseColor: Colors.grey.shade300,
          hightlightColor: Colors.grey.shade200.withOpacity(0.5),
          child: Container(
            width: 140.w,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
          ),
        ),
      ],
    );
  }
}
