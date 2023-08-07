import 'package:flutter/material.dart';

class StartWidget extends StatelessWidget {
  const StartWidget(this.startQuiz, {super.key});
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Start a new Quiz?'),
          TextButton(onPressed: startQuiz, child: const Text('Start'))
        ],
      ),
    );
  }
}
