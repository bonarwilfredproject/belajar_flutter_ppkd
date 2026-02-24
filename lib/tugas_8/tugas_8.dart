import 'package:belajar_flutter_ppkd/tugas_7/tugas_7.dart';
import 'package:belajar_flutter_ppkd/tugas_8/tugas_8_tentang_aplikasi.dart';
import 'package:flutter/material.dart';

class Tugas8Flutter extends StatefulWidget {
  const Tugas8Flutter({super.key});

  @override
  State<Tugas8Flutter> createState() => _Tugas8FlutterState();
}

class _Tugas8FlutterState extends State<Tugas8Flutter> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = [
    Tugas7Flutter(),
    Tugas8TentangAplikasi(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: "Tentang Aplikasi",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
      body: _widgetOptions[_selectedIndex],
    );
  }
}
