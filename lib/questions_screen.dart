import 'package:flutter/material.dart';
import 'package:quiz_app/answers_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onAnswerSelected});

  final void Function(String selectedAnswer) onAnswerSelected;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void handleAnswerClick(String selectedAnswer) {
    widget.onAnswerSelected(selectedAnswer);
    setState(() {
       currentQuestionIndex+=1;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            margin: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(questions[currentQuestionIndex].question,
                style: GoogleFonts.lato(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),),
                const SizedBox(height: 50),
                ...questions[currentQuestionIndex].getShuffleAnswers().map((answer) {
                  return AnswerButton(onTap: () {
                    handleAnswerClick(answer);
                  }, answerText: answer);
                })
              ],
            )));
  }
}
