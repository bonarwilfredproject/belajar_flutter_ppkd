import 'package:flutter/material.dart';

class Tugas7DropDown extends StatefulWidget {
  const Tugas7DropDown({super.key});

  @override
  State<Tugas7DropDown> createState() => _Tugas7DropDownState();
}

class _Tugas7DropDownState extends State<Tugas7DropDown> {
  String? selectedJenis;
  List<String> jenisJenis = ["Elektronik", "Pakaian", "Makanan", "Lainnya"];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          DropdownButton(
            hint: Text(
              selectedJenis == null ? "Pilih kategori" : "$selectedJenis",
            ),
            value: selectedJenis,
            items: jenisJenis.map((String value) {
              return DropdownMenuItem(value: value, child: Text(value));
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedJenis = value;
              });
            },
          ),
          Text(
            selectedJenis == null
                ? "Anda memilih kategori:"
                : "Anda memilih kategori: $selectedJenis",
          ),
        ],
      ),
    );
  }
}
