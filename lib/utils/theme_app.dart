import 'package:flutter/material.dart';

ThemeData buildAppTheme() {
  return ThemeData(
    // Set the primary color
    primaryColor: const Color.fromRGBO(232, 185, 175, 1),

    // Set the scaffold background color
    scaffoldBackgroundColor: const Color.fromRGBO(227, 229, 228, 1),

    // Define the app bar theme
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromRGBO(232, 185, 175, 1),
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),

    // Set the card color
    cardColor: const Color.fromRGBO(232, 185, 175, 1),

    // Define text theme
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: Colors.white), // Title text
      titleLarge: TextStyle(color: Colors.white), // Card subtitle text
      bodyLarge: TextStyle(color: Colors.black), // Main body text
      bodyMedium: TextStyle(color: Colors.black), // Secondary body text
    ),

    // Set the icon theme for heart icons
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),

    // Define floating action button theme
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color.fromRGBO(232, 185, 175, 1),
      foregroundColor: Colors.white, // Icon color
    ),

    // Define button themes (like share button in detail page)
    buttonTheme: const ButtonThemeData(
      buttonColor: Color.fromRGBO(232, 185, 175, 1), // Share button background
      textTheme: ButtonTextTheme.primary, // Text color in buttons
    ),

    // Other components like dialog, input decoration, etc. can also be customized
  );
}

