import 'package:flutter/material.dart';
import 'constants.dart';

final ThemeData appTheme = ThemeData(
    textTheme: const TextTheme(
        labelLarge: TextStyle(color: textColor),
        labelSmall: TextStyle(color: Colors.red),
        headlineLarge: TextStyle(color: textColor),
        headlineSmall: TextStyle(color: textColor)),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            backgroundColor: primaryColor, fixedSize: const Size(540, 70))),
    inputDecorationTheme: const InputDecorationTheme(
      isDense: true,
      enabledBorder:
          OutlineInputBorder(borderSide: BorderSide(color: borderColor)),
          disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: borderColor)),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: borderColor),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(padding: EdgeInsets.zero)));