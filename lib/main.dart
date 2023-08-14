import 'package:atelier02_ui/screens/bmi_screen.dart';
import 'package:atelier02_ui/screens/intro_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(GlobeApp());
}

class GlobeApp extends StatelessWidget {
  const GlobeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        routes: {
          '/': (context) => IntroScreen(),
          '/bmi': (context) => BmiScreen()
        },
        initialRoute: '/');
  }
}
