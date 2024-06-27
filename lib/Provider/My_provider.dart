
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProvider extends ChangeNotifier {
  String language="en";
  ThemeMode Mytheme=ThemeMode.light;
  changeLanguage(String code) async {
    if (code == language) {
      return;
    }
    language= code;
    notifyListeners();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("lang", code);
  }
  changeMode(ThemeMode mode) async {
    if (mode == Mytheme) {
      return;
    }
    Mytheme = mode;
    notifyListeners();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isDark", mode == ThemeMode.dark);
  }
    getBacKgroundImage(){
    if(Mytheme==ThemeMode.light){
      return Colors.white;

    }else{
      return Color(0xff060E1E);
    }

   }
  Future<void> getLang() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? lang = prefs.getString("lang");
    if (lang != null) {
      language = lang;
      notifyListeners();
    }
  }

  Future<void> getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isDark = prefs.getBool("isDark");
    if (isDark != null) {
      if (isDark) {
        Mytheme = ThemeMode.dark;
      } else {
        Mytheme = ThemeMode.light;
      }
      notifyListeners();
    }
  }
}
