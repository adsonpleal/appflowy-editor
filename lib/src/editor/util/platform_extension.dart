import 'package:flutter/foundation.dart';

abstract class PlatformExtension {
  // Used to test kIsWeb values
  @visibleForTesting
  static bool? debugIsWebOverride;

  static bool get _isWeb {
    if (debugIsWebOverride case final override?) {
      return override;
    }
    return kIsWeb;
  }

  /// Returns true if the operating system is macOS and not running on Web platform.
  static bool get isMacOS => _isPlatform(TargetPlatform.macOS);

  /// Returns true if the operating system is iOS and not running on Web platform.
  static bool get isIOS => _isPlatform(TargetPlatform.iOS);

  /// Returns true if the operating system is Android and not running on Web platform.
  static bool get isAndroid => _isPlatform(TargetPlatform.android);

  /// Returns true if the operating system is Windows and not running on Web platform.
  static bool get isWindows => _isPlatform(TargetPlatform.windows);

  /// Returns true if the operating system is Linux and not running on Web platform.
  static bool get isLinux => _isPlatform(TargetPlatform.linux);

  /// Returns true if the operating system is macOS and running on Web platform.
  static bool get isWebOnMacOS => _isWebPlatform(TargetPlatform.macOS);

  /// Returns true if the operating system is Windows and running on Web platform.
  static bool get isWebOnWindows => _isWebPlatform(TargetPlatform.windows);

  /// Returns true if the operating system is Linux and running on Web platform.
  static bool get isWebOnLinux => _isWebPlatform(TargetPlatform.linux);

  static bool get isDesktopOrWeb => _isWeb || isDesktop;

  static bool get isDesktop {
    if (_isWeb) {
      return false;
    }

    return [
      TargetPlatform.macOS,
      TargetPlatform.windows,
      TargetPlatform.linux,
    ].contains(defaultTargetPlatform);
  }

  static bool get isMobile {
    if (_isWeb) {
      return false;
    }

    return [
      TargetPlatform.iOS,
      TargetPlatform.android,
    ].contains(defaultTargetPlatform);
  }

  static bool get isNotMobile {
    if (_isWeb) {
      return false;
    }

    return !isMobile;
  }

  /// Returns true if the operating system the same as the given platform and not running on Web platform.
  static bool _isPlatform(TargetPlatform platform) {
    if (_isWeb) {
      return false;
    }
    return defaultTargetPlatform == platform;
  }

  /// Returns true if the operating system the same as the given platform and running on Web platform.
  static bool _isWebPlatform(TargetPlatform platform) {
    if (!_isWeb) {
      return false;
    }
    return defaultTargetPlatform == platform;
  }
}
