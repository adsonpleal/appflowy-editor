import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meta/meta.dart';

void main() {
  group('platform extension', () {
    group('when isWeb = true', () {
      _testWeb('test isMacOS', () {
        _testAllTargetPlatforms(
          actual: () => PlatformExtension.isMacOS,
          expected: false,
        );
      });

      _testWeb('test isIOS', () {
        _testAllTargetPlatforms(
          actual: () => PlatformExtension.isIOS,
          expected: false,
        );
      });

      _testWeb('test isAndroid', () {
        _testAllTargetPlatforms(
          actual: () => PlatformExtension.isAndroid,
          expected: false,
        );
      });

      _testWeb('test isWindows', () {
        _testAllTargetPlatforms(
          actual: () => PlatformExtension.isWindows,
          expected: false,
        );
      });

      _testWeb('test isLinux', () {
        _testAllTargetPlatforms(
          actual: () => PlatformExtension.isLinux,
          expected: false,
        );
      });

      _testWeb('test isWebOnMacOS', () {
        _testTargetPlatform(
          TargetPlatform.macOS,
          actual: () => PlatformExtension.isWebOnMacOS,
          expected: true,
        );
        _testAllTargetPlatformsBut(
          TargetPlatform.macOS,
          actual: () => PlatformExtension.isWebOnMacOS,
          expected: false,
        );
      });

      _testWeb('test isWebOnWindows', () {
        _testTargetPlatform(
          TargetPlatform.windows,
          actual: () => PlatformExtension.isWebOnWindows,
          expected: true,
        );
        _testAllTargetPlatformsBut(
          TargetPlatform.windows,
          actual: () => PlatformExtension.isWebOnWindows,
          expected: false,
        );
      });

      _testWeb('test isWebOnLinux', () {
        _testTargetPlatform(
          TargetPlatform.linux,
          actual: () => PlatformExtension.isWebOnLinux,
          expected: true,
        );
        _testAllTargetPlatformsBut(
          TargetPlatform.linux,
          actual: () => PlatformExtension.isWebOnLinux,
          expected: false,
        );
      });

      _testWeb('test isDesktopOrWeb', () {
        _testAllTargetPlatforms(
          actual: () => PlatformExtension.isDesktopOrWeb,
          expected: true,
        );
      });

      _testWeb('test isDesktop', () {
        _testAllTargetPlatforms(
          actual: () => PlatformExtension.isDesktop,
          expected: false,
        );
      });

      _testWeb('test isMobile', () {
        _testAllTargetPlatforms(
          actual: () => PlatformExtension.isMobile,
          expected: false,
        );
      });

      _testWeb('test isNotMobile', () {
        _testAllTargetPlatforms(
          actual: () => PlatformExtension.isNotMobile,
          expected: false,
        );
      });
    });

    group('when isWeb = false', () {
      _testNonWeb('test isMacOS', () {
        _testTargetPlatform(
          TargetPlatform.macOS,
          actual: () => PlatformExtension.isMacOS,
          expected: true,
        );
        _testAllTargetPlatformsBut(
          TargetPlatform.macOS,
          actual: () => PlatformExtension.isMacOS,
          expected: false,
        );
      });

      _testNonWeb('test isIOS', () {
        _testTargetPlatform(
          TargetPlatform.iOS,
          actual: () => PlatformExtension.isIOS,
          expected: true,
        );
        _testAllTargetPlatformsBut(
          TargetPlatform.iOS,
          actual: () => PlatformExtension.isIOS,
          expected: false,
        );
      });

      _testNonWeb('test isAndroid', () {
        _testTargetPlatform(
          TargetPlatform.android,
          actual: () => PlatformExtension.isAndroid,
          expected: true,
        );
        _testAllTargetPlatformsBut(
          TargetPlatform.android,
          actual: () => PlatformExtension.isAndroid,
          expected: false,
        );
      });

      _testNonWeb('test isWindows', () {
        _testTargetPlatform(
          TargetPlatform.windows,
          actual: () => PlatformExtension.isWindows,
          expected: true,
        );
        _testAllTargetPlatformsBut(
          TargetPlatform.windows,
          actual: () => PlatformExtension.isWindows,
          expected: false,
        );
      });

      _testNonWeb('test isLinux', () {
        _testTargetPlatform(
          TargetPlatform.linux,
          actual: () => PlatformExtension.isLinux,
          expected: true,
        );
        _testAllTargetPlatformsBut(
          TargetPlatform.linux,
          actual: () => PlatformExtension.isLinux,
          expected: false,
        );
      });

      _testNonWeb('test isWebOnMacOS', () {
        _testAllTargetPlatforms(
          actual: () => PlatformExtension.isWebOnMacOS,
          expected: false,
        );
      });

      _testNonWeb('test isWebOnWindows', () {
        _testAllTargetPlatforms(
          actual: () => PlatformExtension.isWebOnWindows,
          expected: false,
        );
      });

      _testNonWeb('test isWebOnLinux', () {
        _testAllTargetPlatforms(
          actual: () => PlatformExtension.isWebOnLinux,
          expected: false,
        );
      });

      _testNonWeb('test isDesktopOrWeb', () {
        _testTargetPlatforms(
          _desktopPlatforms,
          actual: () => PlatformExtension.isDesktopOrWeb,
          expected: true,
        );
        _testTargetPlatforms(
          _mobilePlatforms,
          actual: () => PlatformExtension.isDesktopOrWeb,
          expected: false,
        );
      });

      _testNonWeb('test isDesktop', () {
        _testTargetPlatforms(
          _desktopPlatforms,
          actual: () => PlatformExtension.isDesktop,
          expected: true,
        );
        _testTargetPlatforms(
          _mobilePlatforms,
          actual: () => PlatformExtension.isDesktop,
          expected: false,
        );
      });

      _testNonWeb('test isMobile', () {
        _testTargetPlatforms(
          _mobilePlatforms,
          actual: () => PlatformExtension.isMobile,
          expected: true,
        );
        _testTargetPlatforms(
          _desktopPlatforms,
          actual: () => PlatformExtension.isMobile,
          expected: false,
        );
      });

      _testNonWeb('test isNotMobile', () {
        _testTargetPlatforms(
          _mobilePlatforms,
          actual: () => PlatformExtension.isNotMobile,
          expected: false,
        );
        _testTargetPlatforms(
          _desktopPlatforms,
          actual: () => PlatformExtension.isNotMobile,
          expected: true,
        );
      });
    });
  });
}

