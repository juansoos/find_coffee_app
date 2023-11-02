import 'package:find_coffee_app/src/common/storage.dart';

class SessionStorage {
  SessionStorage(this._storage);

  static const String _keyCheckOnboarding = 'session_storage.checkOnboarding';

  final Storage _storage;

  bool? get checkOnboarding => _storage.getBool(_keyCheckOnboarding);

  Future<void> onCheckOnboarding(bool value) async {
    await _storage.setBool(_keyCheckOnboarding, value);
  }
}
