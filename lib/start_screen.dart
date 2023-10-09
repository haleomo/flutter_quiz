import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  final Color textColor;
  final void Function() startQuiz;

  const StartScreen({
    super.key,
    required this.textColor,
    required this.startQuiz,
  });

  @override
  Widget build(BuildContext context) {
    final buttonStyle = OutlinedButton.styleFrom(
      foregroundColor: textColor,
    );

    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        // Settign transparency can be done with Opacity (more processing intensive)
        // Or by defining the opacity in an ARGB object.
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 200,
          color: const Color.fromARGB(95, 240, 7, 240),
        ),
        /* Opacity( opacity: 0.1, child: Image.asset('assets/images/quiz-logo.png', width: 200),), */
        const SizedBox(height: 60),
        Text(
          'Learn Flutter the fun way!',
          style: GoogleFonts.lato(
            color: textColor,
            fontSize: 28.0,
          ),
        ),
        const SizedBox(height: 60),
        OutlinedButton.icon(
          style: buttonStyle,
          onPressed: () {
            startQuiz();
          },
          label: Text(
            'Start Quiz',
            style: TextStyle(
              color: textColor,
              fontSize: 20.0,
            ),
          ),
          icon: const Icon(Icons.start_sharp),
        ),
      ]),
    );
  }
}
