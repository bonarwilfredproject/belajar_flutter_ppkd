import 'package:flutter/material.dart';

class LatihanDay8 extends StatelessWidget {
  const LatihanDay8({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 248,
            right: -248,
            left: -248,
            child: Container(
              width: 1000,
              height: 1000,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1000),
                color: Color(0xFFDCD6F7),
              ),
            ),
          ),
          Positioned(
            top: 208,
            right: 0,
            left: 0,
            child: Image.asset(
              "lib/assets/images/logo.png",
              height: 79,
              width: 79,
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF4EEFF),
    );
  }
}
