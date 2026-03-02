import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class EventModel {
  final int? id;
  final String namaEvent;
  final String lokasi;
  EventModel({this.id, required this.namaEvent, required this.lokasi});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nama_event': namaEvent,
      'lokasi': lokasi,
    };
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      id: map['id'] != null ? map['id'] as int : null,
      namaEvent: map['nama_event'] as String,
      lokasi: map['lokasi'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory EventModel.fromJson(String source) =>
      EventModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
