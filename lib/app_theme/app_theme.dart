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
            backgroundColor: primaryColor, minimumSize: const Size(540, 50))),
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