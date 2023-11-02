import 'package:find_coffee_app/src/api/interactor/check_onboarding_interactor.dart';
import 'package:find_coffee_app/src/api/interactor/validate_check_onboarding_interactor.dart';
import 'package:find_coffee_app/src/common/di/storage_module.dart';

abstract class InteractorModule {
  static CheckOnboardingInteractor checkOnboardingInteractor() {
    return CheckOnboardingInteractor(StorageModule.sessionStorage());
  }

  static ValidateCheckOnboardingInteractor validateCheckOnboardingInteractor() {
    return ValidateCheckOnboardingInteractor(StorageModule.sessionStorage());
  }
}
