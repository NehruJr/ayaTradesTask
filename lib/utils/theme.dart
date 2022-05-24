import 'package:aya_trades_task/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthTheme {
  ThemeData appTheme() {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      colorScheme: const ColorScheme.light(
        primary: kDarkGreenColor,
        onPrimary: Colors.white,
      ),
      textTheme: appTextTheme,
    );
  }

  TextTheme appTextTheme = TextTheme(
    headline1: GoogleFonts.lato(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: kDarkGreenColor,
    ),
    headline2: GoogleFonts.lato(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: kDarkGreenColor,
    ),
    headline3: const TextStyle(
      fontFamily: 'Roboto',
      fontSize: 15,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
    bodyText1: const TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: kDarkGreenColor,
    ),
  );
}
