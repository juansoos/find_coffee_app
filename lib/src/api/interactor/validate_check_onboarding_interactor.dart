import 'package:find_coffee_app/src/api/repository/session/session_storage.dart';

class ValidateCheckOnboardingInteractor {
  ValidateCheckOnboardingInteractor(this._storage);

  final SessionStorage _storage;

  bool call() {
    return _storage.checkOnboarding ?? false;
  }
}
