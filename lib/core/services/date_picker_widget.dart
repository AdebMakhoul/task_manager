import 'package:task_manager_app/core/utils/extentions.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'dart:io' show Platform;

import '../domain/presentation/resources/theme/app_material_color.dart';

class DataPickerService {
  Future<DateTime?> pickDate(
      {required BuildContext context,
      DateTime? initialDate,
      DateTime? firstDate,
      DateTime? lastDate}) async {
    initialDate ??= DateTime.now();
    firstDate ??= DateTime(2020, 1);
    lastDate ??= DateTime(2050, 12);

    initialDate = DateUtils.dateOnly(initialDate);
    firstDate = DateUtils.dateOnly(firstDate);
    lastDate = DateUtils.dateOnly(lastDate);

    if (Platform.isIOS) {
      return showCupertinoDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: firstDate,
        lastDate: lastDate,
      );
    }
    return showMaterialDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
  }

  Future<DateTime?> showCupertinoDatePicker(
      {required BuildContext context,
      required DateTime initialDate,
      required DateTime firstDate,
      required DateTime lastDate}) async {
    DateTime? picked;

    await showCupertinoModalPopup(
      context: context,
      builder: (contextInner) => Container(
        height: 300,
        color: context.theme.colorScheme.background,
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: CupertinoTheme(
                data: CupertinoThemeData(
                  textTheme: CupertinoTextThemeData(
                      dateTimePickerTextStyle: TextStyle(
                          fontSize: 20.sp,
                          color: context.isDark
                              ? AppMaterialColors.white
                              : AppMaterialColors.black.shade200)),
                ),
                child: CupertinoDatePicker(
                  minimumDate: firstDate,
                  initialDateTime: initialDate,
                  maximumDate: lastDate,
                  mode: CupertinoDatePickerMode.date,
                  backgroundColor: context.theme.colorScheme.background,
                  onDateTimeChanged: (val) {
                    picked = val.copyWith(minute: 0);
                  },
                ),
              ),
            ),
            CupertinoButton(
              child: Text("next".tr()),
              onPressed: () async {
                picked ??= DateTime.now().copyWith(minute: 0);
                Navigator.of(contextInner)
                    .push(showPicker(
                  okText: "ok".tr(),
                  cancelText: "Cancel".tr(),
                  ltrMode: !context.isArabic,
                  context: contextInner,
                  value:
                      Time(hour: DateTime.now().hour, minute: 00, second: 00),
                  onChange: (val) {
                    picked = DateTime(
                      picked!.year,
                      picked!.month,
                      picked!.day,
                      val.hour,
                      val.minute,
                    );
                  },
                  disableMinute: true,
                  minuteInterval: TimePickerInterval.FIFTEEN,
                  iosStylePicker: true,
                  is24HrFormat: false,
                ))
                    .then((_) {
                  contextInner.pop();
                });
              },
            )
          ],
        ),
      ),
    );
    return picked;
  }

  Future<DateTime?> showMaterialDatePicker({
    required BuildContext context,
    required DateTime initialDate,
    required DateTime firstDate,
    required DateTime lastDate,
  }) async {
    final DateTime? selectedDate = await showDatePicker(
      helpText: "Choose Date".tr(),
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    if (selectedDate == null) return null;

    if (!context.mounted) return selectedDate;

    DateTime? selectedTime = selectedDate.copyWith(minute: 0);

    await Navigator.of(context)
        .push(showPicker(
          okText: "ok".tr(),
          cancelText: "Cancel".tr(),
          ltrMode: !context.isArabic,
          context: context,
          value: Time(hour: DateTime.now().hour, minute: 00, second: 00),
          onChange: (val) {
            selectedTime = DateTime(
              selectedDate.year,
              selectedDate.month,
              selectedDate.day,
              val.hour,
              val.minute,
            );
          },
          disableMinute: true,
          minuteInterval: TimePickerInterval.FIFTEEN,
          iosStylePicker: true,
          is24HrFormat: false,
        ))
        .then((_) {});

    return selectedTime;
  }
}
