import 'package:find_coffee_app/src/config/configuration.dart';
import 'package:find_coffee_app/src/pages/onboarding/onboarding_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../test_utils/mocks/mocks.dart';

void main() {
  final router = MockRouter();
  final checkOnboardingInteractor = MockCheckOnboardingInteractor();

  OnboardingViewModel subject() {
    return OnboardingViewModel(router, checkOnboardingInteractor);
  }

  setUpAll(() {
    when(router.replaceTo(any)).thenAnswer((_) async => null);
  });

  group('.onGetStartedClicked', () {
    setUpAll(() async {
      await subject().onGetStartedClicked();
    });

    test('should be set onboarding check into storage', () {
      verify(checkOnboardingInteractor.call());
    });

    test('should be shows home page', () {
      verify(router.replaceTo(argThat(isA<HomeRoute>())));
    });
  });
}
