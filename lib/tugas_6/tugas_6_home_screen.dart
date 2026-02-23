import 'package:belajar_flutter_ppkd/tugas_6/tugas_6_log_in_screen.dart';
import 'package:flutter/material.dart';

class Tugas6HomeScreen extends StatelessWidget {
  const Tugas6HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        title: Image.asset(
          "lib/assets/images/5a4e432a2da5ad73df7efe7a 1.png",
          height: 40,
        ),
        centerTitle: true,
        backgroundColor: Color(0xffFFFFFF),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Tugas6LogInScreen()),
            );
          },
          child: Text("Log Out"),
        ),
      ),
    );
  }
}
