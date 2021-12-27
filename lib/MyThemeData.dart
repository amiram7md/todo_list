import 'package:flutter/material.dart';

class MyThemeData{

  static const Color primaryColor = Color.fromARGB(255, 255, 255, 255) ;
  static const Color primaryColorDark = Color.fromARGB(255, 20, 25, 34) ;
  static const Color scaffoldBackgroundColor = Color.fromARGB(255, 223, 236, 219) ;
  static const Color scaffoldBackgroundColorDark = Color.fromARGB(255, 6, 14, 30) ;
  static const Color appBar_iconsColor = Color.fromARGB(255, 93, 156, 236) ;


  static final ThemeData lightTheme =
      ThemeData(
        brightness: Brightness.light,
        primaryColor: MyThemeData.primaryColor,
        scaffoldBackgroundColor:  MyThemeData.scaffoldBackgroundColor,
        appBarTheme: AppBarTheme(
          backgroundColor: MyThemeData.appBar_iconsColor,
          titleTextStyle: TextStyle(
            color: MyThemeData.primaryColor
          ),
        )

      );
  static final ThemeData darkTheme =
    ThemeData(
      brightness: Brightness.dark,
      primaryColor: MyThemeData.primaryColorDark,
      scaffoldBackgroundColor:  MyThemeData.scaffoldBackgroundColorDark,
        appBarTheme: AppBarTheme(
            backgroundColor: MyThemeData.appBar_iconsColor,
            titleTextStyle: TextStyle(
              color: MyThemeData.primaryColorDark,
            )
        )
    );
}