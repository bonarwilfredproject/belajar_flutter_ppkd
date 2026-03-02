import 'package:belajar_flutter_ppkd/database/event_controller.dart';
import 'package:belajar_flutter_ppkd/models/event_model.dart';
import 'package:belajar_flutter_ppkd/tugas_11/tugas_11_events.dart';
import 'package:belajar_flutter_ppkd/utils/decoration_form.dart';
import 'package:flutter/material.dart';

class Tugas11Screen extends StatefulWidget {
  const Tugas11Screen({super.key});

  @override
  State<Tugas11Screen> createState() => _Tugas11ScreenState();
}

class _Tugas11ScreenState extends State<Tugas11Screen> {
  GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController namaEventController = TextEditingController();
  TextEditingController lokasiController = TextEditingController();
  String? selectedSpot;
  final List<String> spotList = ["Outdoor", "Indoor"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Buat Event")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: namaEventController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Nama event belum diisi";
                    }
                    return null;
                  },
                  decoration: decorationConstant(
                    hintText: "Masukkan nama event",
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: lokasiController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Lokasi belum diisi";
                    }
                    return null;
                  },
                  decoration: decorationConstant(hintText: "Masukkan lokasi"),
                ),
                SizedBox(height: 16),
                DropdownButtonFormField(
                  decoration: decorationConstant(hintText: "Pilih spot"),
                  validator: (value) =>
                      value == null ? "Belum pilih spot" : null,
                  items: spotList
                      .map(
                        (spot) =>
                            DropdownMenuItem(value: spot, child: Text(spot)),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedSpot = value;
                    });
                  },
                ),
                IconButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      EventController.addEvent(
                        EventModel(
                          namaEvent: namaEventController.text,
                          lokasi: lokasiController.text,
                          spot: selectedSpot!,
                        ),
                      );
                      setState(() {
                        namaEventController.clear();
                        lokasiController.clear();
                      });
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Tugas11Events();
                          },
                        ),
                        (route) {
                          return false;
                        },
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Berhasil buat event")),
                      );
                    }
                  },
                  icon: Icon(Icons.add_circle, size: 40),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
