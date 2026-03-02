import 'package:belajar_flutter_ppkd/database/preferences.dart';
import 'package:belajar_flutter_ppkd/tugas_10/tugas_10_form.dart';
import 'package:flutter/material.dart';

class Tugas10Konfirmasi extends StatelessWidget {
  const Tugas10Konfirmasi({
    super.key,
    required this.namaLengkap,
    required this.kota,
  });

  final String namaLengkap;
  final String kota;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tugas 10 Konfirmasi")),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text("Terima Kasih, $namaLengkap dari $kota telah mendaftar"),
              ElevatedButton(
                onPressed: () {
                  PreferenceHandler().deleteRegistered();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Tugas10Form();
                      },
                    ),
                    (route) {
                      return false;
                    },
                  );
                },
                child: Text("Back"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
