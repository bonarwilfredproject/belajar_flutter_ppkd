import 'package:belajar_flutter_ppkd/database/preferences.dart';
import 'package:belajar_flutter_ppkd/database/sqflite.dart';
import 'package:belajar_flutter_ppkd/models/user_model.dart';
import 'package:belajar_flutter_ppkd/tugas_6/tugas_6_home_screen.dart';
import 'package:belajar_flutter_ppkd/tugas_6/tugas_6_screen_forgotten_password.dart';
import 'package:belajar_flutter_ppkd/tugas_6/tugas_6_sign_up_screen.dart';
import 'package:flutter/material.dart';

class Tugas6LogInScreen extends StatefulWidget {
  const Tugas6LogInScreen({super.key});

  @override
  State<Tugas6LogInScreen> createState() => _Tugas6LogInScreenState();
}

class _Tugas6LogInScreenState extends State<Tugas6LogInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool seePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Column(
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
              controller: emailController,
              style: TextStyle(
                color: Color(0xff888888),
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
              decoration: InputDecoration(
                fillColor: Color(0xffF6F6F6),
                filled: true,

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                  borderSide: BorderSide(color: Color(0xffBFBFBF)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                  borderSide: BorderSide(color: Color(0xffBFBFBF)),
                ),

                labelStyle: TextStyle(
                  color: Color(0xff888888),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                labelText: "Phone number, username, or email",
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 49.0),
            child: TextFormField(
              controller: passwordController,
              obscureText: seePassword ? true : false,
              obscuringCharacter: "*",
              style: TextStyle(
                color: Color(0xff888888),
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
              decoration: InputDecoration(
                fillColor: Color(0xffF6F6F6),
                filled: true,
                focusColor: Color(0xffF6F6F6),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                  borderSide: BorderSide(color: Color(0xffBFBFBF)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                  borderSide: BorderSide(color: Color(0xffBFBFBF)),
                ),
                labelText: "Password",
                labelStyle: TextStyle(
                  color: Color(0xff888888),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    seePassword = !seePassword;
                    setState(() {});
                  },
                  icon: seePassword
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                ),
                suffixIconConstraints: BoxConstraints(minWidth: 60),
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
                    onPressed: () async {
                      final UserModel? login = await DBHelper.loginUser(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                      if (login != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Login berhasil")),
                        );
                        await Future.delayed(Duration(seconds: 4));
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Tugas6HomeScreen(),
                          ),
                          (route) => false,
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Login gagal, email atau password tidak terdaftar",
                            ),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Color(0xffFFFFFF),
                      backgroundColor: Color(0xff1C82F9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(3),
                      ),
                    ),
                    child: Text(
                      "Log In",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
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
                  DBHelper.registerUser(
                    UserModel(
                      email: emailController.text,
                      password: passwordController.text,
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Pendaftaran Berhasil")),
                  );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()),
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
    );
  }
}
