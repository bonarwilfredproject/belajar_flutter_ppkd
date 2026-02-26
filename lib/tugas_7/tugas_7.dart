import 'package:belajar_flutter_ppkd/tugas_7/tugas_7_check_box.dart';
import 'package:belajar_flutter_ppkd/tugas_7/tugas_7_date_picker.dart';
import 'package:belajar_flutter_ppkd/tugas_7/tugas_7_drop_down.dart';
import 'package:belajar_flutter_ppkd/tugas_7/tugas_7_switch.dart';
import 'package:belajar_flutter_ppkd/tugas_7/tugas_7_time_picker.dart';
import 'package:flutter/material.dart';

class Tugas7Flutter extends StatefulWidget {
  const Tugas7Flutter({super.key});

  @override
  State<Tugas7Flutter> createState() => _Tugas7FlutterState();
}

class _Tugas7FlutterState extends State<Tugas7Flutter> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = [
    Tugas7CheckBox(),
    Tugas7Switch(),
    Tugas7DropDown(),
    Tugas7DatePicker(),
    Tugas7TimePicker(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Tugas 7 Flutter"),
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://i.pinimg.com/564x/6e/0f/05/6e0f057d6d82cb6a1f1054c2b3504f92.jpg",
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      Scaffold.of(context).openDrawer();
                    });
                  },
                ),
              ),
            );
          },
        ),
      ),

      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            DrawerHeader(child: Text("Navigation Drawer")),
            ListTile(
              leading: Icon(Icons.check_box),
              title: Text("Syarat & Ketentuan"),
              selected: _selectedIndex == 0,
              onTap: () {
                setState(() {
                  _selectedIndex = 0;
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.toggle_on),
              title: Text("Mode Gelap"),
              selected: _selectedIndex == 1,
              onTap: () {
                setState(() {
                  _selectedIndex = 1;
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.arrow_drop_down),
              title: Text("Pilih Kategori Produk"),
              selected: _selectedIndex == 2,
              onTap: () {
                setState(() {
                  _selectedIndex = 2;
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.date_range),
              title: Text("Pilih Tanggal Lahir"),
              selected: _selectedIndex == 3,
              onTap: () {
                setState(() {
                  _selectedIndex = 3;
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.timer),
              title: Text("Atur Pengingat"),
              selected: _selectedIndex == 4,
              onTap: () {
                setState(() {
                  _selectedIndex = 4;
                  Navigator.pop(context);
                });
              },
            ),
          ],
        ),
      ),
      body: _widgetOptions[_selectedIndex],
    );
  }
}
