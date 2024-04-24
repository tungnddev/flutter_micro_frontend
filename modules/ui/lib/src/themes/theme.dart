import 'package:flutter/material.dart';
import 'package:ui/src/themes/fonts.dart';

import 'colors.dart';

final uiTheme = ThemeData(
    primaryColor: UIColor.primaryColor,
    colorScheme: ColorScheme.fromSeed(
        seedColor: UIColor.primaryColor, primary: UIColor.primaryColor),
    textTheme: textTheme,
    fontFamily: UIFonts.sfPro,
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return UIColor.primaryColor;
        }
        return null;
      }),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return UIColor.primaryColor;
        }
        return null;
      }),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return UIColor.primaryColor;
        }
        return null;
      }),
      trackColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return UIColor.primaryColor;
        }
        return null;
      }),
    ));

final textTheme = TextTheme(
    headlineSmall: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
    titleLarge: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    labelLarge: TextStyle(
        fontSize: 16, fontWeight: FontWeight.w500, color: UIColor.primaryColor),
    bodyLarge: const TextStyle(
      fontSize: 16,
    ),
    bodyMedium: const TextStyle(
      fontSize: 14,
    ),
    bodySmall: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
    titleMedium: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    titleSmall: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500));
