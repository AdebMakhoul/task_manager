// import 'dart:io';
// import 'dart:ui';

// import 'package:task_manager_app/core/domain/presentation/widgets/CustomButton.dart';
// import 'package:task_manager_app/core/domain/presentation/widgets/row_info.dart';
// import 'package:task_manager_app/core/utils/extentions.dart';
// import 'package:task_manager_app/features/Profile/data/model/address_model.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../resources/theme/app_gradients.dart';
// import '../../resources/theme/app_material_color.dart';

// abstract class BottomSheetHelper {
//   static Future showDeliveryFeeBottomSheet({
//     required BuildContext context,
//     required double subTotal,
//     required double deliveryFee,
//     required double discountAmount,
//     required VoidCallback onPlaceOrder,
//   }) async {
//     await showModalBottomSheet(
//       context: context,
//       elevation: 30.0,
//       backgroundColor: context.theme.bottomSheetTheme.backgroundColor,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(35.0),
//           topRight: Radius.circular(35.0),
//         ),
//       ),
//       builder: (_) {
//         return SafeArea(
//           child: DraggableScrollableSheet(
//             initialChildSize: 0.99,
//             builder: (_, controller) {
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Center(
//                     child: TextButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       child: const SizedBox(
//                         width: 130,
//                         child: Divider(
//                           thickness: 1,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Column(
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.all(20),
//                         child: Text(
//                           'otc_select_time_page.payment_summary'.tr(),
//                           style: context.textTheme.headlineSmall,
//                         ),
//                       ),
//                       RowInfoWidget(
//                         rowKey: 'otc_select_time_page.sub_total'.tr(),
//                         rowValue: subTotal.toStringAsFixed(2),
//                         // style: ThemeStyle.blackNormal,
//                       ),
//                       const SizedBox(height: 10),
//                       RowInfoWidget(
//                         rowKey: 'otc_select_time_page.delivery_fee'.tr(),
//                         rowValue: deliveryFee.toStringAsFixed(2),
//                         // style: ThemeStyle.blackNormal,
//                       ),
//                       const SizedBox(height: 10),
//                       RowInfoWidget(
//                         rowKey: 'otc_select_time_page.discount_amount'.tr(),
//                         rowValue: discountAmount.toString(),
//                         // style: ThemeStyle.blackNormal,
//                       ),
//                       const SizedBox(height: 10),
//                       RowInfoWidget(
//                         rowKey: 'otc_select_time_page.total_bill'.tr(),
//                         rowValue: ((subTotal + deliveryFee) - discountAmount)
//                             .toStringAsFixed(2),
//                         style: context.textTheme.headlineSmall,
//                         // style: ThemeStyle.blackSemiBold15,
//                       ),
//                       SizedBox(height: 40.h),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: CustomButton(
//                           width: 388.w,
//                           // withGradient: true,
//                           title: "otc_select_time_page.place_order".tr(),
//                           buttonColor: AppMaterialColors.green[200]!,
//                           onClick: onPlaceOrder,
//                           fontColor: Colors.white,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               );
//             },
//           ),
//         );
//       },
//     );
//   }

//   static Future<File?> showPickPhotoBottomSheet(
//       {required BuildContext context,
//       required String title,
//       required Function pickFromCamera,
//       required Function pickFromGallery}) async {
//     await showModalBottomSheet(
//         context: context,
//         barrierColor: Colors.black26,
//         backgroundColor: Colors.black26,
//         elevation: 20,
//         isDismissible: true,
//         enableDrag: true,
//         isScrollControlled: true,
//         // gives rounded corner to modal bottom screen
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(24.0),
//         ),
//         builder: (context) => Container(
//               height: 285.h,
//               width: 1.sw,
//               decoration: BoxDecoration(
//                 color: context.theme.colorScheme.background,
//                 borderRadius: const BorderRadius.only(
//                   topLeft: Radius.circular(24),
//                   topRight: Radius.circular(24),
//                 ),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 // mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   SizedBox(
//                     height: 15.h,
//                   ),
//                   Container(
//                     alignment: Alignment.center,
//                     width: 50.w,
//                     height: 5,
//                     decoration: BoxDecoration(
//                       color: Colors.grey,
//                       borderRadius: BorderRadius.circular(18),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 25.h,
//                   ),
//                   Center(
//                     child: Text(
//                       title,
//                       style: context.textTheme.bodyMedium,
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 16.h,
//                   ),
//                   InkWell(
//                     onTap: () async {
//                       pickFromCamera();
//                     },
//                     child: Container(
//                       width: 308.w,
//                       height: 54.h,
//                       decoration: BoxDecoration(
//                           gradient: AppGradients.greenGradient,
//                           borderRadius: BorderRadius.circular(27)),
//                       child: Center(
//                           child: Text(
//                         "rate.Choose_from_camera".tr(),
//                         style: context.textTheme.headlineSmall!
//                             .copyWith(color: Colors.white),
//                       )),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 17,
//                   ),
//                   SizedBox(
//                       width: 308.w,
//                       child: OutlinedButton(
//                           onPressed: () async {
//                             Navigator.pop(context);
//                             pickFromGallery();
//                           },
//                           child: Center(
//                               child: Text(
//                             "rate.Choose_from_gallery".tr(),
//                           ))))
//                 ],
//               ),
//             ));
//   }

//   /*static showAddressBottomSheet(
//     BuildContext context,
//   ) {
//     final addressCubit = BlocProvider.of<AddressCubit>(context);
//     showModalBottomSheet(
//         context: context,
//         barrierColor: Colors.black26,
//         backgroundColor: Colors.black26,
//         elevation: 20,
//         isDismissible: true,
//         enableDrag: true,
//         isScrollControlled: true,

//         // gives rounded corner to modal bottom screen
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20.0),
//         ),
//         builder: (context) => Container(
//               decoration: BoxDecoration(
//                   color: context.theme.backgroundColor,
//                   borderRadius: BorderRadius.circular(20)),
//               width: 1.sw,
//               constraints: BoxConstraints(
//                 maxHeight: 0.6.sh,
//               ),
//               padding: EdgeInsets.symmetric(horizontal: 20.w),
//               child: BlocConsumer<AddressCubit, AddressState>(
//                 bloc: addressCubit,
//                 listener: (context, state) {},
//                 builder: (contex, state) => SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         height: 22.h,
//                       ),
//                       Align(
//                         alignment: Alignment.center,
//                         child: Container(
//                           width: 36,
//                           height: 1,
//                           color: Colors.grey,
//                         ),
//                       ),
//                       SizedBox(
//                         height: 24.h,
//                       ),
//                       Text(
//                         "product.select_your_address".tr(),
//                         style: context.textTheme.headline3,
//                       ),
//                       Column(
//                           children: List.generate(
//                         state.address.length,
//                         (index) => PrescriptionAddressCard(
//                             model: state.address[index],
//                             onTap: () {
//                               addressCubit.selectAddress(
//                                   state.address[index].id, context);
//                             }),
//                       )),
//                       SizedBox(
//                         height: 20.h,
//                       ),
//                       Center(
//                         child: InkWell(
//                             onTap: () {
//                               Navigator.pop(context);
//                               context.push(AppPaths.address.manageAddresses);
//                             },
//                             child: Text(
//                               "product.manage_my_addresses".tr(),
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .subtitle1!
//                                   .copyWith(
//                                       color: context.theme.colorScheme.primary),
//                             )),
//                       ),
//                       SizedBox(
//                         height: 20.h,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ));
//   }*/
// /*

