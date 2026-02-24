import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Tugas7DatePicker extends StatefulWidget {
  const Tugas7DatePicker({super.key});

  @override
  State<Tugas7DatePicker> createState() => _Tugas7DatePickerState();
}

class _Tugas7DatePickerState extends State<Tugas7DatePicker> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              selectedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
              );
              setState(() {});
            },
            child: Text("Pilih Tanggal Lahir"),
          ),
          Text(
            selectedDate == null
                ? "Tanggal Lahir: "
                : "Tanggal Lahir: ${DateFormat("dd MMMM yyyy", "ID").format(selectedDate!)}",
          ),
        ],
      ),
    );
  }
}
