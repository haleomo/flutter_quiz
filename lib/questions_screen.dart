import 'package:flutter/material.dart';
import 'package:quizit/answer.dart';
import 'package:quizit/answer_button.dart';
import 'package:quizit/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  final Color textColor;

  const QuestionsScreen({
    super.key,
    required this.textColor,
    required this.onSelectAnswer,
  });

  final void Function(Answer answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  final maxCurrentQuestionIndex =  - 1;

  void answerQuestion(Answer selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(
      () {
          currentQuestionIndex++;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 30),
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 206, 185, 185),
                fontSize: 28.0,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map(
              (answer) {
                return AnswerButton(
                  answerText: answer.answerText,
                  onTap: () {
                    answerQuestion(answer);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
