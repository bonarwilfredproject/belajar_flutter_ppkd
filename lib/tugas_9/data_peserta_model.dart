// To parse this JSON data, do
//
//     final dataPeserta = dataPesertaFromJson(jsonString);

import 'dart:convert';

List<DataPeserta> dataPesertaFromJson(String str) => List<DataPeserta>.from(
  json.decode(str).map((x) => DataPeserta.fromJson(x)),
);

String dataPesertaToJson(List<DataPeserta> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataPeserta {
  String nama;
  String telp;
  String foto;
  String waktu;

  DataPeserta({
    required this.nama,
    required this.telp,
    required this.foto,
    required this.waktu,
  });

  factory DataPeserta.fromJson(Map<String, dynamic> json) => DataPeserta(
    nama: json["nama"],
    telp: json["telp"],
    foto: json["foto"],
    waktu: json["waktu"],
  );

  Map<String, dynamic> toJson() => {
    "nama": nama,
    "telp": telp,
    "foto": foto,
    "waktu": waktu,
  };
}
