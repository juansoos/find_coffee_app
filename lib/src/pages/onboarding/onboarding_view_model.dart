import 'package:find_coffee_app/src/config/configuration.dart';

class OnboardingViewModel {
  OnboardingViewModel(this._router);

  final Router _router;

  void onGetStartedClicked() {
    _router.pushTo(HomeRoute());
  }
}
