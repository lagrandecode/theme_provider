

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';





String _selectedTheme = "darkThemeOn";

class ThemeProvider extends ChangeNotifier {
  late ThemeData _selectedTheme;
  late Typography defaultTypography;
  late SharedPreferences prefs;

  ThemeData dark = ThemeData.dark(

  ).copyWith(
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
    primaryColor: Color(0xff0D60D8),
    backgroundColor: Colors.black,
    cardColor: Colors.yellow,
    textTheme: TextTheme(
      headline1: GoogleFonts.montserrat(color: Colors.white,
          fontSize: 97, fontWeight: FontWeight.w300, letterSpacing: -1.5),
      headline2: GoogleFonts.montserrat(color: Colors.white,
          fontSize: 61, fontWeight: FontWeight.w300, letterSpacing: -0.5),
      headline3: GoogleFonts.montserrat(fontSize: 48, fontWeight: FontWeight.w400),
      headline4: GoogleFonts.montserrat(color: Colors.white,
          fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      headline5: GoogleFonts.montserrat(fontSize: 24, fontWeight: FontWeight.w400),
      headline6: GoogleFonts.montserrat(color: Colors.white,
          fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
      subtitle1: GoogleFonts.montserrat(color: Colors.white,
          fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
      subtitle2: GoogleFonts.montserrat(color: Colors.white,
          fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
      bodyText1: GoogleFonts.montserrat(color: Colors.white,
          fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
      bodyText2: GoogleFonts.montserrat(color: Colors.white,
          fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      button: GoogleFonts.montserrat(color: Colors.white,
          fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
      caption: GoogleFonts.montserrat(color: Colors.white,
          fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
      overline: GoogleFonts.montserrat( color: Colors.white,
          fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
    ),

  );

  ThemeData light = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Color(0xff0D60D8),
    backgroundColor: Colors.white,
    cardColor: Colors.yellow,

  );

  ThemeProvider(bool darkThemeOn) {
    _selectedTheme = darkThemeOn ? dark: light;
  }

  Future<void> swapTheme() async {
    prefs = await SharedPreferences.getInstance();

    if (_selectedTheme == dark) {
      _selectedTheme = light;
      await prefs.setBool("darkTheme", false);
    } else {
      _selectedTheme = dark;
      await prefs.setBool("lightTheme", true);
    }

    notifyListeners();
  }

  ThemeData getTheme() => _selectedTheme;
}