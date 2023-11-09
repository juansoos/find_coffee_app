import 'package:find_coffee_app/src/api/interactor/validate_check_onboarding_interactor.dart';
import 'package:find_coffee_app/src/api/repository/session/session_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../test_utils/mocks/mocks.dart';

void main() {
  final storage = SessionStorage(MockStorage());

  ValidateCheckOnboardingInteractor subject() {
    return ValidateCheckOnboardingInteractor(storage);
  }

  group('.call', () {
    const options = [true, false];

    options.forEach((element) {
      group('when value is $element', () {
        setUpAll(() {
          when(storage.checkOnboarding).thenReturn(element);
        });

        test('should be return $element', () {
          expect(subject().call(), element);
        });
      });
    });
  });
}
