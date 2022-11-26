import "package:flutter/material.dart";

class GeneralTheme {
  static TextTheme lightTextTheme = const TextTheme(
    bodyText1: TextStyle(
      fontFamily: "SourceSans",
      fontWeight: FontWeight.w600,
      fontSize: 28.0,
      color: Colors.black,
    ),
    //Decided not to define new style for loginbutton, so i will use copyWith on this bodySmall...NOTE
    bodyText2: TextStyle(
      fontFamily: "SourceSans",
      fontWeight: FontWeight.w400,
      fontSize: 16.0,
      color: Colors.black,
    ),
    subtitle1: TextStyle(
      fontFamily: "SourceSans",
      fontWeight: FontWeight.w200,
      fontSize: 15.0,
      color: Colors.black,
    ),
  );

  static TextTheme darkTextTheme = const TextTheme(
    bodyText1: TextStyle(
      fontFamily: "SourceSans",
      fontWeight: FontWeight.w600,
      fontSize: 28.0,
      color: Colors.white,
    ),
    bodyText2: TextStyle(
      fontFamily: "SourceSans",
      fontWeight: FontWeight.w400,
      fontSize: 16.0,
      color: Colors.white,
    ),
    subtitle1: TextStyle(
      fontFamily: "SourceSans",
      fontWeight: FontWeight.w200,
      fontSize: 16.0,
      color: Colors.black,
    ),
  );

  static ThemeData light() {
    return ThemeData(
      backgroundColor: Colors.green[100],
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        elevation: 10.0,
        selectedItemColor: Colors.green[300],
        unselectedItemColor: Colors.blueGrey[200],
      ),
      cardColor: Colors.white,
      inputDecorationTheme: InputDecorationTheme(
          hintStyle: lightTextTheme.subtitle1,
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
          elevation: 3.0,
          primary: Colors.green[800],
          //still have issues with the text style and how it is just white instead of dark
          //for the elevated button
          textStyle: lightTextTheme.bodyText2
              ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18.0),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: Colors.green[800],
          textStyle: lightTextTheme.bodyText2
              ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18.0),
        ),
      ),
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
        hintStyle: darkTextTheme.subtitle1,
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
          elevation: 3.0,
          primary: Colors.green[800],
          onSurface: Colors.green,
          textStyle: darkTextTheme.bodyText2?.copyWith(
              fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.black),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: Colors.green[800],
          textStyle: darkTextTheme.bodyText2
              ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18.0),
        ),
      ),
    );
  }
}
