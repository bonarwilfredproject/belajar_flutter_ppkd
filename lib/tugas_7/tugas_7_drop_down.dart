import 'package:flutter/material.dart';

class Tugas7DropDown extends StatefulWidget {
  const Tugas7DropDown({super.key});

  @override
  State<Tugas7DropDown> createState() => _Tugas7DropDownState();
}

class _Tugas7DropDownState extends State<Tugas7DropDown> {
  String? selected;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          DropdownButton(
            hint: Text(selected == null ? "Pilih kategori" : "$selected"),
            value: selected,
            items: ["Elektronik", "Pakaian", "Makanan", "Lainnya"].map((
              String value,
            ) {
              return DropdownMenuItem(value: value, child: Text(value));
            }).toList(),
            onChanged: (value) {
              setState(() {
                selected = value;
              });
            },
          ),
          Text(
            selected == null
                ? "Anda memilih kategori:"
                : "Anda memilih kategori: $selected",
          ),
        ],
      ),
    );
  }
}
