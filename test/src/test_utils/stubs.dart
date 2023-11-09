import 'package:find_coffee_app/src/common/storage.dart';

class StubStorage implements Storage {
  final hash = <String, dynamic>{};

  @override
  bool? getBool(String key) => hash[key] as bool?;

  @override
  String? getString(String key) => hash[key] as String?;

  @override
  Future<void> setBool(String key, bool? value) async => hash[key] = value;

  @override
  Future<void> setString(String key, String? value) async => hash[key] = value;

  @override
  Future<bool> clear() {
    hash.clear();
    return Future.value(true);
  }

  @override
  Future<void> reload() {
    return Future.value(null);
  }
}
