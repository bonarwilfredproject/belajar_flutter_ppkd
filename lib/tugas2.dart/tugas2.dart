import 'package:flutter/material.dart';

class Tugas2Flutter extends StatelessWidget {
  const Tugas2Flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Center(
              child: Text(
                "Bonar Wilfred",
                style: TextStyle(
                  fontSize: 32,
                  color: Color(0xFF424874),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Color(0xFF424874),
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.email, color: Color(0xFFF4EEFF)),
                  SizedBox(width: 25),
                  Text(
                    "bon*********ing@gmail.com",
                    style: TextStyle(color: Color(0xFFF4EEFF), fontSize: 16),
                  ),
                ],
              ),
            ),
          ),

          Row(
            children: [
              Spacer(),
              Text(
                "Rawamangun",
                style: TextStyle(
                  color: Color(0xFF424874),
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 96,
                  child: Column(
                    children: [
                      Spacer(),
                      Icon(Icons.home, color: Color(0xFFF4EEFF)),
                      Text("Home", style: TextStyle(color: Color(0xFFF4EEFF))),
                      Spacer(),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(64),
                    color: Color(0xFF424874),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 96,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(144),
                    color: Color(0xFF424874),
                  ),
                  child: Column(
                    children: [
                      Spacer(),
                      Icon(Icons.search, color: Color(0xFFF4EEFF)),
                      Text(
                        "Search",
                        style: TextStyle(color: Color(0xFFF4EEFF)),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 96,
                  child: Column(
                    children: [
                      Spacer(),
                      Icon(Icons.message, color: Color(0xFFF4EEFF)),
                      Text(
                        "Message",
                        style: TextStyle(color: Color(0xFFF4EEFF)),
                      ),
                      Spacer(),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(64),
                    color: Color(0xFF424874),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 96,
                  child: Column(
                    children: [
                      Spacer(),
                      Icon(Icons.percent, color: Color(0xFFF4EEFF)),
                      Text(
                        "Percent",
                        style: TextStyle(color: Color(0xFFF4EEFF)),
                      ),
                      Spacer(),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(64),
                    color: Color(0xFF424874),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              "Aku adalah pria pemberani yang tidak takut masalah apapun",
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xFF424874), fontSize: 32),
            ),
          ),
          SizedBox(height: 32),
          Container(
            child: Image.asset(
              "lib/assets/images/logo.png",
              height: 96,
              width: 96,
            ),
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFF424874),
        title: Text("Profile", style: TextStyle(color: Color(0xFFF4EEFF))),
      ),
    );
  }
}