//   static showCartBottomSheet(BuildContext context, ProductModel product) {
//     final wishListCubit = BlocProvider.of<WishListCubit>(context);
//     final productCubit = ProductDetailsCubit();
//     int count = 0;
//     showModalBottomSheet(
//         context: context,
//         barrierColor: Colors.black26,
//         backgroundColor: Colors.black26,
//         elevation: 20,
//         isDismissible: true,
//         enableDrag: true,
//         isScrollControlled: true,
//         // gives rounded corner to modal bottom screen
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20.0),
//         ),
//         builder: (context) {
//           return BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
//             bloc: productCubit..getProductDetails(product.providerProductId),
//             listener: (context, state) {
//               if (state.status == ProductDetailsStatus.getProductSuccess) {
//                 count = BlocProvider.of<CartCubit>(context)
//                     .state
//                     .isExist(state.product!.toCartItem(1));
//                 productCubit.changeItemTotal(count);
//               }
//             },
//             builder: (context, state) {
//               state.itemsCount;
//               return Container(
//                 decoration: BoxDecoration(
//                     color: context.theme.backgroundColor,
//                     borderRadius: BorderRadius.circular(20)),
//                 width: 1.sw,
//                 padding: EdgeInsets.symmetric(horizontal: 20.w),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         height: 20.h,
//                       ),
//                       Align(
//                         alignment: Alignment.center,
//                         child: Container(
//                           width: 43.w,
//                           height: 5.h,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(18),
//                             color: const Color(0xFFE3E3E3),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20.h,
//                       ),
//                       state.status == ProductDetailsStatus.initial ||
//                               state.status == ProductDetailsStatus.loading
//                           ? SizedBox(
//                               height: 100.h,
//                               width: 1.sw,
//                               child: const LoadingBanner())
//                           : Column(
//                               children: [
//                                 Container(
//                                     width: 388.w,
//                                     height: 163.h,
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(8)),
//                                     child: ClipRRect(
//                                         borderRadius: BorderRadius.circular(8),
//                                         child: Image.network(
//                                           state.product!.productImages!.isEmpty
//                                               ? product.productImage!
//                                               : state.product!.productImages!
//                                                   .first,
//                                           errorBuilder:
//                                               (context, error, stackTrace) {
//                                             return Container(
//                                                 color: Colors.grey
//                                                     .withOpacity(0.3),
//                                                 child: const Center(
//                                                     child: Icon(Icons.image)));
//                                           },
//                                           loadingBuilder: (context, child,
//                                               loadingProgress) {
//                                             if (loadingProgress == null) {
//                                               return child;
//                                             } else {
//                                               return const Center(
//                                                 child:
//                                                     CircularProgressIndicator(),
//                                               );
//                                             }
//                                           },
//                                         ))),
//                                 SizedBox(
//                                   height: 16.h,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Expanded(
//                                       child: Text(
//                                         state.product!.tradeName!,
//                                         style: context.textTheme.subtitle1,
//                                       ),
//                                     ),
//                                     Text(
//                                       "${state.product!.providerProductPrice} AED",
//                                       style: context.textTheme.headline2,
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 4.h,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       "product.prescription_medications".tr(),
//                                       style: context.textTheme.subtitle2!
//                                           .copyWith(
//                                               color: AppMaterialColors
//                                                   .green.shade100),
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 9.h,
//                                 ),
//                                 Row(
//                                   children: [
//                                     Text(
//                                       state.product!.providerName!,
//                                       style: context.textTheme.subtitle2!
//                                           .copyWith(
//                                               color: context.isDark
//                                                   ? null
//                                                   : const Color(0xff42526E)),
//                                     ),
//                                   ],
//                                 ),
//                                 const SizedBox(
//                                   height: 24,
//                                 ),
//                                 Column(
//                                   children: [
//                                     StatefulBuilder(
//                                       builder: (context, setState) {
//                                         return Row(
//                                           children: [
//                                             InkWell(
//                                               onTap: () {
//                                                 if (state.total > 0) {
//                                                   productCubit.decreaseTotal();
//                                                 }
//                                               },
//                                               child: Container(
//                                                 width: 40,
//                                                 height: 40,
//                                                 decoration: BoxDecoration(
//                                                     shape: BoxShape.circle,
//                                                     color: AppMaterialColors
//                                                         .green[25]),
//                                                 child: Center(
//                                                   child: Icon(
//                                                     Icons.remove,
//                                                     size: 12,
//                                                     color: AppMaterialColors
//                                                         .green.shade200,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               width: 30.w,
//                                             ),
//                                             Container(
//                                               alignment: Alignment.center,
//                                               width: 30,
//                                               child: Text(
//                                                 state.total.toString(),
//                                                 style:
//                                                     context.textTheme.headline2,
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               width: 30.w,
//                                             ),
//                                             InkWell(
//                                               onTap: () {
//                                                 productCubit.increaseTotal();
//                                               },
//                                               child: Container(
//                                                 width: 40,
//                                                 height: 40,
//                                                 decoration: BoxDecoration(
//                                                     shape: BoxShape.circle,
//                                                     color: AppMaterialColors
//                                                         .green[25]),
//                                                 child: Center(
//                                                   child: Icon(
//                                                     Icons.add,
//                                                     size: 12,
//                                                     color: AppMaterialColors
//                                                         .green.shade200,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         );
//                                       },
//                                     ),
//                                     SizedBox(
//                                       height: 20.h,
//                                     ),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         CustomButton(
//                                           active:
//                                               productCubit.state.itemsCount > 0,
//                                           width: 300.w,
//                                           withGradient: true,
//                                           onTap: () {
//                                             BlocProvider.of<CartCubit>(context)
//                                                 .addItem(state.product!
//                                                     .toCartItem(state.total));
//                                             Navigator.of(context).pop();
//                                           },
//                                           child: Center(
//                                             child: Text(
//                                               "home_page.Add_to_Cart".tr(),
//                                               style: context
//                                                   .textTheme.headline4!
//                                                   .copyWith(
//                                                       color: Colors.white),
//                                             ),
//                                           ),
//                                         ),
//                                         if (context.isAuth)
//                                           BlocConsumer<WishListCubit,
//                                               WishListState>(
//                                             bloc: wishListCubit,
//                                             listener: (context, state) {
//                                               // if (state.status == WishListStatus.success) {
//                                               //   wishListCubit.addToWishListId(IsWishListItem(
//                                               //       wishListId: product.wishListId,
//                                               //       productId: product.providerProductId));
//                                               // }
//                                               // if (state.status ==
//                                               //     WishListStatus.deletedSuccess) {
//                                               //   wishListCubit.removeFromWishListId(
//                                               //       IsWishListItem(
//                                               //           wishListId: product.wishListId,
//                                               //           productId: product.providerProductId));
//                                               // }
//                                             },
//                                             builder: (context, state) {
//                                               return InkWell(
//                                                 onTap: () {
//                                                   if (state.status ==
//                                                       WishListStatus.loading) {
//                                                     return;
//                                                   }
//                                                   if (!productCubit.state
//                                                       .product!.isWishList!) {
//                                                     wishListCubit.addWishList(
//                                                         productCubit
//                                                             .state.product!
//                                                             .toProductModelItem());
//                                                   } else {
//                                                     wishListCubit.delete(
//                                                         productCubit
//                                                             .state
//                                                             .product!
//                                                             .wishListId!);
//                                                   }
//                                                   productCubit
//                                                       .changeIsWishList();
//                                                   //  isFavorite = !isFavorite;
//                                                 },
//                                                 child: AnimatedContainer(
//                                                   duration: const Duration(
//                                                       milliseconds: 300),
//                                                   width: 65.w,
//                                                   height: 54.h,
//                                                   decoration: BoxDecoration(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             8),
//                                                     border: !productCubit
//                                                             .state
//                                                             .product!
//                                                             .isWishList!
//                                                         ? Border.all(
//                                                             color:
//                                                                 AppMaterialColors
//                                                                     .green
//                                                                     .shade200)
//                                                         : null,
//                                                     gradient: productCubit
//                                                             .state
//                                                             .product!
//                                                             .isWishList!
//                                                         ? AppGradients
//                                                             .greenGradientHorizontal
//                                                         : null,
//                                                   ),
//                                                   child: Center(
//                                                     child: CustomSvgIcon(
//                                                       Assets.icons.favoriteIcon,
//                                                       color: !productCubit
//                                                               .state
//                                                               .product!
//                                                               .isWishList!
//                                                           ? AppMaterialColors
//                                                               .green.shade200
//                                                           : Colors.white,
//                                                     ),
//                                                   ),
//                                                 ),
//                                               );
//                                             },
//                                           ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 34.h,
//                                 ),
//                               ],
//                             )
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         });
//   }
// */

