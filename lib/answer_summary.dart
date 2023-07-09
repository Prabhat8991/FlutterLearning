import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';

class AnswerSummary extends StatelessWidget {
  const AnswerSummary(this.answerSummary, {super.key});

  final List<Map<String, Object>> answerSummary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 150,
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: answerSummary.map((data) {
            return Column(
              children: [
                Text("Question Number ${(data["QuestionIndex"] as int) + 1}"),
                Text(
                    "Question:  ${questions[data["QuestionIndex"] as int].question}"),
                Text("Selected Answer: ${data["SelectedAnswer"] as String}"),
                Text(
                    "Correct Answer:  ${questions[data["QuestionIndex"] as int].answers[0]}")
              ],
            );
          }).toList(),
        )));
  }
}
