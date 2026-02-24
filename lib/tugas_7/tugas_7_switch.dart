import 'package:flutter/material.dart';

class Tugas7Switch extends StatefulWidget {
  const Tugas7Switch({super.key});

  @override
  State<Tugas7Switch> createState() => _Tugas7SwitchState();
}

class _Tugas7SwitchState extends State<Tugas7Switch> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: isDark ? Colors.black : Colors.white,
      child: Center(
        child: Column(
          children: [
            Row(
              children: [
                Switch(
                  activeThumbColor: Colors.yellow,
                  value: isDark,
                  onChanged: (value) {
                    isDark = value;
                    setState(() {});
                  },
                ),
                Text(
                  "Aktifkan Mode Gelap",
                  style: TextStyle(color: isDark ? Colors.white : Colors.black),
                ),
              ],
            ),
            Text(
              isDark ? "Mode Gelap Aktif" : "Mode Terang Aktif",
              style: TextStyle(color: isDark ? Colors.white : Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
