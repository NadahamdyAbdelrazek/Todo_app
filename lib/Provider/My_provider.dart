
import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  String language="en";
  ThemeMode Mytheme=ThemeMode.light;
  changeLanguage(String code){
    language=code;
    notifyListeners();

  }
  changeMode(ThemeMode mode){
    Mytheme=mode;
    notifyListeners();
  }
    getBacKgroundImage(){
    if(Mytheme==ThemeMode.light){
      return Colors.white;

    }else{
      return Color(0xff060E1E);
    }

   }
}
