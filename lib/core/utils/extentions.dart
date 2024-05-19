import 'package:task_manager_app/core/data/enums/auth_state.dart';
import 'package:task_manager_app/core/data/enums/occasions_order_status_enum.dart';
import 'package:task_manager_app/core/data/enums/order_financial_status_enum.dart';
import 'package:task_manager_app/core/utils/parse_helpers/failure_parser.dart';
import 'package:task_manager_app/core/utils/parse_helpers/field_failure_parser/field_failure_parser.dart';
import 'package:task_manager_app/features/auth/presentation/cubits/authentication_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../di/injection.dart';
import '../domain/presentation/blocs/theme_bloc/theme_bloc.dart';
import 'failures/base_failure.dart';
import 'failures/field_failure/field_failure.dart';

extension ContextMethods on BuildContext {
  /// Parse General Failure To String Message
  String failureParser(Failure failure) =>
      FailureParser.mapFailureToString(failure: failure, context: this);

  /// Parse Field Failure To String Message or Return null if failure null
  String? fieldFailureParser(FieldFailure? failure) => failure == null
      ? null
      : FieldFailureParser.mapFieldFailureToErrorMessage(
          failure: failure,
        );

  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  bool get isDark => getIt<ThemeBloc>().isDark;

  bool get isAuth => getIt<AuthenticationCubit>().getAuthState();

  AuthState get getAuthStateName =>
      getIt<AuthenticationCubit>().getAuthStateName();

  bool get isArabic => locale.languageCode == 'ar';

  bool get isTablet => MediaQuery.of(this).size.width > 768;
}

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

extension DoubleMethods on double {
  double roundTo2DigitsAfterDecimalPoint() => double.parse(toStringAsFixed(2));
}

extension StringMethods on String {
  bool get isValidEmail => contains(RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'));
}

extension NumberFormatting on num {
  String formatAsInteger() {
    if (this % 1 == 0) {
      return toInt().toString();
    } else {
      return toStringAsFixed(2);
    }
  }
}

extension StringToDate on String {
  DateTime setTime(String time) {
    DateTime dateTime = DateTime.parse(time);
    return dateTime;
  }

  String getDateWithMonthNameDayNameAndYear(String local) {
    DateTime dateTime = DateTime.tryParse(this)!;
    return DateFormat("EEEE, dd MMMM", local).format(dateTime);
  }

  String removePlusFromString() {
    return replaceAll('+', '');
  }

  String addPlusInStartOfString() {
    return '+$this';
  }
}

extension Date on DateTime {
  String getDayName({String? locale}) {
    return DateFormat('EEEE', locale).format(this);
  }

  String getMonthName({String? locale}) {
    return DateFormat('MMMM', locale).format(this);
  }

  String getDateWithMonthNameDayAndYear() {
    return DateFormat("MMM dd , yyyy").format(this);
  }

  String getDateWithMonthNameDayNameAndYear(String local) {
    return DateFormat("EEEE, dd MMMM", local).format(this);
  }

  String format() {
    return DateFormat("yyyy-MM-dd HH:mm", 'en').format(this);
  }

  String formatDateOnly() {
    return DateFormat("yyyy-MM-dd", 'en').format(this);
  }

  String getHour() {
    return DateFormat("K:mm a").format(this);
  }

  String getDateWithDayMonthName() {
    return DateFormat("EEE, d MMM").format(this);
  }

  String getTime() {
    return DateFormat("Hm").format(this);
  }

  String monthDayYear() {
    return DateFormat("MMMM,dd yyyy hh:mm").format(this);
  }

  String normalFormat() {
    return DateFormat("dd/MM/yyyy", "en").format(this);
  }

