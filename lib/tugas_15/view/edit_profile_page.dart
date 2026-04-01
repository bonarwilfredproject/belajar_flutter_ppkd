import 'package:belajar_flutter_ppkd/tugas_15/api/api_service.dart';
import 'package:flutter/material.dart';
import '../models/user_model.dart';

class EditProfilePage extends StatefulWidget {
  final String token;
  final UserModel user;

  const EditProfilePage({super.key, required this.token, required this.user});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();

  bool isLoading = false;

  // 🎨 WARNA SAMA DENGAN LOGIN
  final Color primaryBlue = const Color(0xff1C82F9);
  final Color greyText = const Color(0xff888888);
  final Color borderColor = const Color(0xffBFBFBF);
  final Color inputBg = const Color(0xffF6F6F6);

  @override
  void initState() {
    super.initState();
    nameController.text = widget.user.name ?? "";
    emailController.text = widget.user.email ?? "";
  }

  void updateData() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    try {
      final success = await ApiService.updateProfile(
        widget.token,
        nameController.text,
        emailController.text,
      );

      if (success) {
        Navigator.pop(context);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Berhasil update profile")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString().replaceAll("Exception:", ""))),
      );
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Edit Profile"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 49),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 30),

                // 🔥 AVATAR
                CircleAvatar(
                  radius: 45,
                  backgroundColor: inputBg,
                  child: Icon(Icons.person, size: 50, color: greyText),
                ),

                const SizedBox(height: 30),

                // 🔥 NAME FIELD
                TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Nama wajib diisi";
                    }
                    return null;
                  },
                  style: TextStyle(
                    color: greyText,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                  decoration: InputDecoration(
                    fillColor: inputBg,
                    filled: true,
                    labelText: "Name",
                    labelStyle: TextStyle(
                      color: greyText,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3),
                      borderSide: BorderSide(color: borderColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3),
                      borderSide: BorderSide(color: borderColor),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // 🔥 EMAIL FIELD
                TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email wajib diisi";
                    }

                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return "Email tidak valid";
                    }

                    return null;
                  },
                  style: TextStyle(
                    color: greyText,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                  decoration: InputDecoration(
                    fillColor: inputBg,
                    filled: true,
                    labelText: "Email",
                    labelStyle: TextStyle(
                      color: greyText,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3),
                      borderSide: BorderSide(color: borderColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3),
                      borderSide: BorderSide(color: borderColor),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // 🔥 UPDATE BUTTON
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: isLoading ? null : updateData,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    child: isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                            "Update",
                            style: TextStyle(color: Colors.white),
                          ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
