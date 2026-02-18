import 'package:flutter/material.dart';

class Tugas4Flutter extends StatelessWidget {
  const Tugas4Flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4EEFF),
      appBar: AppBar(
        backgroundColor: Color(0xFFF4EEFF),
        title: Text("Tugas 4 Flutter"),
        surfaceTintColor: Color(0xFFF4EEFF),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            //text field nama
            TextField(
              decoration: InputDecoration(
                labelText: "Nama",
                hintText: "Masukkan nama anda",
              ),
            ),
            //text field email
            TextField(
              decoration: InputDecoration(
                labelText: "E-mail",
                hintText: "Masukkan e-mail anda",
              ),
            ),
            //text field nama
            TextField(
              decoration: InputDecoration(
                labelText: "No. HP",
                hintText: "Masukkan no. HP anda",
              ),
            ),
            //text field nama
            TextField(
              decoration: InputDecoration(
                labelText: "Deskripsi",
                hintText: "Masukkan deskripsi diri anda",
              ),
            ),
            //data kenalan
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Text("Daftar Kenalan", style: TextStyle(fontSize: 16)),
            ),
            //list tile jason
            dataKenalan("Jason", "08212356789", Icons.person),
            dataKenalan("Angel", "08212356789", Icons.person_2),
            dataKenalan("Putri", "08212356789", Icons.person_3),
            dataKenalan("Dia", "08212356789", Icons.person_4),
            dataKenalan("Wahyu", "08212356789", Icons.person_4),
            Card(
              color: Color(0xFF424874),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.all(Radius.circular(8)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(child: Icon(Icons.data_object)),
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "contoh card",
                            style: TextStyle(color: Color(0xFFF4EEFF)),
                          ),
                          Text(
                            "wahyu",
                            style: TextStyle(color: Color(0xFFF4EEFF)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListTile dataKenalan(String nama, String noTelp, IconData ikon) {
    return ListTile(
      leading: Icon(ikon),
      iconColor: Color(0xFF424874),
      title: Text(nama),
      subtitle: Text(noTelp),
    );
  }
}
