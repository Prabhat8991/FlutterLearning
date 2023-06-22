import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';

import 'landing_page.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {

  var activeScreen = 'start-screen';

  void handleStartQuizClick() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: activeScreen == 'start-screen'
            ? LandingPage(handleStartQuizClick)
            : const QuestionsScreen(),
      ),
    );
  }
}
