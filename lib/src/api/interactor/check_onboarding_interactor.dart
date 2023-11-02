import 'package:find_coffee_app/src/api/repository/session/session_storage.dart';

class CheckOnboardingInteractor {
  CheckOnboardingInteractor(this._storage);

  final SessionStorage _storage;

  Future<void> call() async {
    await _storage.onCheckOnboarding(true);
  }
}