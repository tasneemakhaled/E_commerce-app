import 'package:flutter/material.dart';

class MyTheme {
  static final MyTheme instance = MyTheme();
  ThemeData light = ThemeData.light(useMaterial3: true).copyWith(
    buttonTheme: ButtonThemeData(
      colorScheme: ColorScheme.light(
        background: Colors.brown,
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 20, color: Colors.brown),
      bodyLarge: TextStyle(
          fontSize: 18, color: Colors.white, fontWeight: FontWeight.normal),
      labelLarge:
          TextStyle(fontSize: 18, color: Color.fromARGB(255, 155, 224, 157)),
    ),
  );

  ThemeData dark = ThemeData.dark(useMaterial3: true).copyWith(
    buttonTheme: ButtonThemeData(
      colorScheme: ColorScheme.dark(
        background: Colors.grey,
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 20, color: Colors.blue),
      bodyLarge: TextStyle(
          fontSize: 18, color: Colors.yellow, fontWeight: FontWeight.normal),
      labelLarge: TextStyle(fontSize: 18, color: Colors.yellow),
    ),
  );
}
