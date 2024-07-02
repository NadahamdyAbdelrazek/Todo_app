import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Theme/My_theme.dart';
import 'package:todo_app/home/Edit_task.dart';
import 'package:todo_app/home/Home_Screen.dart';
import 'package:todo_app/Provider/My_provider.dart';
import 'auth/auth_screen.dart';
import 'firebase_options.dart';
import 'home/Splash_Screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseFirestore.instance.disableNetwork();
  const fatalError = true;
  FlutterError.onError = (errorDetails) {
    if (fatalError) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
      // ignore: dead_code
    } else {
      FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
    }
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    if (fatalError) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      // ignore: dead_code
    } else {
      FirebaseCrashlytics.instance.recordError(error, stack);
    }
    return true;
  };
  runApp(ChangeNotifierProvider<MyProvider>(create: (context) =>
      MyProvider()..getLang()..getTheme(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return MaterialApp(
      locale: Locale(provider.language),
      theme: MyThemeData.lighttheme,
      darkTheme: MyThemeData.darktheme,
      themeMode: provider.Mytheme,
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
      title: "To Do List App",
      initialRoute: splashScreen.routename,
      routes: {
        splashScreen.routename: (context) => splashScreen(),
        HomeScreen.routename: (context) => HomeScreen(),
        EditTask.routename: (context) => EditTask(),
        AuthScreen.routename: (context) => AuthScreen(),



      },
    );
  }
}
