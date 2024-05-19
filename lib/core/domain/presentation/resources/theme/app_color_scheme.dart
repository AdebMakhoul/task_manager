import 'package:task_manager_app/core/utils/extentions.dart';
import 'package:flutter/material.dart';

abstract class AppColorScheme {
  Color get primaryColor => const Color(0xFF5B63AD);
  Color get secondaryColor;
  Color get accentColor => const Color(0xFF5B63AD);
  Color get errorColor => const Color(0xffff5959);
  Color get placeholderColor;
  Color get inputBorderColor;
  Color get dividerColor;
  Color get primaryFontColor;
  Color get secondaryFontColor;
  Color get cardBackgroundColor;
  Color get backgroundColor;
  Color get backgroundAccentColor;
  Color get iconTintColor;
  Color get buttonBackgroundColor;
  Color get elevatedButtonTextColor;
  Color get outlineButtonTextColor;
  Color get appBarIconColor;
  Color get appBarColor;
  Color get fieldBackgroundColor=>const Color(0xFF42526E);


  Color get secondaryCardBackgroundColor;
  Color get infoTextColor;

}

class AppDarkColorScheme extends AppColorScheme {
  @override
  Color get backgroundColor => const Color(0xff333a42);

  @override
  Color get buttonBackgroundColor => const Color(0xff5B63AD);

  @override
  Color get elevatedButtonTextColor => const Color(0xffFFFFFF);

  @override
  Color get outlineButtonTextColor => const Color(0xffFFFFFF);

  @override
  Color get cardBackgroundColor => const Color(0xff1f2329);

  @override
  Color get secondaryCardBackgroundColor =>  const Color(0xff333a42);

  @override
  Color get dividerColor =>  Color(0xfff2f6f7);

  @override
  Color get iconTintColor => const Color(0xffffffff);

  @override
  Color get inputBorderColor => const Color(0xff1f2329);

  @override
  Color get placeholderColor => const Color(0xffc1c7D0);

  // @override
  // Color get primaryColor => const Color(0xFFFFFFFF);

  @override
  Color get primaryFontColor => const Color(0xffffffff);

  @override
  Color get secondaryColor => const Color(0xff29C1D8);

  @override
  Color get secondaryFontColor => const Color(0xffeff3f5);

  @override
  Color get infoTextColor => const Color(0xff979797);

  @override
  Color get appBarIconColor => const Color(0xffffffff);

  @override
  Color get backgroundAccentColor => const Color(0xff1f2329);

  @override
  Color get appBarColor => const Color(0xff1f2329);
}

class AppLightColorScheme extends AppColorScheme {
  @override
  Color get backgroundColor =>  const Color.fromRGBO(249, 249, 249,1);

  @override
  Color get buttonBackgroundColor => const Color(0xff5B63AD);

  @override
  Color get elevatedButtonTextColor => const Color(0xffFFFFFF);

  @override
  Color get outlineButtonTextColor => const Color(0xff5B63AD);

  @override
  Color get cardBackgroundColor => const Color(0xffffffff);

  @override
  Color get secondaryCardBackgroundColor =>  const Color(0xffededed);

  @override
  Color get dividerColor =>  Colors.grey;

  @override
  Color get iconTintColor => const Color(0xff6e7183);

  @override
  Color get inputBorderColor => const Color(0xffc1c7D0);

  @override
  Color get placeholderColor => const Color(0xffc1c7D0);

  // @override
  // Color get primaryColor => const Color(0xFFFFFFFF);

  @override
  Color get primaryFontColor => const Color(0xff000000);

  @override
  Color get secondaryColor => const Color.fromRGBO(91, 99, 173, 1);

  @override
  Color get secondaryFontColor => const Color(0xff42526e);

  @override
  Color get infoTextColor => const Color(0xff979797);

  @override
  Color get appBarIconColor => const Color(0xff000000);

  @override
  Color get backgroundAccentColor => const Color(0xffECF1FA);

  @override
  Color get appBarColor => HexColor.fromHex("#F9F9F9");
}
