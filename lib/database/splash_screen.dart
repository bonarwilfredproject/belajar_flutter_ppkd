import 'package:belajar_flutter_ppkd/database/preferences.dart';
import 'package:belajar_flutter_ppkd/tugas_10/tugas_10_form.dart';
import 'package:belajar_flutter_ppkd/tugas_10/tugas_10_konfirmasi.dart';
import 'package:flutter/material.dart';

class SplashScreenSP extends StatefulWidget {
  const SplashScreenSP({super.key});

  @override
  State<SplashScreenSP> createState() => _SplashScreenSPState();
}

class _SplashScreenSPState extends State<SplashScreenSP> {
  @override
  void initState() {
    super.initState();
    autoLogin();
  }

  void autoLogin() async {
    await Future.delayed(Duration(seconds: 3));
    bool? data = await PreferenceHandler().getRegistered();
    if (data == true) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Tugas10Konfirmasi(namaLengkap: "", kota: "");
          },
        ),
        (route) {
          return false;
        },
      );
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Tugas10Form();
          },
        ),
        (route) {
          return false;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network(
          "https://i.pinimg.com/564x/6e/0f/05/6e0f057d6d82cb6a1f1054c2b3504f92.jpg",
          height: 100,
          width: 100,
        ),
      ),
    );
  }
}
