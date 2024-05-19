// import 'package:task_manager_app/core/domain/presentation/widgets/network_image.dart';
// import 'package:task_manager_app/core/utils/extentions.dart';
// import 'package:task_manager_app/features/Category/domain/params/product_params.dart';
// import 'package:task_manager_app/features/Home/data/model/product_model.dart';
// import 'package:task_manager_app/router.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';

// class ProductHorizontalWidget extends StatefulWidget {
//   final ProductModel productModel;
//   final bool isShopAcceptingOrders;
//   final bool inOrderPolicyTime;

//   const ProductHorizontalWidget(
//       {super.key,
//       required this.productModel,
//       required this.isShopAcceptingOrders,
//       required this.inOrderPolicyTime});

//   @override
//   State<ProductHorizontalWidget> createState() =>
//       _ProductHorizontalWidgetState();
// }

// class _ProductHorizontalWidgetState extends State<ProductHorizontalWidget> {
//   bool readMore = false;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//         onTap: () {
//           context.push(AppPaths.productDetails.getProductDetails,
//               extra: ProductDetailsParams(
//                 productId: widget.productModel.id,
//               ));
//         },
//         child: Container(
//           padding: EdgeInsets.symmetric(horizontal: 5.0.sp, vertical: 10.0.sp),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Stack(
//                 children: [
//                   Stack(
//                     children: [
//                       CustomNetworkImage(
//                         url: widget.productModel.imageUrl ?? '',
//                         width: 150.w,
//                         height: 150.h,
//                         borderRadius: const BorderRadius.only(
//                             topLeft: Radius.circular(12),
//                             topRight: Radius.circular(12)),
//                       ),
//                       if (widget.productModel.quantity == 0 ||
//                           !widget.productModel.isShopAcceptingOrders! ||
//                           !widget.productModel.inOrderPolicyTime!)
//                         Container(
//                           height: 140.h,
//                           width: 140.w,
//                           decoration: const BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(12),
//                                 topRight: Radius.circular(12)),
//                           ),
//                           child: Align(
//                             alignment: Alignment.center,
//                             child: Container(
//                               width: 70.w,
//                               decoration: BoxDecoration(
//                                 color: Colors.black.withOpacity(0.5),
//                                 borderRadius: BorderRadius.only(
//                                     topLeft: Radius.circular(4.r),
//                                     topRight: Radius.circular(4.r)),
//                               ),
//                               child: Text(
//                                 (widget.productModel.quantity == 0)
//                                     ? "out of stock".tr()
//                                     : (!(widget.isShopAcceptingOrders))
//                                         ? "The request is stopped".tr()
//                                         : '${"Order before".tr()} ${widget.productModel.shop?.orderPolicy?.durationInHours ?? ''} ${"hour".tr()}',
//                                 textAlign: TextAlign.center,
//                                 style: context.textTheme.bodyLarge!
//                                     .copyWith(color: Colors.white, shadows: [
//                                   const BoxShadow(
//                                       color: Colors.black,
//                                       blurRadius: 7,
//                                       spreadRadius: 5,
//                                       offset: Offset(0, 3))
//                                 ]),
//                               ),
//                             ),
//                           ),
//                         ),
//                     ],
//                   ),
//                   if (widget.productModel.offerPrice != null)
//                     Positioned(
//                       top: 0,
//                       left: 0,
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 4, horizontal: 14),
//                         height: 30.h,
//                         width: 70.w,
//                         decoration: const BoxDecoration(
//                             color: Color(0xFF5B63AD),
//                             borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(35),
//                               bottomRight: Radius.circular(100),
//                             ) // green shaped
//                             ),
//                         child: Center(
//                           child: Text(
//                             '${((widget.productModel.offerDiscountPercentage ?? 0).toDouble()).formatAsInteger()} %',
//                             style: context.textTheme.headlineMedium!
//                                 .copyWith(color: Colors.white, fontSize: 14.sp),
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                       ),
//                     )
//                 ],
//               ),
//               SizedBox(
//                 width: 6.w,
//               ),
//               SizedBox(
//                   height: 150.h,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         width: 140.w,
//                         child: Text(
//                           context.isArabic
//                               ? widget.productModel.arName!
//                               : widget.productModel.enName!,
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           style: context.textTheme.headlineMedium!.copyWith(
//                               fontSize: 14.sp,
//                               color: Colors.black,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 1.h,
//                       ),

//                       SizedBox(
//                         width: 140.w,
//                         child: Text(
//                           context.isArabic
//                               ? widget.productModel.description!
//                               : widget.productModel.description!,
//                           maxLines: readMore ? 10 : 1,
//                           style: context.textTheme.bodyMedium!
//                               .copyWith(color: Colors.black, fontSize: 12.sp),
//                         ),
//                       ),

//                       // SizedBox(
//                       //     width: 140.w,
//                       //     child:  Text(
//                       //           context.isArabic
//                       //               ? productModel.description!
//                       //               : productModel.description!,
//                       // maxLines: 3,
//                       // overflow: TextOverflow.ellipsis,
//                       //           style: context.textTheme.bodyMedium!
//                       //               .copyWith(color: Colors.black,fontSize: 12.sp),
//                       //         ),),
//                       SizedBox(
//                         height: 1.h,
//                       ),
//                       Container(
//                         width: 140.w,
//                         alignment: AlignmentDirectional.centerStart,
//                         child: widget.productModel.offerPrice != null
//                             ? Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     '${widget.productModel.offerPrice!.formatAsInteger()} ${'SAR'.tr()}',
//                                     style: context.textTheme.headlineMedium!
//                                         .copyWith(
//                                             color: context.theme.primaryColor,
//                                             fontSize: 14.sp,
//                                             fontWeight: FontWeight.bold),
//                                   ),
//                                   Text(
//                                     '${widget.productModel.price!.formatAsInteger()} ${'SAR'.tr()}',
//                                     style: context.textTheme.headlineMedium!
//                                         .copyWith(
//                                             color: Colors.grey,
//                                             fontSize: 12.sp,
//                                             decoration:
//                                                 TextDecoration.lineThrough),
//                                   ),
//                                 ],
//                               )
//                             : Text(
//                                 '${widget.productModel.price!.formatAsInteger()} ${'SAR'.tr()}',
//                                 style: context.textTheme.headlineMedium!
//                                     .copyWith(
//                                         color: context.theme.primaryColor,
//                                         fontSize: 14.sp,
//                                         fontWeight: FontWeight.bold),
//                               ),
//                       ),

//                       Container(
//                           width: 140.w,
//                           alignment: AlignmentDirectional.center,
//                           child: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               SizedBox(
//                                 width: 12.w,
//                                 height: 12.h,
//                                 child: CircleAvatar(
//                                   backgroundColor: Colors.white,
//                                   backgroundImage: NetworkImage(widget
//                                       .productModel.shop!.logoUrl
//                                       .toString()),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 6.w,
//                               ),
//                               SizedBox(
//                                 width: 120.w,
//                                 child: Text(
//                                   context.isArabic
//                                       ? widget.productModel.shop!.arName
//                                           .toString()
//                                       : widget.productModel.shop!.enName
//                                           .toString(),
//                                   style: context.textTheme.headlineMedium!
//                                       .copyWith(
//                                           fontSize: 16.sp,
//                                           color: context.theme.primaryColor,
//                                           fontWeight: FontWeight.bold),
//                                   maxLines: 1,
//                                   overflow: TextOverflow.ellipsis,
//                                 ),
//                               ),
//                             ],
//                           )),
//                       SizedBox(
//                         width: 1.h,
//                       ),
//                       Container(
//                           width: 140,
//                           alignment: AlignmentDirectional.centerStart,
//                           child: RatingBarIndicator(
//                               rating: widget.productModel.rate!.toDouble(),
//                               itemCount: 5,
//                               itemSize: 20.0,
//                               itemBuilder: (context, _) => const Icon(
//                                     Icons.star,
//                                     color: Colors.amber,
//                                   )))
//                     ],
//                   ))
//             ],
//           ),
//         ));
//   }
// }
