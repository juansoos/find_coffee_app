import 'package:find_coffee_app/src/api/repository/session/session_storage.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils/stubs.dart';

void main() {
  SessionStorage subject() {
    return SessionStorage(StubStorage());
  }

  group('.onCheckOnboarding', () {
    late SessionStorage storage;

    setUpAll(() async {
      storage = subject();

      await storage.onCheckOnboarding(true);
    });

    test('check onboarding is updated', () {
      expect(storage.checkOnboarding, isTrue);
    });
  });
}
