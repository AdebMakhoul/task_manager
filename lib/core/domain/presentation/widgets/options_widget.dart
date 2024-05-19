// import 'package:task_manager_app/core/domain/presentation/widgets/network_image.dart';
// import 'package:task_manager_app/core/utils/extentions.dart';
// import 'package:task_manager_app/features/Home/data/model/product_details_model.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class OptionWidget extends StatelessWidget {
//   final Option? option;

//   const OptionWidget({super.key, required this.option});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//         onTap: () {
//           // context.push(AppPaths.productDetails.getProductDetails,
//           //   extra: ProductDetailsParams(
//           //    productId: productModel.id,
//           //   ));
//         },
//         child: Container(
//           padding: EdgeInsets.symmetric(horizontal: 5.0.sp, vertical: 10.0.sp),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                 width: 60.w,
//                 height: 60.h,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(12.0.sp)),
//                 ),
//                 child: CustomNetworkImage(
//                   url: option!.imageUrl!,
//                 ),
//               ),
//               SizedBox(
//                 width: 4.h,
//               ),
//              SizedBox(
//                       child: Column(
//                         mainAxisSize: MainAxisSize.max,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SizedBox(
//                               width: 140.w,
//                               child:  Text(
//                                 context.isArabic
//                                     ? option!.arName!
//                                     : option!.enName!,
//                                       style: context.textTheme.headlineMedium!
//                                           .copyWith(
//                                             fontSize: 14.sp,
//                                               color: Colors.black,
//                                               fontWeight: FontWeight.bold),
//                                 maxLines: 2,
//                                 overflow: TextOverflow.ellipsis,
//                                     ),),
//                           Container(
//                             alignment: AlignmentDirectional.centerStart,
//                             child: Text(
//                               '${((option?.price ?? 0).toInt()).toString()} ${"SAR".tr()}',
//                               style: context.textTheme.headlineMedium!.copyWith(
//                                   fontSize: 14.sp,
//                                   color: context.theme.primaryColor,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
                  
//                         ],
//                       ))
//             ],
//           ),
//         ));
//   }
// }
