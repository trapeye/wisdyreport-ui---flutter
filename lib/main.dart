import 'package:flutter/material.dart';
import 'package:wisdyreport/Screenone_StudentScore.dart';
import 'package:wisdyreport/Screentwo_OpenQuestions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        }),
        scaffoldBackgroundColor: Color(0xFFF9F9F9),
        primaryColor: Color(0xFF222260),
      ),
      title: 'Student Report',
      routes: {
        '/': (context) => StudentScore(),
      },
    );
  }
}
