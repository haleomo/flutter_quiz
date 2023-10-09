import 'package:flutter/material.dart';
import 'package:quizit/answer.dart';
import 'package:quizit/data/questions.dart';
import 'package:quizit/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.textColor,
    required this.selectedAnswers,
    required this.numberQuestions,
    required this.onRestart,
  });

  final List<Answer> selectedAnswers;
  final int numberQuestions;
  final Color textColor;
  final Function() onRestart;


  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedAnswers.length; i++) {
        String correctAnswerText = questions[i].answers.where((answer) => answer.correctAnswer == true ).elementAt(0).answerText;
        summary.add({
            'question_index': i,
            'question_text': questions[i].text,
            'correct_answer': correctAnswerText,
            'selected_answer': selectedAnswers[i].answerText,
          },
        );      

    }

    return summary;
  }


  @override
  Widget build(BuildContext context) {
    var correctAnswers = selectedAnswers
            .where((answer) => answer.correctAnswer == true)
            .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You Answered $correctAnswers of $numberQuestions correctly!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(questionsSummary: getSummaryData()),
            Padding(
              padding: const EdgeInsets.only(top: 20.0,),
              child: ElevatedButton.icon(
                onPressed: onRestart,
                icon : const Icon(Icons.restart_alt, size: 24.0,),
                label: const Text(
                  'Restart Quiz!',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
