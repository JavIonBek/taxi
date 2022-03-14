// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_cab/constance/global.dart' as globals;

class CoustomTheme {
  static ThemeData getThemeData() {
    if (globals.isLight) {
      return _buildLightTheme();
    } else {
      return _buildDarkTheme();
    }
  }

  static TextTheme _buildTextTheme(TextTheme base) {
    return base.copyWith(
      headline6: GoogleFonts.montserrat(
        textStyle: TextStyle(
          color: base.headline6!.color,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle1: GoogleFonts.montserrat(
        textStyle: TextStyle(
          color: base.subtitle1!.color,
          fontSize: 16,
        ),
      ),
      subtitle2: GoogleFonts.montserrat(
        textStyle: TextStyle(
          color: base.subtitle2!.color,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      bodyText2: GoogleFonts.montserrat(
        textStyle: TextStyle(
          color: base.bodyText2!.color,
          fontSize: 16,
        ),
      ),
      bodyText1: GoogleFonts.montserrat(
        textStyle: TextStyle(
          color: base.bodyText1!.color,
          fontSize: 14,
        ),
      ),
      button: GoogleFonts.montserrat(
        textStyle: TextStyle(
            color: base.button!.color,
            fontSize: 14,
            fontWeight: FontWeight.w600),
      ),
      caption: GoogleFonts.montserrat(
        textStyle: TextStyle(color: base.caption!.color, fontSize: 12),
      ),
      headline4: GoogleFonts.montserrat(
        textStyle: TextStyle(color: base.headline4!.color, fontSize: 34),
      ),
      headline3: GoogleFonts.montserrat(
        textStyle: TextStyle(
          color: base.headline3!.color,
          fontSize: 48,
        ),
      ),
      headline2: GoogleFonts.montserrat(
        textStyle: TextStyle(
          color: base.headline2!.color,
          fontSize: 60,
        ),
      ),
      headline1: GoogleFonts.montserrat(
        textStyle: TextStyle(
          color: base.headline1!.color,
          fontSize: 96,
        ),
      ),
      headline5: GoogleFonts.montserrat(
        textStyle: TextStyle(
          color: base.headline5!.color,
          fontSize: 24,
        ),
      ),
      overline: GoogleFonts.montserrat(
        textStyle: TextStyle(
          color: base.overline!.color,
          fontSize: 10,
        ),
      ),
    );
  }

  static ThemeData _buildDarkTheme() {
    Color primaryColor = HexColor(globals.primaryDarkColorString);
    final ThemeData base = ThemeData.dark();
    final ColorScheme colorScheme = const ColorScheme.dark().copyWith(
      primary: primaryColor,
      secondary: primaryColor,
    );
    return base.copyWith(
      primaryColor: primaryColor,
      buttonColor: primaryColor,
      indicatorColor: Colors.white,
      accentColor: primaryColor,
      scaffoldBackgroundColor: const Color(0xFF212121),
      errorColor: const Color(0xFFB00020),
      buttonTheme: _buttonThemeData(colorScheme),
      dialogTheme: _dialogTheme(),
      cardTheme: _cardTheme(),
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
      accentTextTheme: _buildTextTheme(base.accentTextTheme),
    );
  }

  static ThemeData _buildLightTheme() {
    Color primaryColor = HexColor(globals.primaryRiderColorString);

    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: primaryColor,
    );
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      colorScheme: colorScheme,
      primaryColor: primaryColor,
      buttonColor: primaryColor,
      splashColor: Colors.white38,
      splashFactory: InkRipple.splashFactory,
      accentColor: primaryColor,
      backgroundColor: const Color(0xFFFFFFFF),
      errorColor: const Color(0xFFB00020),
      cursorColor: primaryColor,
      buttonTheme: _buttonThemeData(colorScheme),
      dialogTheme: _dialogTheme(),
      cardTheme: _cardTheme(),
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
      accentTextTheme: _buildTextTheme(base.accentTextTheme),
      platform: TargetPlatform.iOS,
    );
  }

  static ButtonThemeData _buttonThemeData(ColorScheme colorScheme) {
    return ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      colorScheme: colorScheme,
      textTheme: ButtonTextTheme.primary,
    );
  }

  static DialogTheme _dialogTheme() {
    return DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    );
  }

  static CardTheme _cardTheme() {
    return CardTheme(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 8,
      margin: EdgeInsets.all(0),
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
