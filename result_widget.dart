import 'package:flutter/material.dart';
import 'package:my_app/models/question.dart';

class ResultWidget extends StatelessWidget {
  const ResultWidget(
      {super.key, required this.answers, required this.startWidget});
  final List<String> answers;
  final void Function() startWidget;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Your Answer',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(
            width: double.infinity,
            height: 200,
            child: ListView.builder(
              itemCount: answers.length,
              itemBuilder: (context, index) {
                Color trueFalseColor;
                if (questions[index].answer[0] == answers[index]) {
                  trueFalseColor = Colors.blue;
                } else {
                  trueFalseColor = Colors.red;
                }
                return Text(
                  answers[index],
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 18, color: trueFalseColor),
                );
              },
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: startWidget,
            child: const Text('Restart?'),
          ),
        ],
      ),
    );
  }
}
