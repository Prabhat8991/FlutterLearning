import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/answer_summary.dart';

class ResultScreen extends StatelessWidget {

  const ResultScreen(this.selectedAnswers, {super.key});

  final List<String> selectedAnswers;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> answerSummary = [];
    for (var i = 0; i < selectedAnswers.length; i++) {
      answerSummary.add({
        "QuestionIndex": i,
        "Question": questions[i].question,
        "CorrectAnswer": questions[i].answers[0],
        "SelectedAnswer": selectedAnswers[i]
      });
    }
    return answerSummary;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          Text("You have answered X out of Y questions", style: GoogleFonts.lato(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),),
          const SizedBox(height: 30,),
          const SizedBox(height: 30,),
          AnswerSummary(getSummaryData()),
          const SizedBox(height: 30,),
          Text("Start Again")
        ],
      ),
    );
  }
}
