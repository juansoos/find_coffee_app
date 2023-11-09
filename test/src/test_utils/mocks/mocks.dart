import 'package:find_coffee_app/src/api/interactor/check_onboarding_interactor.dart';
import 'package:find_coffee_app/src/common/storage.dart';
import 'package:find_coffee_app/src/config/configuration.dart';
import 'package:mockito/annotations.dart';

export 'mocks.mocks.dart';

@GenerateMocks([
  CheckOnboardingInteractor,
  Router,
  Storage,
])
void main() {}
