// import 'package:task_manager_app/core/domain/presentation/widgets/network_image.dart';
// import 'package:task_manager_app/core/presentation/resources/assets.gen.dart';
// import 'package:task_manager_app/core/utils/extentions.dart';
// import 'package:task_manager_app/features/Category/domain/params/product_params.dart';
// import 'package:task_manager_app/features/Home/data/model/product_model.dart';
// import 'package:task_manager_app/features/Review/data/model/review_model.dart';
// import 'package:task_manager_app/router.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';

// class CommentWidget extends StatefulWidget {
//   final ReviewModel reviewModel;

//   const CommentWidget({super.key, required this.reviewModel});

//   @override
//   State<CommentWidget> createState() =>
//       _CommentWidgetState();
// }

// class _CommentWidgetState extends State<CommentWidget> {
//   bool readMore = false;

//   @override
//   Widget build(BuildContext context) {
//     return    InkWell(
//         onTap: () {
//           // context.push(AppPaths.productDetails.getProductDetails,
//           //     extra: ProductDetailsParams(
//           //       productId: widget.productModel.id,
//           //     ));
//         },
//         child: Container(
//           padding: EdgeInsets.symmetric(horizontal: 30.0.sp, vertical: 10.0.sp),
//           child: Column(children: [

// Row(
//  // crossAxisAlignment: CrossAxisAlignment.start,
//   children: [
//     SizedBox(
//       width: 35.w,
//       height: 35.h,
//       // ignore: unnecessary_null_comparison
//       child: widget.reviewModel.reviewer!.imageUrl ==null?
//       CircleAvatar(
//                       backgroundColor: Colors.white,
//                       backgroundImage:AssetImage(
                        
//                               Assets.images.profilePhoto.path,
//                             ),
                            
//                     ):
//                      ClipRRect(
//                           borderRadius: const BorderRadius.only(
//                             topLeft: Radius.circular(16.0),
//                             topRight: Radius.circular(16.0),
//                           ),
//                           child: Image.network(
//                             widget.reviewModel.reviewer!.imageUrl.toString(),
//                             height: 140.h,
//                             width: 140.w,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//     ),
//     SizedBox(width: 7.w,),
//                   Expanded(
//                     child: Text(
//                       context.isArabic
//                           ? widget.reviewModel.reviewer!.name!
//                           : widget.reviewModel.reviewer!.name!,
//                       style: context.textTheme.bodySmall!.copyWith(
//                         color: Colors.black,
//                         fontSize: 11.sp
//                       ),
//                     ),
//                   ),
//   ],
// ),
// Row(
//   children: [
//        RatingBarIndicator(
//                                             rating: widget.reviewModel.rate!.toDouble(),
//                                             itemCount: 5,
//                                             itemSize: 18.0,
//                                             itemBuilder: (context, _) => const Icon(
//                                               Icons.star,
//                                               color: Colors.amber,
//                                             )),
//                                             SizedBox(width: 7.w,),
//                   Expanded(
//                     child: Text(
//                       context.isArabic
//                           ? widget.reviewModel.creationTime!.substring(0,10)
//                           : widget.reviewModel.creationTime!.substring(0,10),
//                        style: context.textTheme.bodySmall!.copyWith(
//                           color: Colors.grey,
//                           fontSize: 11.sp
//                         ),
//                     ),
//                   ),
//   ],
// ),
// Row(
//   children: [
//                   Expanded(
//                     child: Text(
//                       context.isArabic
//                           ? widget.reviewModel.comment!
//                           : widget.reviewModel.comment!,
//                      style: context.textTheme.bodySmall!.copyWith(
//                           color: Colors.black,
//                           fontSize: 11.sp
//                         ),
//                     ),
//                   ),
//   ],
// )

