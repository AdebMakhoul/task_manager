import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///Fonts documentation:
///
/// to access the styles you should use:
///   [ context.textTheme.headline1 ]
///   or
///   [ theme.of(context).textTheme.headline1 ]
///for [ Bold ] fonts you should use :
///  [ displayLarge ] => [ 22 ]
///  [ titleLarge ] => [ 12 ]
///
///
/// for [ SemiBold ] fonts you should use :
///  [ displayMedium ] => [ 20 ]
///  [ displaySmall ] => [ 18 ]
///  [ headlineMedium ] => [ 16 ]
///  [ headlineSmall ] => [ 14 ]
///
///  for [ Medium ] fonts you should use :
///  [ titleMedium ] => [ 16 ]
///  [ titleSmall ] => [ 14 ]
///
///  for [ Regular ] fonts you should use :
///  [ bodyLarge ] => [ 16 ]
///  [ bodyMedium ] => [ 14 ]
///
///  for [ Font Size 12 ] fonts you should use :
///  [ bodySmall ] => [ 12 ] and weight is medium
///
///  for [ Font Size 10 ] fonts you should use :
///  [ labelSmall ] => [ 10 ]  and weight is medium
///
/// In case of changes you should use [ copyWith ] to achieve wanted results

class AppTextTheme {
  static final SSTFamily = 'SST';
  static const double fontHeight = 1.2;

  static TextTheme enTextTheme = TextTheme(
    displayLarge: TextStyle(
        fontSize: 22.sp,
        height: fontHeight,
        fontFamily: SSTFamily,
        fontWeight: FontWeight.w700),
    displayMedium: TextStyle(
        fontSize: 20.sp,
        height: fontHeight,
        fontFamily: SSTFamily,
        fontWeight: FontWeight.w600),
    displaySmall: TextStyle(
        fontSize: 18.sp,
        height: fontHeight,
        fontFamily: SSTFamily,
        fontWeight: FontWeight.w600),
    headlineMedium: TextStyle(
        fontSize: 16.sp,
        height: fontHeight,
        fontFamily: SSTFamily,
        fontWeight: FontWeight.w600),
    headlineSmall: TextStyle(
        fontSize: 14.sp,
        height: fontHeight,
        fontFamily: SSTFamily,
        fontWeight: FontWeight.w600),
    titleLarge: TextStyle(
        fontSize: 12.sp,
        height: fontHeight,
        fontFamily: SSTFamily,
        fontWeight: FontWeight.w700),
    titleMedium: TextStyle(
        fontSize: 16.sp,
        height: fontHeight,
        fontFamily: SSTFamily,
        fontWeight: FontWeight.w500),
    titleSmall: TextStyle(
        fontFamily: SSTFamily,
        fontSize: 14.sp,
        height: fontHeight,
        fontWeight: FontWeight.w500),
    bodyLarge: TextStyle(
        fontFamily: SSTFamily,
        fontSize: 16.sp,
        height: fontHeight,
        fontWeight: FontWeight.w400),
    bodyMedium: TextStyle(
        fontFamily: SSTFamily,
        fontSize: 14.sp,
        height: fontHeight,
        fontWeight: FontWeight.w400),
    bodySmall: TextStyle(
        fontFamily: SSTFamily,
        fontSize: 12.sp,
        height: fontHeight,
        fontWeight: FontWeight.w400),
    labelSmall: TextStyle(
      fontFamily: SSTFamily,
      fontSize: 10.sp,
      height: fontHeight,
    ),
    labelLarge: TextStyle(
      fontFamily: SSTFamily,
      fontSize: 16.sp,
      height: fontHeight,
    ),
  );

  static TextTheme arTextTheme = TextTheme(
    displayLarge: TextStyle(
        fontSize: 22.sp,
        fontFamily: SSTFamily,
        height: fontHeight,
        fontWeight: FontWeight.w600),
    displayMedium: TextStyle(
        fontSize: 20.sp,
        fontFamily: SSTFamily,
        height: fontHeight,
        fontWeight: FontWeight.w600),
    displaySmall: TextStyle(
        fontSize: 18.sp,
        fontFamily: SSTFamily,
        height: fontHeight,
        fontWeight: FontWeight.w600),
    headlineMedium: TextStyle(
        fontSize: 16.sp,
        fontFamily: SSTFamily,
        height: fontHeight,
        fontWeight: FontWeight.w600),
    headlineSmall: TextStyle(
        fontSize: 14.sp,
        fontFamily: SSTFamily,
        height: fontHeight,
        fontWeight: FontWeight.w600),
    titleLarge: TextStyle(
        fontSize: 12.sp,
        fontFamily: SSTFamily,
        height: fontHeight,
        fontWeight: FontWeight.w600),
    titleMedium: TextStyle(
        fontSize: 16.sp,
        fontFamily: SSTFamily,
        height: fontHeight,
        fontWeight: FontWeight.w500),
    titleSmall: TextStyle(
        fontFamily: SSTFamily,
        height: fontHeight,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500),
    bodyLarge: TextStyle(
        fontFamily: SSTFamily,
        height: fontHeight,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400),
    bodyMedium: TextStyle(
        fontFamily: SSTFamily,
        height: fontHeight,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400),
    bodySmall: TextStyle(
      fontFamily: SSTFamily,
      height: fontHeight,
      fontSize: 12.sp,
    ),
    labelSmall: TextStyle(
      fontFamily: SSTFamily,
      height: fontHeight,
      fontSize: 10.sp,
    ),
    labelLarge: TextStyle(
      fontFamily: SSTFamily,
      height: fontHeight,
      fontSize: 16.sp,
    ),
  );
}
