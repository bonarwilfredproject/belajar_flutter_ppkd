import 'package:belajar_flutter_ppkd/database/sqflite.dart';
import 'package:belajar_flutter_ppkd/models/user_model.dart';
import 'package:belajar_flutter_ppkd/tugas_15/api/api_service.dart';
import 'package:flutter/material.dart';

class Tugas15SignUpScreen extends StatefulWidget {
  const Tugas15SignUpScreen({super.key});

  @override
  State<Tugas15SignUpScreen> createState() => _Tugas15SignUpScreenState();
}

class _Tugas15SignUpScreenState extends State<Tugas15SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  bool seePassword = true;
  bool seeConfirmPassword = true;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  String parseError(String error) {
    return error.replaceAll("Exception:", "").trim();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            const Spacer(),

            // LOGO
            Image.asset(
              "lib/assets/images/5a4e432a2da5ad73df7efe7a 1.png",
              width: 246,
              height: 75,
            ),

            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 49.0),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Nama wajib diisi";
                  }
                  return null;
                },
                controller: nameController,
                style: const TextStyle(
                  color: Color(0xff888888),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                decoration: InputDecoration(
                  fillColor: const Color(0xffF6F6F6),
                  filled: true,

                  labelText: "Name",
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
            const SizedBox(height: 20),
            // EMAIL
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 49.0),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email wajib diisi";
                  }

                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return "Format email tidak valid";
                  }

                  return null;
                },
                controller: emailController,
                style: const TextStyle(
                  color: Color(0xff888888),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                decoration: InputDecoration(
                  fillColor: const Color(0xffF6F6F6),
                  filled: true,

                  labelText: "Email",
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

            const SizedBox(height: 20),

            // PASSWORD
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
                obscureText: seePassword,
                obscuringCharacter: "*",
                style: const TextStyle(
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

            const SizedBox(height: 20),

            // CONFIRM PASSWORD
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 49.0),
              child: TextFormField(
                validator: (value) {
                  if (value != passwordController.text) {
                    return "Password tidak sama";
                  }
                  return null;
                },
                controller: confirmPasswordController,
                obscureText: seeConfirmPassword,
                obscuringCharacter: "*",
                style: const TextStyle(
                  color: Color(0xff888888),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                decoration: InputDecoration(
                  fillColor: const Color(0xffF6F6F6),
                  filled: true,

                  labelText: "Confirm Password",
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

            const SizedBox(height: 20),

            // SIGN UP BUTTON
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 49.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        if (!_formKey.currentState!.validate()) return;

                        setState(() => isLoading = true);

                        try {
                          final success = await ApiService.register(
                            nameController.text,
                            emailController.text,
                            passwordController.text,
                          );

                          if (success) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Register berhasil")),
                            );

                            Navigator.pop(context);
                          }
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(parseError(e.toString()))),
                          );
                        }

                        setState(() => isLoading = false);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff1C82F9),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      child: isLoading
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text("Sign Up"),
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            // BACK TO LOGIN
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xffBEBEBE),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Log In",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1C82F9),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
