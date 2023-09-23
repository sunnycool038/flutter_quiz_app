import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
  });

  final List<String> chosenAnswers;

  List<Map<String, Object>> get SummaryData {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i].text,
        "correct_answers": questions[i].answers[0],
        "user_answer": chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final numOfTotalQuestions = questions.length;
    final numOfCorrctQuestions = SummaryData.where(
        (data) => data['user_answer'] == data['correct_answers']).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You have answered $numOfCorrctQuestions out of $numOfTotalQuestions question correctly!",
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(SummaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton(onPressed: () {}, child: const Text("Restart Quiz..."))
          ],
        ),
      ),
    );
  }
}
