import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'TriviaQuizGame.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trivia Quiz',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/quiz': (context) => TriviaQuizGame(),
      },
    );
  }
}
