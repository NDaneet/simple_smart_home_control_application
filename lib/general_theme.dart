import "package:flutter/material.dart";

class GeneralTheme {
  static TextTheme lightTextTheme = const TextTheme(
    bodyLarge: TextStyle(
      fontFamily: "SourceSans",
      fontWeight: FontWeight.w600,
      fontSize: 28.0,
      color: Colors.black,
    ),
    //Decided not to define new style for loginbutton, so i will use copyWith on this bodySmall...NOTE
    bodyMedium: TextStyle(
      fontFamily: "SourceSans",
      fontWeight: FontWeight.w400,
      fontSize: 16.0,
      color: Colors.black,
    ),
    titleMedium: TextStyle(
      fontFamily: "SourceSans",
      fontWeight: FontWeight.w200,
      fontSize: 15.0,
      color: Colors.black,
    ),
  );

  static TextTheme darkTextTheme = const TextTheme(
    bodyLarge: TextStyle(
      fontFamily: "SourceSans",
      fontWeight: FontWeight.w600,
      fontSize: 28.0,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontFamily: "SourceSans",
      fontWeight: FontWeight.w400,
      fontSize: 16.0,
      color: Colors.white,
    ),
    titleMedium: TextStyle(
      fontFamily: "SourceSans",
      fontWeight: FontWeight.w200,
      fontSize: 16.0,
      color: Colors.black,
    ),
  );

  static ThemeData light() {
    return ThemeData(
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        elevation: 10.0,
        selectedItemColor: Colors.green[300],
        unselectedItemColor: Colors.blueGrey[200],
      ),
      cardColor: Colors.white,
      inputDecorationTheme: InputDecorationTheme(
          hintStyle: lightTextTheme.titleMedium,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 10.0),
            borderRadius: BorderRadius.all(
              Radius.circular(6.0),
            ),
          ),
          filled: true,
          fillColor: Colors.transparent),
      textTheme: lightTextTheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 3.0, backgroundColor: Colors.green[800],
          //still have issues with the text style and how it is just white instead of dark
          //for the elevated button
          textStyle: lightTextTheme.bodyMedium
              ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18.0),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.green[800], textStyle: lightTextTheme.bodyMedium
              ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18.0),
        ),
      ), colorScheme: ColorScheme.fromSeed(seedColor:const Color.fromARGB(255, 2, 120, 33)),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.blueGrey[900],
        elevation: 10.0,
        selectedItemColor: Colors.green[300],
        unselectedItemColor: Colors.blueGrey[200],
      ),
      cardColor: Colors.white,
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: darkTextTheme.titleMedium,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 10.0),
          borderRadius: BorderRadius.all(
            Radius.circular(6.0),
          ),
        ),
        filled: true,
        fillColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      textTheme: darkTextTheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 3.0, backgroundColor: Colors.green[800], disabledForegroundColor: Colors.green.withOpacity(0.38), disabledBackgroundColor: Colors.green.withOpacity(0.12),
          textStyle: darkTextTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.black),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.green[800], textStyle: darkTextTheme.bodyMedium
              ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18.0),
        ),
      ),
    );
  }
}
