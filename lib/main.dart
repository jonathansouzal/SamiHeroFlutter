import 'package:flutter/material.dart'; //Packages Are Used To Bulid App Quickly
import './screens/initial_splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sami Hero',
        home: InitialSplash());
  }
}
