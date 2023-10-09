
import 'package:quizit/answer.dart';

class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List <Answer> answers;

  List<Answer> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}