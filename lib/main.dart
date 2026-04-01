import 'package:belajar_flutter_ppkd/day_17/cr_siswa.dart';
import 'package:belajar_flutter_ppkd/day_5/scaffold.dart';
import 'package:belajar_flutter_ppkd/day_7/gambar.dart';
import 'package:belajar_flutter_ppkd/day_8/latihan.dart';
import 'package:belajar_flutter_ppkd/database/preferences.dart';
import 'package:belajar_flutter_ppkd/database/splash_screen.dart';
import 'package:belajar_flutter_ppkd/tugas2.dart/tugas2.dart';
import 'package:belajar_flutter_ppkd/tugas_1/tugas_1.dart';
import 'package:belajar_flutter_ppkd/tugas_10/tugas_10_form.dart';
import 'package:belajar_flutter_ppkd/tugas_11/tugas_11_events.dart';
import 'package:belajar_flutter_ppkd/tugas_11/tugas_11_screen.dart';
import 'package:belajar_flutter_ppkd/tugas_12/tugas_12_screen.dart';
import 'package:belajar_flutter_ppkd/tugas_14/views/home_page.dart';
import 'package:belajar_flutter_ppkd/tugas_15/view/log_in_screen.dart';
import 'package:belajar_flutter_ppkd/tugas_3_flutter/tugas_3_flutter.dart';
import 'package:belajar_flutter_ppkd/tugas_4_flutter/tugas_4_flutter.dart';
import 'package:belajar_flutter_ppkd/tugas_5_flutter/tugas_5.dart';
import 'package:belajar_flutter_ppkd/tugas_6/tugas_6_log_in_screen.dart';
import 'package:belajar_flutter_ppkd/tugas_7/tugas_7.dart';
import 'package:belajar_flutter_ppkd/tugas_8/tugas_8.dart';
import 'package:belajar_flutter_ppkd/tugas_9/tugas_9_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceHandler().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Belajar Flutter PPKD',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Tugas15LogInScreen(),
    );
  }
}
