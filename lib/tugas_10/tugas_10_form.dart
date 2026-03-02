import 'package:belajar_flutter_ppkd/database/preferences.dart';
import 'package:belajar_flutter_ppkd/tugas_10/tugas_10_konfirmasi.dart';
import 'package:flutter/material.dart';

class Tugas10Form extends StatefulWidget {
  const Tugas10Form({super.key});

  @override
  State<Tugas10Form> createState() => _Tugas10FormState();
}

class _Tugas10FormState extends State<Tugas10Form> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController namaLengkapController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController kotaController = TextEditingController();
  TextEditingController noTelpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tugas 10 Form")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // form field nama lengkap
              TextFormField(
                controller: namaLengkapController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Nama wajib diisi";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  label: Text("Nama"),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              //form field e-mail
              TextFormField(
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email wajib diisi";
                  } else if (!value.contains("@")) {
                    return "Email harus mengandung @";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  label: Text("E-mail"),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              //form field no telp
              TextFormField(
                controller: noTelpController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text("No Telepon"),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              //form kota
              TextFormField(
                controller: kotaController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Kota wajib diisi";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  label: Text("Kota"),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Ringkasan Data", style: TextStyle()),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Nama: ${namaLengkapController.text}"),
                                Text("E-mail: ${emailController.text}"),
                                Text("Nomor Telepon: ${noTelpController.text}"),
                                Text("Kota: ${kotaController.text}"),
                              ],
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  PreferenceHandler().storingRegistered(true);
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return Tugas10Konfirmasi(
                                          namaLengkap:
                                              namaLengkapController.text,
                                          kota: kotaController.text,
                                        );
                                      },
                                    ),
                                    (route) {
                                      return false;
                                    },
                                  );
                                },
                                child: Text("Lanjut"),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: Text("Daftar"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
