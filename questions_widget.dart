import 'package:flutter/material.dart';
import 'package:my_app/models/question.dart';

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({super.key, required this.quizResult});
  final void Function(List<String>) quizResult;

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    answers.clear();
  }

  final List<String> answers = [];
  var currentQuestionIndex = 0;
  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[currentQuestionIndex];

    void answerQuestion() {
      if (currentQuestionIndex == questions.length - 1) {
        currentQuestionIndex = 0;
        widget.quizResult(answers);
      } else {
        setState(() {
          currentQuestionIndex++;
        });
      }
    }

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            currentQuestion.question,
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 22,
          ),
          ...currentQuestion.getShuffledAnswers().map((answer) {
            return SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  answerQuestion();
                  answers.add(answer);
                },
                child: Text(answer),
              ),
            );
          }),
        ],
      ),
    );
  }
}
