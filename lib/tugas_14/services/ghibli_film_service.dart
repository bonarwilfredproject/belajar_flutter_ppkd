import 'dart:convert';
import 'package:belajar_flutter_ppkd/tugas_14/models/ghibli_film_model.dart';
import 'package:http/http.dart' as http;

class GhibliFilmService {
  static const String url = "https://ghibliapi.vercel.app/films";

  static Future<List<GhibliFilm>> fetchFilms() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((e) => GhibliFilm.fromJson(e)).toList();
    } else {
      throw Exception("Gagal load data");
    }
  }

  static Future<List<Map<String, dynamic>>> fetchPeople(
    List<dynamic> urls,
  ) async {
    final responses = await Future.wait(
      urls.map((url) => http.get(Uri.parse(url))),
    );

    return responses
        .where((res) => res.statusCode == 200)
        .map((res) => Map<String, dynamic>.from(json.decode(res.body)))
        .toList();
  }
}
