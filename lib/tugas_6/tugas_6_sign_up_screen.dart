import 'package:belajar_flutter_ppkd/tugas_6/tugas_6_log_in_screen.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        title: Text("Berhasil Sign Up"),
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
          child: Text("Kembali ke Log in Screen"),
        ),
      ),
    );
  }
}
