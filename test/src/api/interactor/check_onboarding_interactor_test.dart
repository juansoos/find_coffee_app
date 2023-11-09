import 'package:find_coffee_app/src/api/interactor/check_onboarding_interactor.dart';
import 'package:find_coffee_app/src/api/repository/session/session_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../test_utils/mocks/mocks.dart';

void main() {
  final storage = SessionStorage(MockStorage());

  CheckOnboardingInteractor subject() {
    return CheckOnboardingInteractor(storage);
  }

  group('.call', () {
    setUpAll(() async {
      when(storage.onCheckOnboarding(true)).thenAnswer((_) async => '');

      await subject().call();
    });

    test('should be call storage method', () {
      verifyInOrder([storage.onCheckOnboarding(true)]);
    });
  });
}
