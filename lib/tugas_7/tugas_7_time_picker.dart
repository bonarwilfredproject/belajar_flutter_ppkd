import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Tugas7TimePicker extends StatefulWidget {
  const Tugas7TimePicker({super.key});

  @override
  State<Tugas7TimePicker> createState() => _Tugas7TimePickerState();
}

class _Tugas7TimePickerState extends State<Tugas7TimePicker> {
  TimeOfDay? selectedTime;

  String getFormattedTime() {
    final dateTime = DateTime(
      0,
      0,
      0,
      selectedTime!.hour,
      selectedTime!.minute,
    );
    return DateFormat("hh:mm a").format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              selectedTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              setState(() {});
            },
            child: Text("Pilih Waktu Pengingat"),
          ),
          Text(
            selectedTime == null
                ? "Pengingat diatur pukul: "
                : "Pengingat diatur pukul: ${getFormattedTime()}",
          ),
        ],
      ),
    );
  }
}
