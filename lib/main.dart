import 'package:WhizQuizz/Models/QuestionList.dart';
import 'package:WhizQuizz/Owner.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Halaman Utama',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.teal[300],
        title: Text('🎊 SELAMAT DATANG 🎊',
          style: TextStyle(
            fontWeight: FontWeight.bold,

          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("IMG/bgfixx.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Logo di tengah
            Center(
              child: Image.asset(
                'IMG/logo.png',
                width: 300, // Sesuaikan ukuran logo
                height: 250,
              ),
            ),
            SizedBox(height: 10.0), // Jarak antara logo dan tombol
            // Tombol Start Quiz
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizPage()),
                );
              },
              child: Text('Start Quiz'),
            ),
            SizedBox(height: 10.0), // Jarak antara tombol
            // Tombol Tentang Kita
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
              child: Text('Tentang Kita'),
            ),
          ],
        ),
      ),
    );
  }
}
