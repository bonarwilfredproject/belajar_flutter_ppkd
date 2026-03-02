import 'package:belajar_flutter_ppkd/models/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Future<Database> db() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, "connext.db"),
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE user (id INTEGER PRIMARY KEY AUTOINCREMENT, email TEXT, password TEXT)',
        );
        await db.execute(
          'CREATE TABLE siswa (id INTEGER PRIMARY KEY AUTOINCREMENT, nama TEXT, kelas TEXT)',
        );
        await db.execute(
          'CREATE TABLE event (id INTEGER PRIMARY KEY AUTOINCREMENT, nama_event TEXT, lokasi TEXT)',
        );
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await db.execute(
            'CREATE TABLE siswa (id INTEGER PRIMARY KEY AUTOINCREMENT, nama TEXT, kelas TEXT)',
          );
        }
        if (oldVersion < 3) {
          await db.execute(
            'CREATE TABLE event (id INTEGER PRIMARY KEY AUTOINCREMENT, nama_event TEXT, lokasi TEXT)',
          );
        }
      },
      version: 3,
    );
  }

  static Future<void> registerUser(UserModel user) async {
    final dbs = await db();
    await dbs.insert('user', user.toMap());
  }

  static Future<UserModel?> loginUser({
    required String email,
    required String password,
  }) async {
    final dbs = await db();
    final List<Map<String, dynamic>> results = await dbs.query(
      "user",
      where: 'email = ? AND PASSWORD = ?',
      whereArgs: [email, password],
    );
    if (results.isNotEmpty) {
      return UserModel.fromMap(results.first);
    }
    return null;
  }
}
