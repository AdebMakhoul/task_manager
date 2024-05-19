// import 'package:bialah_client/core/utils/extentions.dart';
// import 'package:bialah_client/features/Category/domain/params/product_params.dart';
// import 'package:bialah_client/features/Home/data/model/product_model.dart';
// import 'package:bialah_client/router.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';

// import 'network_image.dart';

// class ProductVerticalWidget extends StatefulWidget {
//   final ProductModel productModel;

//   const ProductVerticalWidget({super.key, required this.productModel});

//   @override
//   State<ProductVerticalWidget> createState() => _ProductVerticalWidgetState();
// }

// class _ProductVerticalWidgetState extends State<ProductVerticalWidget> {
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
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(
//                 16.0,
//               ),
//             ),
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 4.0.sp),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Stack(
//                     children: [
//                       Stack(
//                         children: [
//                           CustomNetworkImage(
//                             url: widget.productModel.imageUrl ?? '',
//                             height: 140.h,
//                             width: 140.w,
//                             borderRadius: const BorderRadius.only(
//                                 topLeft: Radius.circular(12),
//                                 topRight: Radius.circular(12)),
//                           ),
//                           if (widget.productModel.quantity == 0 ||
//                               !(widget.productModel.shop?.isAcceptingOrders ??
//                                   widget.productModel.isShopAcceptingOrders!) ||
//                               !(widget.productModel.shop?.inOrderPolicyTime ??
//                                   widget.productModel.inOrderPolicyTime!))
//                             Container(
//                               height: 140.h,
//                               width: 140.w,
//                               decoration: const BoxDecoration(
//                                 borderRadius: BorderRadius.only(
//                                     topLeft: Radius.circular(12),
//                                     topRight: Radius.circular(12)),
//                               ),
//                               child: Align(
//                                 alignment: Alignment.center,
//                                 child: Container(
//                                   width: 70.w,
//                                   decoration: BoxDecoration(
//                                     color: Colors.black.withOpacity(0.5),
//                                     borderRadius: BorderRadius.only(
//                                         topLeft: Radius.circular(4.r),
//                                         topRight: Radius.circular(4.r)),
//                                   ),
//                                   child: Text(
//                                     (widget.productModel.quantity == 0)
//                                         ? "out of stock".tr()
//                                         : (!(widget.productModel.shop
//                                                     ?.isAcceptingOrders ??
//                                                 widget.productModel
//                                                     .isShopAcceptingOrders!))
//                                             ? "The request is stopped".tr()
//                                             : '${"Order before".tr()} ${widget.productModel.shop?.orderPolicy?.durationInHours ?? ''} ${"hour".tr()}',
//                                     textAlign: TextAlign.center,
//                                     style: context.textTheme.bodyLarge!
//                                         .copyWith(color: Colors.white, shadows: [
//                                       const BoxShadow(
//                                           color: Colors.black,
//                                           blurRadius: 7,
//                                           spreadRadius: 5,
//                                           offset: Offset(0, 3))
//                                     ]),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                         ],
//                       ),
//                       if (widget.productModel.offerPrice != null)
//                         Positioned(
//                           top: 0,
//                           left: 0,
//                           child: Container(
//                             padding: const EdgeInsets.symmetric(
//                                 vertical: 4, horizontal: 6),
//                             height: 40.h,
//                             width: 70.w,
//                             decoration: const BoxDecoration(
//                                 color: Color(0xFF5B63AD),
//                                 borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(27),
//                                   bottomRight: Radius.circular(100),
//                                 ) // green shaped
//                                 ),
//                             child: Center(
//                               child: Text(
//                                 '${(widget.productModel.offerDiscountPercentage ?? 0).formatAsInteger()} %',
//                                 style: context.textTheme.headlineMedium!
//                                     .copyWith(
//                                         color: Colors.white, fontSize: 14.sp),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                           ),
//                         )
//                     ],
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           context.isArabic
//                               ? widget.productModel.arName.toString()
//                               : widget.productModel.enName.toString(),
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           style: context.textTheme.headlineSmall!.copyWith(
//                               color: Colors.black, fontWeight: FontWeight.bold),
//                         ),
//                         const SizedBox(
//                           height: 6.0,
//                         ),
//                         Text(
//                           context.isArabic
//                               ? widget.productModel.description.toString()
//                               : widget.productModel.description.toString(),
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         const SizedBox(
//                           height: 8.0,
//                         ),
//                         if (widget.productModel.shop != null)
//                           Container(
//                               alignment: AlignmentDirectional.centerStart,
//                               width: 140.w,
//                               child: Row(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   SizedBox(
//                                     width: 12.w,
//                                     height: 12.h,
//                                     child: CircleAvatar(
//                                       backgroundColor: Colors.white,
//                                       backgroundImage: NetworkImage(widget
//                                           .productModel.shop!.logoUrl
//                                           .toString()),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 6.w,
//                                   ),
//                                   Expanded(
//                                     child: SizedBox(
//                                       child: Text(
//                                         context.isArabic
//                                             ? widget.productModel.shop!.arName
//                                                 .toString()
//                                             : widget.productModel.shop!.enName
//                                                 .toString(),
//                                         style: context.textTheme.headlineMedium!
//                                             .copyWith(
//                                                 fontSize: 12.sp,
//                                                 color: context.theme.primaryColor,
//                                                 fontWeight: FontWeight.bold),
//                                         maxLines: 1,
//                                         overflow: TextOverflow.ellipsis,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               )),
//                         widget.productModel.offerPrice != null
//                             ? Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Expanded(
//                                     child: Text(
//                                       '${widget.productModel.offerPrice!.formatAsInteger()} ${'SAR'.tr()}',
//                                       style: context.textTheme.headlineMedium!
//                                           .copyWith(
//                                               color: context.theme.primaryColor,
//                                               fontWeight: FontWeight.bold),
//                                       maxLines: 1,
//                                       overflow: TextOverflow.ellipsis,
//                                     ),
//                                   ),
//                                   Text(
//                                     '${widget.productModel.price!.formatAsInteger()} ${'SAR'.tr()}',
//                                     style: context.textTheme.headlineMedium!
//                                         .copyWith(
//                                             color: Colors.grey,
//                                             fontSize: 12.sp,
//                                             decoration:
//                                                 TextDecoration.lineThrough),
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                   ),
//                                 ],
//                               )
//                             : Text(
//                                 '${widget.productModel.price!.formatAsInteger()} ${'SAR'.tr()}',
//                                 style: context.textTheme.headlineMedium!
//                                     .copyWith(
//                                         color: context.theme.primaryColor,
//                                         fontWeight: FontWeight.bold),
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             )));
//   }
// }
