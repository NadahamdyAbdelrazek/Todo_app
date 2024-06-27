
import 'package:flutter/material.dart';
import 'package:todo_app/login/auth_screen.dart';

import 'Home_Screen.dart';


class splashScreen extends StatefulWidget {
  static const String routename="splashscreen";
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(AuthScreen.routename);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Image.asset("assets/images/splash@3x.png"))
      ,);
  }
}
