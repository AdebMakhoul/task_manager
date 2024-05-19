import 'package:task_manager_app/core/utils/extentions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage(
      {Key? key,
      required this.url,
      this.boxFit,
      this.borderRadius ,
      this.height, this.width, this.colorFilter

      })
      : super(key: key);
  final String url;
  final BoxFit? boxFit;
  final BorderRadius? borderRadius;
  final double? height;
  final double? width;
  final ColorFilter? colorFilter;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: boxFit ?? BoxFit.cover,
            colorFilter:colorFilter,

          ),
          borderRadius: borderRadius??BorderRadius.circular(12),
        ),
      ),
      errorWidget: (context, error, stackTrace) {
        return Container(
          height: height,
          width: width,
          color: Colors.grey.withOpacity(0.3),
          child: const Center(child: Icon(Icons.image)),
        );
      },
      placeholder: (context, loadingProgress) {
        return SizedBox(
          height: height,
          width: width,
          child: Center(
            child: CircularProgressIndicator(color: context.theme.primaryColor),
          ),
        );
      },
      fit: boxFit ?? BoxFit.cover,
    );
  }
}
