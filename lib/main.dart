import 'package:flutter/material.dart';
import 'package:quiz_app_tutorial/screens/addquestion.dart';
import 'package:quiz_app_tutorial/screens/chatscreen.dart';
import 'package:quiz_app_tutorial/screens/flag.dart';
import 'package:quiz_app_tutorial/screens/homepage.dart';
import 'package:quiz_app_tutorial/screens/splashscreen.dart';

import '/screens/quiz_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData.light().copyWith(),
      home: SplashScreen(),
    );
  }
}
