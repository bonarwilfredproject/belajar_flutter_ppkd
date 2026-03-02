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
}
