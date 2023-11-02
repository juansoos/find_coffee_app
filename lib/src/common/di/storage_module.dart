import 'package:find_coffee_app/src/api/repository/session/session_storage.dart';
import 'package:find_coffee_app/src/common/storage.dart';

abstract class StorageModule {
  static SessionStorage sessionStorage() {
    return SessionStorage(Storage.instance);
  }
}
