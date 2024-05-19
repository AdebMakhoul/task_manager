import 'dart:math';

import 'package:task_manager_app/core/domain/presentation/resources/theme/app_text_theme.dart';
import 'package:task_manager_app/core/utils/extentions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_color_scheme.dart';

class AppTheme {
  final AppColorScheme appColorScheme;

  AppTheme(this.appColorScheme);

  ThemeData getThemeData(BuildContext context) {
    final textTheme = context.locale.languageCode == "en"
        ? AppTextTheme.enTextTheme
        : AppTextTheme.arTextTheme;

    return ThemeData(
      primarySwatch: _generateMaterialColor(),
      brightness: context.isDark ? Brightness.dark : Brightness.light,
      scaffoldBackgroundColor: appColorScheme.backgroundColor,
      backgroundColor: appColorScheme.backgroundColor,
      cardColor: appColorScheme.cardBackgroundColor,
      canvasColor: appColorScheme.backgroundAccentColor,
      focusColor: appColorScheme.infoTextColor,
      errorColor: appColorScheme.errorColor,
      dividerColor: appColorScheme.dividerColor,
      hintColor: appColorScheme.placeholderColor,
      indicatorColor: appColorScheme.accentColor,
      toggleableActiveColor: appColorScheme.accentColor,
      disabledColor: appColorScheme.placeholderColor,
      dialogTheme: DialogTheme(
        backgroundColor: appColorScheme.backgroundColor,
      ),
      bottomSheetTheme:
          BottomSheetThemeData(backgroundColor: appColorScheme.backgroundColor),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: appColorScheme.accentColor,
      ),
      iconTheme: IconThemeData(color: appColorScheme.iconTintColor),
      primaryIconTheme: IconThemeData(color: appColorScheme.iconTintColor),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: appColorScheme.accentColor,
      ),
      appBarTheme: AppBarTheme(
          elevation: 1,
          titleTextStyle: textTheme.headlineSmall!.copyWith(
              color: appColorScheme.primaryFontColor,
              fontWeight: FontWeight.w700),
          iconTheme: IconThemeData(color: appColorScheme.appBarIconColor),
          color: appColorScheme.appBarColor),
      textTheme: textTheme.apply(
        displayColor: appColorScheme.primaryFontColor,
        bodyColor: appColorScheme.secondaryFontColor,
      ),
      fontFamily: context.locale.languageCode == "en"
          ? AppTextTheme.SSTFamily
          : AppTextTheme.SSTFamily,
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: appColorScheme.secondaryFontColor),
        hintStyle: TextStyle(color: appColorScheme.placeholderColor),
        fillColor: appColorScheme.cardBackgroundColor,
        filled: true,
        prefixIconColor: appColorScheme.iconTintColor,
        suffixIconColor: appColorScheme.iconTintColor,
        iconColor: appColorScheme.iconTintColor,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: appColorScheme.inputBorderColor,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: appColorScheme.inputBorderColor,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: appColorScheme.inputBorderColor,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: appColorScheme.inputBorderColor,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 7, 14, 7),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(vertical: 17.h, horizontal: 16.w)),
          overlayColor: MaterialStateProperty.all(
              appColorScheme.elevatedButtonTextColor.withAlpha(50)),
          foregroundColor:
              MaterialStateProperty.all(appColorScheme.elevatedButtonTextColor),
          backgroundColor:
              MaterialStateProperty.all(appColorScheme.buttonBackgroundColor),
          elevation: MaterialStateProperty.all(1),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          )),
          textStyle: MaterialStateProperty.all(TextStyle(
            color: appColorScheme.elevatedButtonTextColor,
            fontSize: 14.sp,
          )),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(vertical: 17.h, horizontal: 16.w)),
          overlayColor: MaterialStateProperty.all(
              appColorScheme.primaryColor.withAlpha(50)),
          foregroundColor:
              MaterialStateProperty.all(appColorScheme.primaryColor),
          backgroundColor:
              MaterialStateProperty.all(appColorScheme.backgroundColor),
          elevation: MaterialStateProperty.all(1),
          side: MaterialStateProperty.all(
              BorderSide(color: appColorScheme.primaryColor)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            side: BorderSide(color: appColorScheme.primaryColor),
            borderRadius: BorderRadius.circular(27),
          )),
          textStyle: MaterialStateProperty.all(TextStyle(
            color: appColorScheme.outlineButtonTextColor,
            fontSize: 14.sp,
          )),
        ),
      ),
      unselectedWidgetColor: appColorScheme.infoTextColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: appColorScheme.backgroundColor,
          showUnselectedLabels: true,
          selectedItemColor: appColorScheme.primaryColor,
          unselectedItemColor: appColorScheme.iconTintColor,
          unselectedLabelStyle: TextStyle(fontSize: 10.sp),
          selectedLabelStyle: TextStyle(fontSize: 9.sp)),
      tabBarTheme: TabBarTheme(
        unselectedLabelColor: appColorScheme.primaryFontColor,
        labelColor: appColorScheme.primaryFontColor,
        labelStyle: textTheme.headline4?.copyWith(
            overflow: TextOverflow.fade, color: Theme.of(context).primaryColor),
        unselectedLabelStyle: textTheme.headline4,
        indicator: UnderlineTabIndicator(
          borderSide:
              BorderSide(color: appColorScheme.primaryColor, width: 4.h),
        ),
      ),
    );
  }

  MaterialColor _generateMaterialColor() {
    return MaterialColor(appColorScheme.primaryColor.value, {
      50: _tintColor(appColorScheme.secondaryColor, 0.9),
      100: _tintColor(appColorScheme.secondaryColor, 0.8),
      200: _tintColor(appColorScheme.secondaryColor, 0.6),
      300: _tintColor(appColorScheme.secondaryColor, 0.4),
      400: _tintColor(appColorScheme.secondaryColor, 0.2),
      500: appColorScheme.accentColor,
      600: _shadeColor(appColorScheme.primaryColor, 0.1),
      700: _shadeColor(appColorScheme.primaryColor, 0.2),
      800: _shadeColor(appColorScheme.primaryColor, 0.3),
      900: _shadeColor(appColorScheme.primaryColor, 0.4),
    });
  }

  int _tintValue(int value, double factor) =>
      max(0, min((value + ((255 - value) * factor)).round(), 255));

  Color _tintColor(Color color, double factor) => Color.fromRGBO(
      _tintValue(color.red, factor),
      _tintValue(color.green, factor),
      _tintValue(color.blue, factor),
      1);

  int _shadeValue(int value, double factor) =>
      max(0, min(value - (value * factor).round(), 255));

  Color _shadeColor(Color color, double factor) => Color.fromRGBO(
      _shadeValue(color.red, factor),
      _shadeValue(color.green, factor),
      _shadeValue(color.blue, factor),
      1);
}

ThemeData getDatePickerTheme(context) {
  return Theme.of(context).copyWith(
    colorScheme: Theme.of(context).colorScheme.copyWith(
        primary: Theme.of(context).colorScheme.secondary,
        onSurface: Theme.of(context).textTheme.bodyLarge!.color),
  );
}
