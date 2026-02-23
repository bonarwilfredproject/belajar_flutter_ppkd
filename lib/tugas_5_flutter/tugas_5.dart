import 'package:belajar_flutter_ppkd/tugas_5_flutter/tugas_5_gesture_detector.dart';
import 'package:flutter/material.dart';

class Tugas5Flutter extends StatefulWidget {
  const Tugas5Flutter({super.key});

  @override
  State<Tugas5Flutter> createState() => _Tugas5FlutterState();
}

class _Tugas5FlutterState extends State<Tugas5Flutter> {
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(12),
              ),
              backgroundColor: Colors.blueGrey,
              foregroundColor: Colors.white,
            ),
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
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(60),
              child: Container(
                color: Colors.amber,
                height: 60,
                width: 120,
                child: Center(child: Text("Coba pencet ini")),
              ),
            ),
          ),
          if (tampilanInkWell) Text("Ini efek InkWell"),

          Text("${counter}", style: TextStyle(fontSize: 60)),
          //ini tombol untuk tap, double tap, dan long press
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 12),
              //button kurang
              Expanded(
                child: Tugas5GestureDetector(
                  data: "Tombol Kurang",
                  onDoubleTap: () {
                    counter -= 2;
                    setState(() {});
                  },
                  onTap: () {
                    counter--;
                    setState(() {});
                  },
                  onLongPress: () {
                    setState(() {
                      counter -= 3;
                    });
                  },
                ),
              ),
              SizedBox(width: 12),
              //button tambah
              Expanded(
                child: Tugas5GestureDetector(
                  data: "Tombol Tambah",
                  onDoubleTap: () {
                    setState(() {
                      counter += 2;
                    });
                  },
                  onLongPress: () {
                    setState(() {
                      counter += 3;
                    });
                  },
                  onTap: () {
                    setState(() {
                      counter++;
                    });
                  },
                ),
              ),
              SizedBox(width: 12),
            ],
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
