import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/data/questions.dart';
import 'landing_page.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {

  final List<String> selectedAnswers = [];

  var activeScreen = 'start-screen';

  void addSelectedAnswer(String selectedAnswer) {
    selectedAnswers.add(selectedAnswer);
    if (questions.length == selectedAnswers.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void handleStartQuizClick() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = LandingPage(handleStartQuizClick);
    if (activeScreen == 'start-screen') {
      currentScreen = LandingPage(handleStartQuizClick);
    } else if (activeScreen == 'result-screen') {
      currentScreen =  ResultScreen(selectedAnswers);
    } else {
      currentScreen = QuestionsScreen(onAnswerSelected: addSelectedAnswer);
    }
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.blue,
            body: currentScreen,
    )
    ,
    );
  }
}
