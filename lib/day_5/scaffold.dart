import 'package:flutter/material.dart';

class ScaffoldDay5 extends StatelessWidget {
  const ScaffoldDay5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4EEFF),
      appBar: AppBar(
        backgroundColor: Color(0xFFDCD6F7),
        centerTitle: true,
        title: Text(
          "Caraku",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color(0xFF424874),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Nama: Bonar Wilfred",
            style: TextStyle(color: Color(0xFFA6B1E1)),
          ),
          Text("Umur: 25 tahun", style: TextStyle(color: Color(0xFFA6B1E1))),
          Text(
            "Pekerjaan: Developer",
            style: TextStyle(color: Color(0xFFA6B1E1)),
          ),
        ],
      ),
    );
  }
}