//   static Future showBottomSheet<T>(BuildContext context, List<T> items,
//       Function(T selectedItem) onSelect) async {
//     getName(T item) {
//       if (item is AddressModel) {
//         return ('${"Description".tr()}: ${item.description}\n${"street".tr()}: ${item.street}');
//       }
//     }

//     await showModalBottomSheet(
//         context: context,
//         barrierColor: Colors.black26,
//         backgroundColor: Colors.black26,
//         elevation: 20,
//         isDismissible: true,
//         enableDrag: true,
//         isScrollControlled: true,
//         // gives rounded corner to modal bottom screen
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(24.0),
//         ),
//         builder: (context) => Container(
//               height: 0.8.sh,
//               width: 1.sw,
//               decoration: BoxDecoration(
//                 color: context.theme.cardColor,
//                 borderRadius: const BorderRadius.only(
//                   topLeft: Radius.circular(24),
//                   topRight: Radius.circular(24),
//                 ),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 // mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   SizedBox(
//                     height: 15.h,
//                   ),
//                   Container(
//                     alignment: Alignment.center,
//                     width: 50.w,
//                     height: 5,
//                     decoration: BoxDecoration(
//                       color: Colors.grey,
//                       borderRadius: BorderRadius.circular(18),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 25.h,
//                   ),
//                   Expanded(
//                     child: ListView.separated(
//                       itemCount: items.length,
//                       shrinkWrap: true,
//                       padding: const EdgeInsets.all(0.0),
//                       separatorBuilder: (BuildContext context, int index) =>
//                           Divider(
//                         height: 20.h,
//                       ),
//                       itemBuilder: (context, index) {
//                         return ListTile(
//                           onTap: () {
//                             onSelect(items[index]);
//                             Navigator.pop(context);
//                           },
//                           title: Text(
//                             getName(items[index]) ?? '',
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .titleSmall!
//                                 .copyWith(
//                                     color: context.isDark
//                                         ? AppMaterialColors.white
//                                         : AppMaterialColors.black),
//                           ),
//                         );
//                       },
//                     ),
//                   )
//                 ],
//               ),
//             ));
//   }
// }
