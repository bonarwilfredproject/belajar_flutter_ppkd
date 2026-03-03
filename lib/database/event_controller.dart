import 'package:belajar_flutter_ppkd/database/sqflite.dart';
import 'package:belajar_flutter_ppkd/models/event_model.dart';

class EventController {
  static Future<void> addEvent(EventModel event) async {
    final dbs = await DBHelper.db();
    await dbs.insert("event", event.toMap());
  }

  static Future<List<EventModel>> getAllEvent() async {
    final dbs = await DBHelper.db();
    final List<Map<String, dynamic>> results = await dbs.query("event");
    return results.map((e) {
      return EventModel.fromMap(e);
    }).toList();
  }

  static Future<int> updateEvent(EventModel event) async {
    final dbs = await DBHelper.db();

    if (event.id == null) {
      throw Exception("ID Event tidak boleh kosong");
    }
    return dbs.update(
      'event',
      event.toMap(),
      where: "id = ?",
      whereArgs: [event.id],
    );
  }

  static Future<int> deleteEvent(int id) async {
    final dbs = await DBHelper.db();
    return dbs.delete('event', where: 'id = ?', whereArgs: [id]);
  }
}
