import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  final List<Map<String, Object>> questionsSummary;
  const QuestionsSummary({super.key, required this.questionsSummary});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: questionsSummary.map(
            (question) {
              var color =
                  (question['selected_answer'] == question['correct_answer'])
                      ? Color.fromARGB(255, 107, 240, 154)
                      : Color.fromARGB(255, 242, 79, 79);
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                         mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 25,
                            height: 25,
                            alignment: Alignment.topLeft,
                            decoration: BoxDecoration(
                              color: color,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                ((question['question_index'] as int) + 1)
                                    .toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const SizedBox(height: 20,),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            question['question_text'] as String,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Your Answer: ${question['selected_answer']}",
                          style: const TextStyle(
                            color: Color.fromARGB(255, 238, 165, 233),
                            fontSize: 14.0,
                          ),
                        ),
                        Text(
                          "Correct Answer: ${question['correct_answer']}",
                          style: const TextStyle(
                            color: Color.fromARGB(255, 141, 160, 237),
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
