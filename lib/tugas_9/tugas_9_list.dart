import 'package:flutter/material.dart';

class Tugas9List extends StatelessWidget {
  const Tugas9List({super.key});

  static const List<String> kategori = [
    "Nama Event",
    "Lokasi Event",
    "ID",
    "Jumlah Peserta",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        itemCount: kategori.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text(kategori[index]));
        },
      ),
    );
  }
}