//           ]),
//         ));
// //     return InkWell(
// //         onTap: () {
// //           // context.push(AppPaths.productDetails.getProductDetails,
// //           //     extra: ProductDetailsParams(
// //           //       productId: widget.reviewModel.id,
// //           //     ));
// //         },
// //         child: Container(
// //           padding: EdgeInsets.symmetric(horizontal: 5.0.sp, vertical: 10.0.sp),
// //           child: Row(
// //             crossAxisAlignment: CrossAxisAlignment.center,
// //             children: [
// //          widget.reviewModel.isNotEmpty
// //           ? ListView.builder(
// //               scrollDirection: Axis.vertical,
// //               padding: EdgeInsets.zero,
// //               physics: const NeverScrollableScrollPhysics(),
// //               shrinkWrap: true,
// //               itemCount: widget.reviewModel.length,
// //               itemBuilder: (context, index) {
// //                 return InkWell(
// //         onTap: () {
// //           // context.push(AppPaths.productDetails.getProductDetails,
// //           //     extra: ProductDetailsParams(
// //           //       productId: widget.productModel.id,
// //           //     ));
// //         },
// //         child: Container(
// //           padding: EdgeInsets.symmetric(horizontal: 30.0.sp, vertical: 10.0.sp),
// //           child: Column(children: [

// // Row(
// //  // crossAxisAlignment: CrossAxisAlignment.start,
// //   children: [
// //     SizedBox(
// //       width: 35.w,
// //       height: 35.h,
// //       child: CircleAvatar(
// //                       backgroundColor: Colors.white,
// //                       backgroundImage:AssetImage(
                        
// //                               Assets.images.defaultShop.path,
// //                             ),
                            
// //                     ),
// //     ),
// //     SizedBox(width: 7.w,),
// //                   Expanded(
// //                     child: Text(
// //                       context.isArabic
// //                           ? 'shopDetailsModel!.arShopName.toStrinddg()'
// //                           : 'shopDetailsModel!.enSdddng()',
// //                       style: context.textTheme.bodySmall!.copyWith(
// //                         color: Colors.black,
// //                         fontSize: 11.sp
// //                       ),
// //                     ),
// //                   ),
// //   ],
// // ),
// // Row(
// //   children: [
// //        RatingBarIndicator(
// //                                             rating: 5,
// //                                             itemCount: 5,
// //                                             itemSize: 18.0,
// //                                             itemBuilder: (context, _) => const Icon(
// //                                               Icons.star,
// //                                               color: Colors.amber,
// //                                             )),
// //                                             SizedBox(width: 7.w,),
// //                   Expanded(
// //                     child: Text(
// //                       context.isArabic
// //                           ? 'shopDetailsModel!.arShopName.toString()'
// //                           : '15/11/2032',
// //                        style: context.textTheme.bodySmall!.copyWith(
// //                           color: Colors.grey,
// //                           fontSize: 11.sp
// //                         ),
// //                     ),
// //                   ),
// //   ],
// // ),
// // Row(
// //   children: [
// //                   Expanded(
// //                     child: Text(
// //                       context.isArabic
// //                           ? 'shopDetailsModel!.arShopName.toString()shopDetailsModel!.arShopName.toString()shopDetailsModel!.arShopName.toString()shopDetailsModel!.arShopName.toString()shopDetailsModel!.arShopName.toString()shopDetailsModel!.arShopName.toString()shopDetailsModel!.arShopName.toString()shopDetailsModel!.arShopName.toString()'
// //                           : 'shopDetailsModel!.enShopName.toString()shopDetailsModel!.arShopName.toString()shopDetailsModel!.arShopName.toString()shopDetailsModel!.arShopName.toString()shopDetailsModel!.arShopName.toString()shopDetailsModel!.arShopName.toString()shopDetailsModel!.arShopName.toString()shopDetailsModel!.arShopName.toString()',
// //                      style: context.textTheme.bodySmall!.copyWith(
// //                           color: Colors.black,
// //                           fontSize: 11.sp
// //                         ),
// //                     ),
// //                   ),
// //   ],
// // )

// //           ]),
// //         ));

// //               })
// //           : Row(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 SizedBox(
// //                     width: MediaQuery.of(context).size.width / 2,
// //                     height: 170.h,
// //                     child: Center(
// //                         child: Text(
// //                       "No Data".tr(),
// //                       style: context.textTheme.displayMedium,
// //                     ))),
// //               ],
// //             )
                 
// //             ],
// //           ),
// //         ));
 
//   }
// }
