import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHandler {
  PreferenceHandler._internal();
  static final PreferenceHandler _instance = PreferenceHandler._internal();

  factory PreferenceHandler() => _instance;
  late SharedPreferences _preferences;
  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  final String _registered = "registered";

  Future<void> storingRegistered(bool registered) async {
    await _preferences.setBool(_registered, registered);
  }

  Future<bool?> getRegistered() async {
    return _preferences.getBool(_registered);
  }

  Future<void> deleteRegistered() async {
    await _preferences.remove(_registered);
  }
}
