import 'package:flutter/material.dart';
import 'question.dart';
import 'package:WhizQuizz/Main.dart';

class QuizController extends StatefulWidget {
  final List<Question> questions;
  final Function(int) checkAnswer;

  const QuizController({Key? key, required this.questions, required this.checkAnswer}) : super(key: key);

  @override
  _QuizControllerState createState() => _QuizControllerState();
}

class _QuizControllerState extends State<QuizController>{
  int currentQuestionIndex = 0;
  int score = 0;

  void nextQuestion() {
    setState(() {
      if (currentQuestionIndex < widget.questions.length - 1) {
        currentQuestionIndex++;
      } else {
        // Quiz completed
        showResultDialog();
      }
    });
  }

  void showResultDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Quiz Selesai'),
          content: Text('Skor kamu: $score/${widget.questions.length}'),
          actions: <Widget>[
            TextButton(
              child: Text('Restart Quiz'),
              onPressed: () {
                setState(() {
                  currentQuestionIndex = 0;
                  score = 0;
                });
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[200],
      appBar: AppBar(
        backgroundColor: Colors.teal[300],
        title: Text('Simple Quiz'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Tidak perlu menampilkan pertanyaan di sini
            // Tetapi panggil fungsi untuk menampilkan pertanyaan dari QuizPage
            ElevatedButton(
              onPressed: () {
                widget.checkAnswer(currentQuestionIndex);
              },
              child: Text('Next Question'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.teal[300],
          height: 80.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
