import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(), // Menggunakan MyHomePage sebagai halaman utama
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6EB9C6), // Warna latar belakang #59D8C1
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'PROFILE',
          style: TextStyle(color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white70,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView( // Menggunakan SingleChildScrollView agar tampilan dapat di-scroll
          child: Column(
            children: [
              buildCard(
                name: 'M. Badar Haula Abdi',
                idInfo: '22091397085 / UI/UX Designer',
                phone: '081334712470',
                email: 'abdi@gmail.com',
                imagePath: 'IMG/fotohaula.png',
              ),
              buildCard(
                name: 'Nur Puspita Amalia',
                idInfo: '22091397093 / Data Scientist',
                phone: '083857694858',
                email: 'puspita01@gmail.com',
                imagePath: 'IMG/fotopuspita.png',
              ),
              buildCard(
                name: 'Ahmad Balya D',
                idInfo: '22091397095 / Web Developer',
                phone: '081358024205',
                email: 'balya@gmail.com',
                imagePath: 'IMG/fotobalya.png',
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
        },
        child: Icon(Icons.arrow_back),
        backgroundColor: Colors.teal[300],
      ),
    );
  }

  Widget buildCard({required String name, required String idInfo, required String phone, required String email, required String imagePath}) {
    return Column(
      children: [
        SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(imagePath),
          ),
        ),
        SizedBox(height: 10),
        Text(
          name,
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          idInfo,
          style: TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 2),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 3.0, horizontal: 5.0),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.phone, color: Colors.black),
                    SizedBox(width: 10.0),
                    Text(
                      phone,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 3.0, horizontal: 5.0),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.email, color: Colors.black),
                    SizedBox(width: 10.0),
                    Text(
                      email,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}