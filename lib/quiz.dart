import 'package:flutter/material.dart';
import 'package:quizit/answer.dart';
import 'package:quizit/data/questions.dart';
import 'package:quizit/questions_screen.dart';
import 'package:quizit/start_screen.dart';
import 'package:quizit/results.dart';

const List<Color> colors = [
  Color.fromARGB(255, 25, 1, 76),
  Color.fromARGB(255, 74, 46, 122),
  Color.fromARGB(255, 114, 97, 130),
  Color.fromARGB(255, 171, 168, 173),
];

const beginAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;
const textColorBase = Color.fromARGB(255, 213, 137, 241);

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  List<Answer> selectedAnswers = [];

  @override
  void initState() {
    activeScreen =
        StartScreen(textColor: textColorBase, startQuiz: switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen(
          textColor: textColorBase, onSelectAnswer: chooseAnswer);
    });
  }

  void chooseAnswer(Answer answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length >= questions.length) {
      setState(() {
        
        activeScreen = ResultsScreen(
          textColor: textColorBase,
          selectedAnswers: selectedAnswers,
          numberQuestions: questions.length,
          onRestart: switchScreen,
        );
        selectedAnswers = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: colors,
              begin: beginAlignment,
              end: endAlignment,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
