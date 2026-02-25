import 'package:belajar_flutter_ppkd/tugas_9/tugas_9_list.dart';
import 'package:belajar_flutter_ppkd/tugas_9/tugas_9_list_map.dart';
import 'package:belajar_flutter_ppkd/tugas_9/tugas_9_model.dart';
import 'package:flutter/material.dart';

class Tugas9Screen extends StatefulWidget {
  const Tugas9Screen({super.key});

  static const List<Widget> _widgetOptions = [
    Tugas9List(),
    Tugas9ListMap(),
    Tugas9Model(),
  ];

  @override
  State<Tugas9Screen> createState() => _Tugas9ScreenState();
}

class _Tugas9ScreenState extends State<Tugas9Screen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "List in List Builder",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: "List<Map> in List Builder",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.model_training),
            label: "Model in List Builder",
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
      body: Tugas9Screen._widgetOptions[_selectedIndex],
    );
  }
}
