import 'package:flutter/material.dart';
import 'package:flutterfastfoofapp/screens/category_screen.dart';

import 'screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Food App',
theme: ThemeData(
  backgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
  ),
),
      home: SplashScreen(),
    );
  }
}



