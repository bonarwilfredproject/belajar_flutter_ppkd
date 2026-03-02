import 'package:belajar_flutter_ppkd/database/siswa_controller.dart';
import 'package:belajar_flutter_ppkd/models/siswa_model.dart';
import 'package:belajar_flutter_ppkd/utils/decoration_form.dart';
import 'package:flutter/material.dart';

class CRSiswaDay17 extends StatefulWidget {
  const CRSiswaDay17({super.key});

  @override
  State<CRSiswaDay17> createState() => _CRSiswaDay17State();
}

class _CRSiswaDay17State extends State<CRSiswaDay17> {
  GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController kelasController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: decorationConstant(
                    hintText: "Masukkan nama siswa",
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: kelasController,
                  decoration: decorationConstant(
                    hintText: "Masukkan kelas siswa",
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (nameController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Nama belum diisi")),
                        );
                        return;
                      }
                      if (kelasController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Kelas belum diisi")),
                        );
                        return;
                      }
                      SiswaController.registerUser(
                        SiswaModel(
                          nama: nameController.text,
                          kelas: kelasController.text,
                        ),
                      );
                      nameController.clear();
                      kelasController.clear();
                      setState(() {});
                    },
                    child: Text("Tambah Siswa"),
                  ),
                ),
                SizedBox(height: 16),
                FutureBuilder<List<SiswaModel>>(
                  future: SiswaController.getAllSiswa(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    }
                    final dataSiswa = snapshot.data as List<SiswaModel>;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: dataSiswa.length,
                      itemBuilder: (BuildContext context, int index) {
                        final items = dataSiswa[index];
                        return ListTile(
                          title: Text(items.nama),
                          subtitle: Text(items.kelas),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
