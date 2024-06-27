import 'package:flutter/material.dart';

class MyThemeData {
  static Color primarycolor = Color(0xff5D9CEC);
  static Color drakcolor = Color(0xff060E1E);
  static Color lightcolor = Color(0xffDFECDB);
  static ThemeData lighttheme = ThemeData(
    appBarTheme: AppBarTheme(
        backgroundColor: primarycolor,
        centerTitle: false,
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700)),
    bottomNavigationBarTheme:
    BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primarycolor,
        unselectedItemColor: Color(0xffC8C9CB),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(size: 22),
        unselectedIconTheme: IconThemeData(size: 22)
    ),
    textTheme: TextTheme(
        bodyLarge: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),
        bodyMedium: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),
        bodySmall: TextStyle(fontSize: 20,fontWeight: FontWeight.w400)

    ),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.white,
    )
  );
  static ThemeData darktheme = ThemeData(
      appBarTheme: AppBarTheme(
          backgroundColor: primarycolor,
          centerTitle: false,
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.w700)),
      bottomNavigationBarTheme:
      BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: primarycolor,
          unselectedItemColor: Color(0xffC8C9CB),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedIconTheme: IconThemeData(size: 22),
          unselectedIconTheme: IconThemeData(size: 22)
      ),
      textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),
          bodyMedium: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),
          bodySmall: TextStyle(fontSize: 20,fontWeight: FontWeight.w400)

      ),
      bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.black)
  );
}
