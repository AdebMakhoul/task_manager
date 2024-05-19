import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  final Widget child;
  final Color baseColor;
  final Color hightlightColor;

  const CustomShimmer({
    Key? key,
    required this.child,
    this.baseColor = Colors.grey,
    this.hightlightColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: hightlightColor,
      child: child,
    );
  }
}