  String dateWithSeconds(String? language, [String? format]) {
    var formatter = DateFormat(format ?? 'h:mm a', language);
    return formatter.format(this).toString();
  }
}

extension DurationEx on Duration {
  String toMinuteWithSeconds() {
    int seconds = inSeconds;
    int minutes = seconds ~/ 60;
    String ret = minutes < 10 ? '0$minutes' : '$minutes';
    ret += ':';
    seconds -= minutes * 60;
    ret += seconds < 10 ? '0$seconds' : '$seconds';
    return ret;
  }
}

extension Formatter on String {
  String formatHoursLocale() {
    var formatter = DateFormat('h:mm a', 'en');
    List<String> time = split(':');
    int h = int.parse(time[0]);
    if (time[2][3] == 'P') {
      if (h != 12) {
        h = h + 12;
      }
    } else {
      h = h % 12;
    }
    String finalHour = '';
    if (h <= 9) {
      finalHour = '0$h';
    } else {
      finalHour = h.toString();
    }
    DateTime temp = DateTime.parse(
        '2012-02-27 $finalHour:${time[1]}:${time[2].substring(0, 2)}');
    return formatter.format(temp);
  }
}

extension ShowToast on String {
  showToast() {
    Fluttertoast.showToast(
        msg: this,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}

extension InverseKeyValue on Map {
  Map<K, V> inverse<K, V>() {
    return map((k, v) => MapEntry(v, k));
  }
}

extension StringEnumOccasionsOrderStatus on OccasionsOrderStatusEnum {
  String getName() {
    {
      switch (this) {
        case OccasionsOrderStatusEnum.pending:
          return "pending".tr();
        case OccasionsOrderStatusEnum.confirmed:
          return "Order confirmed".tr();
        case OccasionsOrderStatusEnum.courierIsAssigned:
          return "Courier Is Assigned".tr();
        case OccasionsOrderStatusEnum.beingPrepared:
          return "Being prepared".tr();
        case OccasionsOrderStatusEnum.outForDelivery:
          return "Out for delivery".tr();
        case OccasionsOrderStatusEnum.completed:
          return "completed".tr();
        case OccasionsOrderStatusEnum.rejected:
          return "Rejected".tr();
        case OccasionsOrderStatusEnum.returned:
          return "Returned".tr();
        case OccasionsOrderStatusEnum.cancelled:
          return "Cancelled".tr();
        default:
          return "";
      }
    }
  }

  Color getStatusColor() {
    switch (this) {
      case OccasionsOrderStatusEnum.pending:
        return Colors.orange;
      case OccasionsOrderStatusEnum.confirmed:
        return Colors.greenAccent;
      case OccasionsOrderStatusEnum.courierIsAssigned:
        return Colors.blue;
      case OccasionsOrderStatusEnum.beingPrepared:
        return Colors.yellow;
      case OccasionsOrderStatusEnum.outForDelivery:
        return Colors.teal;
      case OccasionsOrderStatusEnum.completed:
        return Colors.green;
      case OccasionsOrderStatusEnum.rejected:
        return Colors.red;
      case OccasionsOrderStatusEnum.returned:
        return Colors.brown;
      case OccasionsOrderStatusEnum.cancelled:
        return Colors.grey;
      default:
        return Colors.black;
    }
  }
}

extension StringEnumOccasionsOrderFinancialStatus on OrderFinancialStatusEnum {
  String getName() {
    switch (this) {
      case OrderFinancialStatusEnum.payed:
        return "Payed".tr();
      case OrderFinancialStatusEnum.received:
        return "Received".tr();
      case OrderFinancialStatusEnum.transferred:
        return "Transferred".tr();
      case OrderFinancialStatusEnum.refunded:
        return "Refunded".tr();
      default:
        return '';
    }
  }

  Color getFinancialStatusColor() {
    switch (this) {
      case OrderFinancialStatusEnum.payed:
        return Colors.greenAccent;
      case OrderFinancialStatusEnum.received:
        return Colors.green;
      case OrderFinancialStatusEnum.transferred:
        return Colors.green.withOpacity(0.8);
      case OrderFinancialStatusEnum.refunded:
        return Colors.red;
      default:
        return Colors.black;
    }
  }
}
