import 'package:flutter/material.dart';

class ButtonTampilkanProfil extends StatefulWidget {
  const ButtonTampilkanProfil({super.key});

  @override
  State<ButtonTampilkanProfil> createState() => _ButtonTampilkanProfilState();
}

class _ButtonTampilkanProfilState extends State<ButtonTampilkanProfil> {
  bool profilTampil = false;
  bool disukai = false;
  Color warnaTombol = Colors.red;
  bool detailInfo = false;
  bool tampilanInkWell = false;
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Tugas 5 Flutter"))),
      body: Column(
        children: [
          //tombol untuk menampilkan profil
          Center(
            child: ElevatedButton(
              onPressed: () {
                profilTampil = !profilTampil;
                setState(() {});
              },
              child: Text("Tampilkan Profil"),
            ),
          ),
          if (profilTampil)
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Bonar Wilfred"),
              subtitle: Text("Aku kaya"),
            ),
          //tombol suka
          IconButton(
            onPressed: () {
              disukai = !disukai;
              setState(() {});
            },
            icon: Icon(
              Icons.thumb_up,
              color: disukai ? Colors.red : Colors.black,
            ),
          ),
          if (disukai) Text("Disukai!"),
          //tombol detail info
          TextButton(
            onPressed: () {
              detailInfo = !detailInfo;
              setState(() {});
            },
            child: Text("Detail Info"),
          ),
          if (detailInfo)
            Text(
              "Bonar adalah seorang siswa PPKD Jakarta Pusat yang sedang belajar app developing.",
            ),
          //kotak yang bisa dipencet
          InkWell(
            onTap: () {
              tampilanInkWell = !tampilanInkWell;
              print("Hai, InkWell berfungsi");
              setState(() {});
            },
            child: Container(
              color: Colors.amber,
              height: 60,
              width: 120,
              child: Center(child: Text("Coba pencet ini")),
            ),
          ),
          if (tampilanInkWell) Text("Ini efek InkWell"),

          Text("${counter}", style: TextStyle(fontSize: 60)),
          //ini tombol untuk tap, double tap, dan long press
          GestureDetector(
            onTap: () {
              counter++;
              setState(() {});
            },
            onDoubleTap: () {
              counter += 2;
              setState(() {});
            },
            onLongPress: () {
              counter += 3;
              setState(() {});
            },
            child: Container(
              width: 120,
              height: 60,
              color: Colors.cyanAccent,
              child: Center(
                child: Text(
                  "1x tap +1; 2x tap +2; tekan lama +3",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
      //tombol kurangi angka
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter--;
          setState(() {});
        },
        child: Text("Kurangi Angka", textAlign: TextAlign.center),
      ),
    );
  }
}
