import 'package:flutter/material.dart';

import 'be_natura_colors.dart';

class BeNaturaTheme {
  ThemeData beNatura = ThemeData(
    appBarTheme: const AppBarTheme(
      color: BeNaturaColors.primaryColor,
    ),
    // Define the default brightness and colors.
    brightness: Brightness.dark,
    primaryColor: BeNaturaColors.primaryColor,
    secondaryHeaderColor: BeNaturaColors.secondaryColor,

    visualDensity: VisualDensity.adaptivePlatformDensity,

    // Define the default font family.
    fontFamily: 'RobotoCondensed',

    // Define background app color
    scaffoldBackgroundColor: BeNaturaColors.lightBack,

    // Define the default `TextTheme`. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(fontSize: 36, fontStyle: FontStyle.italic),
      bodyMedium: TextStyle(fontSize: 14, fontFamily: 'Hind'),
    ),

  );
}
