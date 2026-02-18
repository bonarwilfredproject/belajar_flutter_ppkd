import 'package:flutter/material.dart';

class Tugas3Flutter extends StatelessWidget {
  const Tugas3Flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Color(0xFFF4EEFF),
        shadowColor: Colors.black,
        title: Text("Tugas 3 Flutter"),
        backgroundColor: Color(0xFFF4EEFF),
      ),
      backgroundColor: Color(0xFFF4EEFF),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Daftar",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
              TextField(
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: "Nama",
                  hintText: "Masukkan nama anda",
                  icon: Icon(Icons.person),
                ),
              ),
              TextField(
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: "Phone",
                  hintText: "Masukkan nomor telepon anda",
                  icon: Icon(Icons.phone),
                ),
              ),
              TextField(
                autocorrect: false,
                obscureText: true,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText:
                      "Minimal 8 kata dengan huruf kapital dan tanda baca",
                  icon: Icon(Icons.password),
                ),
              ),
              TextField(
                autocorrect: false,
                obscureText: true,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                  labelText: "Confirm Password",
                  hintText: "Masukkan ulang password anda",
                  icon: Icon(Icons.password),
                ),
              ),
              GridView.count(
                padding: EdgeInsets.symmetric(vertical: 24),
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                children: [
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(color: Color(0xFFDCD6F7)),
                      ),
                      Center(
                        child: Text(
                          "I",
                          style: TextStyle(
                            color: Color(0xFFA6B1E1),
                            fontSize: 100,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(color: Color(0xFFA6B1E1)),
                      ),
                      Center(
                        child: Icon(
                          Icons.favorite,
                          size: 100,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(color: Color(0xFF424874)),
                      ),
                      Center(
                        child: Text(
                          "PPKD",
                          style: TextStyle(
                            color: Color(0xFFF4EEFF),
                            fontSize: 56,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(color: Color(0xFFDCD6F7)),
                      ),
                      Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          "Jakarta Pusat",
                          style: TextStyle(
                            color: Color(0xFF424874),
                            fontSize: 44,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(color: Color(0xFFA6B1E1)),
                      ),
                      Center(
                        child: Text(
                          "App",
                          style: TextStyle(
                            color: Color(0xFFF4EEFF),
                            fontSize: 80,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(color: Color(0xFF424874)),
                      ),
                      Center(
                        child: Text(
                          "Dev",
                          style: TextStyle(
                            color: Color(0xFFF4EEFF),
                            fontSize: 84,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
