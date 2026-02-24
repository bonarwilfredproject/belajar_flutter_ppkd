import 'package:flutter/material.dart';

class Tugas7CheckBox extends StatefulWidget {
  const Tugas7CheckBox({super.key});

  @override
  State<Tugas7CheckBox> createState() => _Tugas7CheckBoxState();
}

class _Tugas7CheckBoxState extends State<Tugas7CheckBox> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                value: _isChecked,
                onChanged: (value) {
                  setState(() {
                    _isChecked = value ?? false;
                  });
                },
              ),
              Text("Saya menyetujui semua persyaratan yang berlaku"),
            ],
          ),
          Text(
            _isChecked
                ? "Lanjutkan pendaftaran diperbolehkan"
                : "Anda belum bisa melanjutkan",
          ),
        ],
      ),
    );
  }
}
