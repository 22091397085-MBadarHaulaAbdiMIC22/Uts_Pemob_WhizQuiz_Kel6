import 'package:flutter/material.dart';
import 'question.dart';
import 'package:WhizQuizz/Main.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<Question> questions = [
    Question(
      questionText: 'Unesa Ketintang ada dimana?',
      options: ['Jombang', 'Malang', 'Surabaya', 'Magetan'],
      correctAnswerIndex: 2,
    ),
    Question(
      questionText: 'Mi dalam program Vokasi merupakan singkatan dari?',
      options: [
        'Makanan Instan ',
        'Manajemen Informatika',
        'Manajemen Ilmu',
        'Manusia Ikan'
      ],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'Yang termasuk Software adalah?',
      options: ['VGA', 'Monitor', 'Keyboard', 'CPU-Z'],
      correctAnswerIndex: 3,
    ),
    Question(
      questionText: 'Dimanakah dibawah ini yang merupakan kepanjangan OOP?',
      options: [
        'Object Optimization Programming',
        'Operating Overhead Programming',
        'Object-Oriented Programming',
        'Output Oriented Programming',
      ],
      correctAnswerIndex: 2,
    ),
    Question(
      questionText: 'Apa kepanjangan dari UI?',
      options: [
        'User Interface',
        'User Inform',
        'User Experience',
        'User Intellegent'
      ],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: 'Apa yang dimaksud dengan Cloud Computing?',
      options: [
        'Penggunaan Sistem Didalam Ruangan',
        'Penyediaan Layanan IT',
        'Area Penyimpanan Data',
        'Platform Live Streaming'
      ],
      correctAnswerIndex: 2,
    ),
    Question(
      questionText: 'Apa Fungsi SQL dalam Pengembangan Database?',
      options: [
        'Memanipulasi Tampilan Website',
        'Mengatur UX Pada Web',
        'Membuat Desain Grafis',
        'Mengelola dan Mengambil Data dari Database'
      ],
      correctAnswerIndex: 3,
    ),
    Question(
      questionText: 'Apa yang dimaksud dengan "loop/looping"?',
      options: [
        'Sebuah Operasi yang Diulang Berulang Kali',
        'Sebuah Perangkat Lunak',
        'Sebuah Jenis Tipe Data',
        'Opreasi yang Dilakukan Satu Kali'
      ],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: 'Dimana gedung kuliah untuk prodi D4 Manajemen Informatika?',
      options: ['Gedung K2', 'Gedung K6', 'Gedung K9', 'Gedung K1'],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: 'Apa kepanjangan dari DNS?',
      options: [
        'Domain Naming System',
        'Data Network System',
        'Domain Name System',
        'Digital Network System'
      ],
      correctAnswerIndex: 2,
    ),
  ];

  int currentQuestionIndex = 0;
  int score = 0;

  void checkAnswer(int selectedIndex) {
    if (selectedIndex == questions[currentQuestionIndex].correctAnswerIndex) {
      setState(() {
        score++;
      });
    }
    nextQuestion();
  }

  void nextQuestion() {
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
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
          content: Text('Skor kamu: $score/${questions.length}'),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.teal[300],
        title: Text(
          'Selamat Mengerjakan 😍',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("IMG/bgfixx.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Logo di tengah
            Center(
              child: Image.asset(
                'IMG/logo.png',
                width: 300, // Sesuaikan ukuran logo
                height: 200,
              ),
            ),
            SizedBox(height: 50.0),
            // Pertanyaan
            Text(
              questions[currentQuestionIndex].questionText,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30.0),
            // Tombol jawaban
            ...questions[currentQuestionIndex].options
                .asMap()
                .entries
                .map((option) {
              int index = option.key;
              String text = option.value;
              return ElevatedButton(
                onPressed: () {
                  checkAnswer(index);
                },
                child: Text(text),
              );
            }).toList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        },
        child: Icon(Icons.home),
        backgroundColor: Colors.teal[300],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}