import 'dart:io';

enum PlatformType {
  android,
  ios,
}

String castEnumToString(String string) => string.toString().split('.').last;

extension ParseToStringPlatform on PlatformType {
  String toShortString() {
    final that = this;
    return castEnumToString(that.toString());
  }
}

extension ParseToPlatformFromString on String {
  PlatformType toUpdatePlatformType() {
    final that = this;
    return PlatformType.values.firstWhere(
      (e) => e.toShortString() == that.toString(),
      orElse: () => PlatformType.android,
    );
  }
}

PlatformType get platform {
  return Platform.operatingSystem.toUpdatePlatformType();
}
