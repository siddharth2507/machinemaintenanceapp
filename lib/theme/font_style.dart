
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:machinemaintainapp/components/common_size/nk_general_size.dart';

import 'color/colors.dart';

/// [NkGetXFontStyle] USE CUSTOM FONT

class NkGetXFontStyle {
  static TextTheme get primaryTextTheme =>
      GoogleFonts.interTextTheme().copyWith(
          labelMedium: GoogleFonts.inter().copyWith(
            color: primaryTextColor,
         //   fontWeight: NkGeneralSize.nkGeneralFontWeight(),
          ));

  static TextTheme get secondaryTextTheme =>
      GoogleFonts.darkerGrotesqueTextTheme().copyWith(
          labelMedium: GoogleFonts.darkerGrotesque().copyWith(
            color: primaryTextColor,
           // fontWeight: NkGeneralSize.nkGeneralFontWeight(),
          ));




/*  static TextTheme get textLightTheme => ThemeData().textTheme.apply(
        fontFamily: GoogleFonts.lexend(
                color: primaryTextColor, fontSize: 14)
            .fontFamily,
      );
  static TextTheme get newFontStyle => const TextTheme(
      displayLarge: TextStyle(
          letterSpacing: -1.5,
          fontSize: 48,
          fontFamily: 'Lexend',
          color: Colors.black,
          fontWeight: FontWeight.bold),
      displayMedium: TextStyle(
          letterSpacing: -1.0,
          fontSize: 40,
          fontFamily: 'Lexend',
          color: Colors.black,
          fontWeight: FontWeight.bold),
      displaySmall: TextStyle(
          letterSpacing: -1.0,
          fontSize: 32,
          fontFamily: 'Lexend',
          color: Colors.black,
          fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(
          letterSpacing: -1.0,
          color: Colors.black,
          fontSize: 28,
          fontFamily: 'Lexend',
          fontWeight: FontWeight.w600),
      headlineSmall: TextStyle(
          letterSpacing: -1.0,
          color: Colors.black,
          fontSize: 24,
          fontFamily: 'Lexend',
          fontWeight: FontWeight.w500),
      titleLarge: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w500,
        fontFamily: 'Lexend',
      ),
      titleMedium: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: 'Lexend',
      ),
      titleSmall: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: 'Lexend',
      ),
      bodyLarge: TextStyle(
          color: Colors.black,
          fontSize: 16,
          // fontFamily: 'ClashDisplay',
          fontWeight: FontWeight.w400),
      bodyMedium: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontFamily: 'Lexend',
          fontWeight: FontWeight.w400),
      labelLarge: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        fontFamily: 'ClashDisplay',
      ),
      bodySmall: TextStyle(
          color: Colors.black,
          fontSize: 12,
          fontFamily: 'Lexend',
          fontWeight: FontWeight.w400),
      labelSmall: TextStyle(
          color: Colors.black,
          fontSize: 10,
          fontFamily: 'Lexend',
          fontWeight: FontWeight.w400,
          letterSpacing: -0.5));*/
}
