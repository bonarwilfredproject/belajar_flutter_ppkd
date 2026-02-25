import 'package:belajar_flutter_ppkd/tugas_9/data_list_map.dart';
import 'package:flutter/material.dart';

class Tugas9ListMap extends StatelessWidget {
  const Tugas9ListMap({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        itemCount: kategori.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text("${kategori[index]["Nama Event"]}"),
            subtitle: Text(kategori[index]["Lokasi Event"]),
            leading: Text(kategori[index]["ID"]),
            trailing: Text("${kategori[index]["Jumlah Peserta"]} peserta"),
          );
        },
      ),
    );
  }
}
