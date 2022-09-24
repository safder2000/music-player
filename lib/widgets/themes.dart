import 'package:flutter/material.dart';

CustomTheme currentTheme = CustomTheme();

class CustomTheme with ChangeNotifier {
  static bool _isDarkTheme = true;
  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: const Color.fromARGB(255, 219, 242, 39),
      backgroundColor: Color.fromARGB(255, 1, 64, 64),
      scaffoldBackgroundColor: Color.fromARGB(255, 1, 64, 64),
      hintColor: const Color.fromARGB(255, 219, 242, 39),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: const Color.fromARGB(255, 219, 242, 39),
      ),
      textTheme: TextTheme(
        headline1: TextStyle(
          color: Color.fromARGB(255, 219, 242, 39),
        ),
        headline2: TextStyle(
          color: Color.fromARGB(255, 106, 120, 0),
        ),
        bodyText1: TextStyle(
          color: Color.fromARGB(255, 219, 242, 39),
        ),
        bodyText2: TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: Color.fromARGB(255, 0, 0, 0),
      backgroundColor: Color.fromARGB(255, 146, 146, 146),
      scaffoldBackgroundColor: Color.fromARGB(255, 146, 146, 146),
      hintColor: const Color.fromARGB(255, 219, 242, 39),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: Color.fromARGB(255, 0, 119, 255),
      ),
      textTheme: TextTheme(
        headline1: TextStyle(
          color: Color.fromARGB(255, 10, 10, 10),
        ),
        headline2: TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        bodyText1: TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        bodyText2: TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      ),
    );
  }
}