List<TargetPlatform> get _mobilePlatforms => [
      TargetPlatform.iOS,
      TargetPlatform.android,
    ];

List<TargetPlatform> get _desktopPlatforms => [
      TargetPlatform.macOS,
      TargetPlatform.windows,
      TargetPlatform.linux,
    ];

void _testWebOverride(String description, bool isWeb, void Function() testFn) {
  test(description, () {
    tearDown(() {
      PlatformExtension.debugIsWebOverride = null;
    });
    PlatformExtension.debugIsWebOverride = isWeb;
    testFn();
  });
}

@isTest
void _testWeb(String description, void Function() testFn) {
  _testWebOverride(description, true, testFn);
}

@isTest
void _testNonWeb(String description, void Function() testFn) {
  _testWebOverride(description, false, testFn);
}

List<TargetPlatform> _allPlatformsBut(TargetPlatform platform) {
  return [...TargetPlatform.values]..remove(platform);
}

void _testTargetPlatforms(
  List<TargetPlatform> platforms, {
  required bool Function() actual,
  required bool expected,
}) {
  tearDown(() {
    debugDefaultTargetPlatformOverride = null;
  });
  for (final platform in platforms) {
    debugDefaultTargetPlatformOverride = platform;
    expect(
      actual(),
      equals(expected),
    );
  }
}

void _testTargetPlatform(
  TargetPlatform platform, {
  required bool Function() actual,
  required bool expected,
}) {
  _testTargetPlatforms(
    [platform],
    actual: actual,
    expected: expected,
  );
}

void _testAllTargetPlatforms({
  required bool Function() actual,
  required bool expected,
}) {
  _testTargetPlatforms(
    TargetPlatform.values,
    actual: actual,
    expected: expected,
  );
}

void _testAllTargetPlatformsBut(
  TargetPlatform excludedPlatform, {
  required bool Function() actual,
  required bool expected,
}) {
  _testTargetPlatforms(
    _allPlatformsBut(excludedPlatform),
    actual: actual,
    expected: expected,
  );
}
