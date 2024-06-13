import 'package:chatapp/resources/colors.dart';
import 'package:flutter/material.dart';

ThemeData theme = ThemeData.dark(useMaterial3: false).copyWith(
  colorScheme: ColorScheme.fromSeed(
    seedColor: ColorsConstants.secondaryBackground,
    brightness: Brightness.dark,
  ),
  textTheme: const TextTheme(
    titleSmall: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
  ),
  scaffoldBackgroundColor:
      ColorsConstants.primaryBackground, // Set your background color here
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white, // Text color
        textStyle: const TextStyle(fontWeight: FontWeight.w300)),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colors.white, // Text color for text buttons
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(),
  ),
  cardTheme: const CardTheme(
      color: ColorsConstants.primaryBackgroundLight, elevation: 4),
  inputDecorationTheme: const InputDecorationTheme(
    border: InputBorder.none,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor:ColorsConstants.secondaryBackground 
  )
);
