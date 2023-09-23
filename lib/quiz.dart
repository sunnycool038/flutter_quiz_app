import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/questions_screen.dart';
import 'package:quizapp/result_screen.dart';
import 'package:quizapp/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = "start-screen";
  final List<String> _selectedAnswers = [];
  //Widget? activeScreen;

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = "questions-screen";
    });
  }

  void chooseAnswer(String answer) {
    _selectedAnswers.add(answer);
    if (_selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = "results-screen";
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == "questions-screen") {
      screenWidget = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == "results-screen") {
      screenWidget = ResultsScreen(
        chosenAnswers: _selectedAnswers,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 78, 13, 151),
              Color.fromARGB(255, 107, 15, 168)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          //child: activeScreen,
          // child: activeScreen == "start-screen"
          //     ? StartScreen(switchScreen)
          //     : const QuestionScreen(),
          child: screenWidget,
        ),
      ),
    );
  }
}
