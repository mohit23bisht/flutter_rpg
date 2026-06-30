import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor = Color.fromRGBO(162, 29, 19, 1);
  static Color primaryAccent = Color.fromRGBO(120, 14, 14, 1);
  static Color secondaryColor = Color.fromRGBO(45, 45, 45, 1);
  static Color secondaryAccent = Color.fromRGBO(35, 35, 35, 1);
  static Color titleColor = Color.fromRGBO(200, 200, 200, 1);
  static Color textColor = Color.fromRGBO(150, 150, 150, 1);
  static Color highlightColor = Color.fromRGBO(212, 172, 13, 1);
  static Color successColor = Color.fromRGBO(9, 149, 110, 1);
}

ThemeData appTheme = ThemeData(
  //seed color
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),

  //appbar theme
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.secondaryColor,
    foregroundColor: AppColors.titleColor,
  ),
  //scaffolfd background
  scaffoldBackgroundColor: AppColors.secondaryAccent,

  //text theme
  textTheme: TextTheme(

    titleLarge: TextStyle(
      color: AppColors.titleColor,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(color: AppColors.textColor, fontSize: 16),
    headlineMedium: TextStyle(
      color: AppColors.titleColor,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  ),

  cardTheme: CardThemeData(
    color: AppColors.secondaryColor.withValues(alpha: 0.5),
    surfaceTintColor: Colors.transparent,
    shape: RoundedRectangleBorder(),
    shadowColor: Colors.transparent,
    margin: EdgeInsets.only(bottom: 15.0),
  ),

  // inputdecoration
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.secondaryColor.withValues(alpha: 0.5),
    border: InputBorder.none,
    prefixIconColor: AppColors.textColor,
  ),
);
