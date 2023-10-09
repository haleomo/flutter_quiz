import 'package:quizit/models/quiz_question.dart';
import 'package:quizit/answer.dart';


final questions = [
  QuizQuestion(
    'What are the main building blocks of Flutter UIs?',
    [
      Answer(answerText: 'Widgets', correctAnswer: true),
      Answer(answerText: 'Components',),
      Answer(answerText: 'Blocks',), 
      Answer(answerText: 'Functions',), 
    ],
  ),
  QuizQuestion('How are Flutter UIs built?', [
    Answer(answerText: 'By combining widgets in code', correctAnswer: true),
    Answer(answerText: 'By combining widgets in a visual editor',),
    Answer(answerText: 'By defining widgets in config files',),
    Answer(answerText: 'By using XCode for iOS and Android Studio for Android',),
  ]),
  QuizQuestion(
    'What\'s the purpose of a StatefulWidget?',
    [
      Answer(answerText: 'Update UI as data changes', correctAnswer: true),
      Answer(answerText: 'Update data as UI changes',),
      Answer(answerText: 'Ignore data changes',),
      Answer(answerText: 'Render UI that does not depend on data',),
    ],
  ),
  QuizQuestion(
    'Which widget should you try to use more often: StatelessWidget or StatefulWidget?',
    [
      Answer(answerText: 'StatelessWidget', correctAnswer: true),
      Answer(answerText: 'StatefulWidget',),
      Answer(answerText: 'Both are equally good',),
      Answer(answerText: 'None of the above',),
    ],
  ),
  QuizQuestion(
    'What happens if you change data in a StatelessWidget?',
    [
      Answer(answerText: 'The UI is not updated', correctAnswer: true),
      Answer(answerText: 'The UI is updated',),
      Answer(answerText: 'The closest StatefulWidget is updated',),
      Answer(answerText: 'Any nested StatefulWidgets are updated',),
    ],
  ),
  QuizQuestion(
    'How should you update data inside of StatefulWidgets?',
    [
      Answer(answerText: 'By calling setState()', correctAnswer: true),
      Answer(answerText: 'By calling updateData()',),
      Answer(answerText: 'By calling updateUI()',),
      Answer(answerText: 'By calling updateState()',),
    ],
  ),
];
