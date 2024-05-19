// import 'package:bialah_client/core/domain/presentation/widgets/rating_widget.dart';
// import 'package:bialah_client/core/utils/extentions.dart';
// import 'package:bialah_client/features/Review/presentation/cubits/review_cubit.dart';
// import 'package:bialah_client/features/Shop%20Details/data/model/shop_details_model.dart';
// import 'package:bialah_client/router.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';

// class RatingSummaryWidget extends StatelessWidget {
//   final ShopDetailsModel? shopDetailsModel;
//   final bool? fromRatings;
//   final ReviewCubit? reviewCubit;
//   final bool? isReviewedByMe;

//    RatingSummaryWidget(
//       {super.key, required this.shopDetailsModel, this.fromRatings = false,this.reviewCubit,this.isReviewedByMe});
//  late int total=0;
 
//   @override
//   Widget build(BuildContext context) {
//     for(int i=0;i<shopDetailsModel!.reviews!.length;i++){
//       total += shopDetailsModel!.reviews![i].message;
//     }
//     return Padding(
//         padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
//         child: Column(children: [
//           Row(
//             children: [
//               Text(
//                 'Rates and reviews'.tr(),
//                 style: context.textTheme.displaySmall,
//               )
//             ],
//           ),
//           Column(children: [
//             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//               SizedBox(
//                 height: 120.h,
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Text(
//                           shopDetailsModel!.rateAverage.toString(),
//                           style:
//                               TextStyle(fontSize: 48, color: Colors.lightBlue),
//                         ),
//                         Text(
//                           'Rates average:'.tr(),
//                           style: TextStyle(fontSize: 7, color: Colors.black),
//                         ),
//                       ],
//                     ),
//                     RatingBarIndicator(
//                         rating: shopDetailsModel!.rateAverage!.toDouble(),
//                         itemCount: 5,
//                         itemSize: 20.0,
//                         itemBuilder: (context, _) => const Icon(
//                               Icons.star,
//                               color: Colors.amber,
//                             )),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 120.h,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                       height: 20.h,
//                     ),
//                     chartRow(
//                         context, '5', shopDetailsModel!.reviews![4].message,total),
//                     chartRow(
//                         context, '4', shopDetailsModel!.reviews![3].message,total),
//                     chartRow(
//                         context, '3', shopDetailsModel!.reviews![2].message,total),
//                     chartRow(
//                         context, '2', shopDetailsModel!.reviews![1].message,total),
//                     chartRow(
//                         context, '1', shopDetailsModel!.reviews![0].message,total),
//                   ],
//                 ),
//               )
//             ]),
//             fromRatings == false
//                 ? InkWell(
//                     onTap: () {
//                       context.push(AppPaths.shop.review,
//                           extra: shopDetailsModel);
//                     },
//                     child: Padding(
//                       padding: EdgeInsets.only(left: 10, right: 10),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Text(
//                             "View all comments".tr(),
//                             style: TextStyle(
//                                 fontSize: 12, color: Colors.lightBlue),
//                           ),
//                           Icon(Icons.arrow_forward,
//                               size: 12.0.sp, color: Colors.lightBlue)
//                         ],
//                       ),
//                     ))
//                 : isReviewedByMe == false? InkWell(

//     onTap: () async {
//     bool? check = await context.push(AppPaths.shop.reviewCreate,
//     extra: shopDetailsModel);

//     if(check ?? false){
//     reviewCubit!..getReview(
//     refId: shopDetailsModel!.id!,
//     refType: 0
//     );
//     }

//                     },
//                     child: Padding(
//                       padding: EdgeInsets.only(left: 10, right: 10),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Text(
//                             "Rate this shop!".tr(),
//                             style: TextStyle(
//                                 fontSize: 12, color: Colors.lightBlue),
//                           ),
//                           Icon(Icons.arrow_forward,
//                               size: 12.0.sp, color: Colors.lightBlue)
//                         ],
//                       ),
//                     )):Container()
//           ]),
//         ]));
//   }
// }
