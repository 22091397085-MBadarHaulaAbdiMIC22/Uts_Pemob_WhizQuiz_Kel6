import 'package:flutter/material.dart';
import 'QuestionList.dart';

class ResultDialog extends StatelessWidget {
  final int score;
  final int totalQuestions;

  const ResultDialog({
    required this.score,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Quiz Selesai'),
      content: Text('Skor kamu: $score/$totalQuestions'),
      actions: <Widget>[
        TextButton(
          child: Text('Restart Quiz'),
          onPressed: () {
            // Untuk merestart kuis, kita perlu mengarahkan user kembali ke halaman kuis
            Navigator.of(context).pop(); // Tutup dialog
            Navigator.of(context).pop(); // Tutup halaman kuis
            Navigator.pushReplacement( // Buka kembali halaman kuis
              context,
              MaterialPageRoute(builder: (context) => QuizPage()),
            );
          },
        ),
        TextButton(
          child: Text('Close'),
          onPressed: () {
            Navigator.of(context).pop(); // Tutup dialog
          },
        ),
      ],
    );
  }
}
