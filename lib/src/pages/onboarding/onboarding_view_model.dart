import 'package:find_coffee_app/src/api/interactor/check_onboarding_interactor.dart';
import 'package:find_coffee_app/src/config/configuration.dart';

class OnboardingViewModel {
  OnboardingViewModel(this._router, this._checkOnboardingInteractor);

  final Router _router;
  final CheckOnboardingInteractor _checkOnboardingInteractor;

  Future<void> onGetStartedClicked() async {
    await _checkOnboardingInteractor();

    _router.pushTo(HomeRoute());
  }
}
