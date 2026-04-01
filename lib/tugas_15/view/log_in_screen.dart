import 'package:belajar_flutter_ppkd/database/preferences.dart';
import 'package:belajar_flutter_ppkd/database/sqflite.dart';
import 'package:belajar_flutter_ppkd/models/user_model.dart';
import 'package:belajar_flutter_ppkd/tugas_15/api/api_service.dart';
import 'package:belajar_flutter_ppkd/tugas_15/api/preferences.dart';
import 'package:belajar_flutter_ppkd/tugas_15/view/profile_page.dart';
import 'package:belajar_flutter_ppkd/tugas_15/view/sign_up_screen.dart';
import 'package:belajar_flutter_ppkd/tugas_6/tugas_6_home_screen.dart';
import 'package:belajar_flutter_ppkd/tugas_6/tugas_6_screen_forgotten_password.dart';
import 'package:belajar_flutter_ppkd/tugas_6/tugas_6_sign_up_screen.dart';
import 'package:flutter/material.dart';

class Tugas15LogInScreen extends StatefulWidget {
  const Tugas15LogInScreen({super.key});

  @override
  State<Tugas15LogInScreen> createState() => _Tugas15LogInScreenState();
}

class _Tugas15LogInScreenState extends State<Tugas15LogInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  bool seePassword = true;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    final token = await Preferences.getToken();

    if (token != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => ProfilePage(token: token)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Spacer(),
            Image.asset(
              "lib/assets/images/5a4e432a2da5ad73df7efe7a 1.png",
              width: 246,
              height: 75,
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 49.0),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email wajib diisi";
                  }

                  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                  if (!emailRegex.hasMatch(value)) {
                    return "Format email tidak valid";
                  }

                  return null;
                },
                controller: emailController,
                style: TextStyle(
                  color: Color(0xff888888),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                decoration: InputDecoration(
                  fillColor: const Color(0xffF6F6F6),
                  filled: true,

                  labelText: "Phone number, username, or email",
                  labelStyle: const TextStyle(
                    color: Color(0xff888888),
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3),
                    borderSide: const BorderSide(color: Color(0xffBFBFBF)),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3),
                    borderSide: const BorderSide(
                      color: Color(0xff1C82F9),
                    ), // 🔵 biru saat fokus
                  ),

                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3),
                    borderSide: const BorderSide(color: Colors.red),
                  ),

                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3),
                    borderSide: const BorderSide(color: Colors.red, width: 1.5),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 49.0),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password wajib diisi";
                  }

                  final passwordRegex = RegExp(
                    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{6,}$',
                  );

                  if (!passwordRegex.hasMatch(value)) {
                    return "Password harus mengandung huruf besar, kecil, angka, dan karakter spesial";
                  }

                  return null;
                },
                controller: passwordController,
                obscureText: seePassword ? true : false,
                obscuringCharacter: "*",
                style: TextStyle(
                  color: Color(0xff888888),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                decoration: InputDecoration(
                  fillColor: const Color(0xffF6F6F6),
                  filled: true,

                  labelText: "Password",
                  labelStyle: const TextStyle(
                    color: Color(0xff888888),
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3),
                    borderSide: const BorderSide(color: Color(0xffBFBFBF)),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3),
                    borderSide: const BorderSide(
                      color: Color(0xff1C82F9),
                    ), // 🔵 biru saat fokus
                  ),

                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3),
                    borderSide: const BorderSide(color: Colors.red),
                  ),

                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3),
                    borderSide: const BorderSide(color: Colors.red, width: 1.5),
                  ),
                ),
              ),
            ),
            SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 49.0),
              child: Align(
                heightFactor: 0.4,
                alignment: AlignmentGeometry.centerRight,
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(0),
                    minimumSize: Size(0, 0),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Tugas6ForgottenPasswordScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Forgotten Password?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1C82F9),
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 49.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: isLoading
                          ? null
                          : () async {
                              if (!_formKey.currentState!.validate()) return;

                              setState(() => isLoading = true);

                              try {
                                final token = await ApiService.login(
                                  emailController.text,
                                  passwordController.text,
                                );

                                if (token == null) {
                                  throw Exception(
                                    "Login gagal, token tidak ditemukan",
                                  );
                                }

                                await Preferences.saveToken(token);

                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ProfilePage(token: token),
                                  ),
                                );
                              } catch (e) {
                                String errorMessage = "Terjadi kesalahan";

                                if (e.toString().contains("401")) {
                                  errorMessage = "Email atau password salah";
                                } else if (e.toString().contains("500")) {
                                  errorMessage =
                                      "Server error, coba lagi nanti";
                                } else {
                                  errorMessage = e.toString().replaceAll(
                                    "Exception:",
                                    "",
                                  );
                                }

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(errorMessage)),
                                );
                              }

                              setState(() => isLoading = false);
                            },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Color(0xffFFFFFF),
                        backgroundColor: Color(0xff1C82F9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(3),
                        ),
                      ),
                      child: isLoading
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text("Log In"),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Color(0xffBEBEBE),
                    indent: 49,
                    endIndent: 19,
                  ),
                ),
                Text(
                  "OR",
                  style: TextStyle(
                    color: Color(0xffBEBEBE),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Color(0xffBEBEBE),
                    indent: 19,
                    endIndent: 49,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("lib/assets/images/Facebook.png"),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Log in with Facebook",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1C82F9),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            Divider(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xffBEBEBE),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Tugas15SignUpScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1C82F9),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
