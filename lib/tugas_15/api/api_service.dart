import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class ApiService {
  static const String baseUrl = "https://absensib1.mobileprojp.com/api";

  // LOGIN
  static Future<String?> login(String email, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/login"),
      body: {"email": email, "password": password},
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return data['data']?['token']; // ✅ FIX DI SINI
    } else {
      throw Exception(data['message'] ?? "Login gagal");
    }
  }

  // REGISTER
  static Future<bool> register(
    String name,
    String email,
    String password,
  ) async {
    final response = await http.post(
      Uri.parse("$baseUrl/register"),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
      body: jsonEncode({"name": name, "email": email, "password": password}),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      if (data['errors'] != null && data['errors']['email'] != null) {
        throw Exception(data['errors']['email'][0]);
      }

      throw Exception(data['message'] ?? "Register gagal");
    }
  }

  // GET PROFILE
  static Future<UserModel> getProfile(String token) async {
    final response = await http.get(
      Uri.parse("$baseUrl/profile"),
      headers: {"Authorization": "Bearer $token", "Accept": "application/json"},
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return UserModel.fromJson(data);
    } else {
      throw Exception(data['message'] ?? "Gagal ambil data profile");
    }
  }

  // UPDATE PROFILE
  static Future<bool> updateProfile(
    String token,
    String name,
    String email,
  ) async {
    final response = await http.put(
      Uri.parse("$baseUrl/profile"),
      headers: {"Authorization": "Bearer $token", "Accept": "application/json"},
      body: {"name": name, "email": email},
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception(data['message'] ?? "Update gagal");
    }
  }
}
