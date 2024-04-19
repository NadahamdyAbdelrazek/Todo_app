import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Home_Screen.dart';
import 'package:todo_app/Provider/My_provider.dart';
import 'Splash_Screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main()  {
  runApp(ChangeNotifierProvider<MyProvider>(create: (context) => MyProvider() ,
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return MaterialApp(
      locale: Locale(provider.language),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // arbic
      ],

      debugShowCheckedModeBanner: false,
      initialRoute: splashScreen.routename,
      routes: {
        splashScreen.routename:(context) => splashScreen(),
      HomeScreen.routename:(context) => HomeScreen(),


      },
    );
  }
}
