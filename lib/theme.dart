import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

mixin MyThemeData implements ThemeData {
  static ThemeData get light {
    return ThemeData(
        primaryColor: myLightPrimaryColor,
        accentColor: myLightAccentColor,
        buttonColor: myLightButtonColor,
        brightness: Brightness.light,
        scaffoldBackgroundColor: myLightScaffoldBackgroundColor,
        textTheme: TextTheme(
            bodyText2: TextStyle(
                color: myLightTextColor,
                fontSize: 16,
                fontWeight: FontWeight.w700)),
        fontFamily: GoogleFonts.ubuntu().fontFamily);
  }

  static ThemeData get dark {
    return ThemeData(
        primaryColor: myDarkPrimaryColor,
        accentColor: myDarkAccentColor,
        buttonColor: myDarkButtonColor,
        // brightness: Brightness.dark,
        scaffoldBackgroundColor: myDarkScaffoldBackgroundColor,
        textTheme: TextTheme(
            bodyText2: TextStyle(
                color: myDarkTextColor,
                fontSize: 16,
                fontWeight: FontWeight.normal)),
        fontFamily: GoogleFonts.ubuntu().fontFamily);
  }
}
