import 'package:flutter/material.dart';

class Gambar extends StatelessWidget {
  const Gambar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 72,
          width: 72,
          child: Image.asset("lib/assets/images/logo.png"),
        ),
      ),
    );
  }
}
