import 'package:flutter/material.dart';

class Tugas1Flutter extends StatelessWidget {
  const Tugas1Flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Nama: Bonar Wilfred", style: TextStyle(fontSize: 30)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on),
              Text("Jakarta Timur", style: TextStyle(fontSize: 20)),
            ],
          ),
          Text(
            "Sekarang atau tidak sama sekali, saya akan belajar harga mati!",
          ),
        ],
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Profil Saya",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
