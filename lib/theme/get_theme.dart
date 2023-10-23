
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'color/colors.dart';
import 'font_style.dart';

class NkGetXTheme {
  static ThemeData get lightTheme => ThemeData(
      shadowColor: shadowColor,
      primaryColor: primaryColor,
      primaryColorLight: primaryColor,
      primaryColorDark: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: appBarTheme,
      timePickerTheme: timePickerDialogTheme,
     //datePickerTheme: datePickerDialogTheme,
      textTheme: NkGetXFontStyle.primaryTextTheme,
      primaryTextTheme: NkGetXFontStyle.primaryTextTheme,
      dividerColor: dividerColor,
      listTileTheme:
      const ListTileThemeData(contentPadding:EdgeInsets.zero),
      expansionTileTheme: const ExpansionTileThemeData(
          iconColor: primaryColor,
          textColor: primaryTextColor,
          collapsedTextColor: primaryTextColor,
          tilePadding: EdgeInsets.zero,
          childrenPadding: EdgeInsets.zero),
      colorScheme: ColorScheme.light(
          primary: primaryColor,
          error: errorColor,
          onError: errorColor,
          background: backgroundColor,
          onBackground: backgroundColor,
          primaryContainer: primaryContainerColor,
          onSecondary: secondaryColor,
          secondaryContainer: secondaryColor,
          surface: backgroundColor,
          secondary: secondaryColor,
          brightness: Get.theme.brightness),
      iconTheme: const IconThemeData(
          color: primaryIconColor, size: 14),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: secondaryTextColor,
        selectionColor: cursorColor,
        selectionHandleColor: primaryButtonColor,
      ),
      useMaterial3: true,
      iconButtonTheme: const IconButtonThemeData(
          style: ButtonStyle(
              iconColor: MaterialStatePropertyAll(primaryIconColor))),
      primaryIconTheme: const IconThemeData(
          color: primaryIconColor, size:14),
      brightness: Brightness.light,
      buttonTheme: ButtonThemeData(
          buttonColor: primaryButtonColor,
          textTheme: ButtonTextTheme.normal,
          padding: EdgeInsets.zero,
         // height: Get.height * 0.06,
          disabledColor: primaryButtonColor,
          focusColor: primaryButtonColor,
          layoutBehavior: ButtonBarLayoutBehavior.padded,
          shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(10),
          )));

  static AppBarTheme get appBarTheme => const AppBarTheme(
      color: backgroundColor,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: backgroundColor,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: backgroundColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      shadowColor: shadowColor,
      centerTitle: true,
      titleTextStyle: TextStyle());
  static TimePickerThemeData get timePickerDialogTheme =>
        const TimePickerThemeData(
        backgroundColor: Colors.white,
        hourMinuteColor: Colors.white,
        dayPeriodColor: Colors.orange,
        hourMinuteTextColor: Colors.black,
        dayPeriodTextColor: Colors.white,
        dialHandColor: Colors.white,
        dialTextColor: Colors.black,
        entryModeIconColor: Colors.black,
        helpTextStyle: TextStyle(color: Colors.black),
      );
  // static DatePickerThemeData get datePickerDialogTheme =>
  //     const DatePickerThemeData(
  //       backgroundColor: Colors.white,
  //       rangePickerHeaderBackgroundColor: Colors.orange,
  //     );
}
