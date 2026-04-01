import 'package:belajar_flutter_ppkd/tugas_15/api/api_service.dart';
import 'package:belajar_flutter_ppkd/tugas_15/api/preferences.dart';
import 'package:belajar_flutter_ppkd/tugas_15/view/log_in_screen.dart';
import 'package:flutter/material.dart';
import '../models/user_model.dart';
import 'edit_profile_page.dart';

class ProfilePage extends StatefulWidget {
  final String token;

  const ProfilePage({super.key, required this.token});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<UserModel> futureProfile;

  final Color primaryBlue = const Color(0xff1C82F9);
  final Color greyText = const Color(0xff888888);
  final Color borderColor = const Color(0xffBFBFBF);
  final Color inputBg = const Color(0xffF6F6F6);

  @override
  void initState() {
    super.initState();
    futureProfile = ApiService.getProfile(widget.token);
  }

  void refreshData() {
    setState(() {
      futureProfile = ApiService.getProfile(widget.token);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: FutureBuilder<UserModel>(
        future: futureProfile,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(color: primaryBlue));
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          final user = snapshot.data!;

          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),

                // 🔥 PROFILE HEADER
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 45,
                          backgroundColor: inputBg,
                          child: Icon(Icons.person, size: 50, color: greyText),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          user.name ?? "-",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          user.email ?? "-",
                          style: TextStyle(color: greyText, fontSize: 13),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // 🔥 STATS
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      _StatItem(title: "Posts", value: "0"),
                      _StatItem(title: "Followers", value: "0"),
                      _StatItem(title: "Following", value: "0"),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // 🔥 EDIT BUTTON
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: borderColor),
                      ),
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => EditProfilePage(
                              token: widget.token,
                              user: user,
                            ),
                          ),
                        );
                        refreshData();
                      },
                      child: Text(
                        "Edit Profile",
                        style: TextStyle(color: primaryBlue),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                const Divider(),

                // 🔥 ABOUT
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: inputBg,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: borderColor),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "About",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text("Nama: ${user.name}"),
                        Text("Email: ${user.email}"),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // 🔥 LOGOUT BUTTON
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryBlue,
                      ),
                      onPressed: () async {
                        await Preferences.logout();

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (_) => Tugas15LogInScreen(),
                          ),
                          (route) => false,
                        );
                      },
                      child: const Text(
                        "Logout",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String title;
  final String value;

  const _StatItem({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text(title, style: TextStyle(color: Color(0xff888888))),
      ],
    );
  }
}
