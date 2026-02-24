import 'package:flutter/material.dart';

class Tugas8TentangAplikasi extends StatelessWidget {
  const Tugas8TentangAplikasi({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Text("Judul", style: TextStyle(fontWeight: FontWeight.bold)),
            Text("Tugas 8 Flutter"),
            Text(
              "Penjelasan Singkat",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              textAlign: TextAlign.center,
              "Aplikasi ini dibuat untuk memenuhi Tugas 8 Flutter, Drawer, Bottom Navigation Bar, dan Input Widget seperti Check Box, Switch, Drop Down Button, Date Picker, dan Time Picker.",
            ),
            Text("Nama Pembuat", style: TextStyle(fontWeight: FontWeight.bold)),
            Text("Bonar"),
            Text("Versi", style: TextStyle(fontWeight: FontWeight.bold)),
            Text("1"),
          ],
        ),
      ),
    );
  }
}
