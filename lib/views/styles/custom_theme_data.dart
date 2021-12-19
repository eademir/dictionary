import 'package:dictionary/views/styles/colour_palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData customThemeDataLight = ThemeData(
  brightness: Brightness.light,
  textTheme: TextTheme(
    bodyText1: GoogleFonts.mali(
      fontSize: 16,
      color: cpDark,
    ),
    headline5: GoogleFonts.mali(
      fontSize: 20,
      color: cpDark,
    ),
  ),
  errorColor: cpRed,
  primaryColor: cpLightBlue,
  backgroundColor: cpLight,
  scaffoldBackgroundColor: cpLight,
  dividerColor: cpDark,
  iconTheme: const IconThemeData(
    color: cpDark,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15.0),
        bottomLeft: Radius.circular(15.0),
      ),
      borderSide: BorderSide(color: cpDark),
    ),
  ),
  buttonTheme: _kButtonThemeData,
);

ThemeData customThemeDataDark = ThemeData(
  brightness: Brightness.dark,
  textTheme: TextTheme(
    bodyText1: GoogleFonts.mali(
      fontSize: 16,
      color: cpLight,
    ),
    headline5: GoogleFonts.mali(
      fontSize: 20,
      color: cpLight,
    ),
  ),
  errorColor: cpRed,
  backgroundColor: cpDark,
  scaffoldBackgroundColor: cpDark,
  dividerColor: cpLight,
  primaryColor: cpDarkBlue,
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15.0),
        bottomLeft: Radius.circular(15.0),
      ),
    ),
  ),
  buttonTheme: _kButtonThemeData,
);

const _kButtonThemeData = ButtonThemeData(
  height: 60,
  shape: OutlineInputBorder(
    borderSide: BorderSide(width: 0.5),
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(15.0),
      bottomRight: Radius.circular(15.0),
    ),
  ),
);
