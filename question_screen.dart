import 'package:flutter/material.dart';
import 'package:my_app/widgets/questions_widget.dart';
import 'package:my_app/widgets/result_widget.dart';
import 'package:my_app/widgets/start_widget.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  Widget? currentWidget;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentWidget = StartWidget(goToQuestionWidget);
  }

  void goToQuestionWidget() {
    setState(() {
      currentWidget = QuestionWidget(
        quizResult: goToResultWidget,
      );
    });
  }

  void goToStartWidget() {
    setState(() {
      currentWidget = StartWidget(goToQuestionWidget);
    });
  }

  void goToResultWidget(List<String> answer) {
    setState(() {
      currentWidget = ResultWidget(
        answers: answer,
        startWidget: goToStartWidget,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: currentWidget,
    );
  }
}
