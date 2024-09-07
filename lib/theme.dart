import 'package:flutter/material.dart';

final theme = ThemeData(
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: Color.fromARGB(255, 0, 180, 220), //thereby
  ),
  textTheme: TextTheme(
    // displayLarge: TextStyle(color: Colors.amber),
    displayMedium: TextStyle(
        fontFamily: 'Block',
        fontSize: 32,
        color: Colors.white,
        letterSpacing: 1.5),
    // displaySmall: TextStyle(color: Colors.amber),
    // headlineLarge: TextStyle(color: Colors.amber),
    // headlineMedium: TextStyle(color: Colors.amber),
    // headlineSmall: TextStyle(color: Colors.amber),
    titleLarge:
        TextStyle(color: Colors.white, fontSize: 28, fontFamily: 'Block'),
    titleMedium: TextStyle(
        color: Color.fromARGB(255, 100, 150, 0),
        fontSize: 28,
        fontFamily: 'Block'),
    // titleSmall: TextStyle(color: const Color.fromARGB(255, 7, 255, 193)),
    bodyLarge: TextStyle(
        color: Color.fromARGB(255, 0, 190, 235),
        fontSize: 20,
        fontFamily: 'Block'), // текст в текстовом поле
    bodyMedium:
        TextStyle(color: Colors.white, fontFamily: 'Block', fontSize: 24),
    // bodySmall: TextStyle(color: const Color.fromARGB(255, 109, 105, 91)),
    // labelLarge: TextStyle(color: const Color.fromARGB(255, 62, 0, 121)),
    // labelMedium: TextStyle(color: const Color.fromARGB(255, 156, 0, 0)),
    // labelSmall: TextStyle(color: const Color.fromARGB(255, 248, 245, 236)),
  ),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    foregroundColor: Colors.white,
    backgroundColor: Color.fromARGB(255, 0, 25, 50),
    elevation: 10,
    titleTextStyle: TextStyle(
        fontFamily: 'Block',
        fontSize: 32,
        color: Colors.white,
        letterSpacing: 1.5),
  ),
  colorScheme: const ColorScheme.light(
    primary: Color.fromARGB(255, 0, 25, 50),
    secondary: Color.fromARGB(255, 0, 80, 150),
    tertiary: Color.fromARGB(255, 0, 110, 184),
    surface: Color.fromARGB(255, 255, 255, 255),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0), // Закругленные углы
      borderSide: BorderSide(
        color: Colors.white, // Цвет рамки
        width: 1.0, // Толщина рамки
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(
        color: Colors.white, // Цвет рамки в фокусе
        width: 1.0,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(
        color:
            const Color.fromARGB(255, 0, 180, 220), // Цвет рамки при наведении
        width: 2.0,
      ),
    ),
    labelStyle: TextStyle(
      color: Colors.white, // Цвет текста метки
      fontSize: 16,
    ),
    hintStyle: TextStyle(
      color: Colors.white, // Цвет текста подсказки
      fontSize: 16,
    ),
    contentPadding: EdgeInsets.all(16.0),
  ),
);
