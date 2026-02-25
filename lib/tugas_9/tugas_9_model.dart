import 'package:belajar_flutter_ppkd/tugas_9/data_list_model_tugas_9.dart';
import 'package:flutter/material.dart';

class Tugas9Model extends StatelessWidget {
  const Tugas9Model({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        itemCount: dataPeserta.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(dataPeserta[index].foto),
            ),
            title: Text(dataPeserta[index].nama),
            subtitle: Text(dataPeserta[index].telp),
            trailing: Text(dataPeserta[index].waktu),
          );
        },
      ),
    );
  }
}
