import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meta/meta.dart';

void main() {
  group('platform extension', () {
    group('when isWeb = true', () {
      _testWeb('test isMacOS', () {
        testAllTargetPlatforms(
          actual: () => PlatformExtension.isMacOS,
          expected: false,
        );
      });

      _testWeb('test isIOS', () {
        testAllTargetPlatforms(
          actual: () => PlatformExtension.isIOS,
          expected: false,
        );
      });

      _testWeb('test isAndroid', () {
        testAllTargetPlatforms(
          actual: () => PlatformExtension.isAndroid,
          expected: false,
        );
      });

      _testWeb('test isWindows', () {
        testAllTargetPlatforms(
          actual: () => PlatformExtension.isWindows,
          expected: false,
        );
      });

      _testWeb('test isLinux', () {
        testAllTargetPlatforms(
          actual: () => PlatformExtension.isLinux,
          expected: false,
        );
      });

      _testWeb('test isWebOnMacOS', () {
        debugDefaultTargetPlatformOverride = TargetPlatform.macOS;
        expect(
          PlatformExtension.isWebOnMacOS,
          equals(true),
        );
        testAllTargetPlatformsBut(
          TargetPlatform.macOS,
          actual: () => PlatformExtension.isWebOnMacOS,
          expected: false,
        );
      });

      _testWeb('test isWebOnWindows', () {
        debugDefaultTargetPlatformOverride = TargetPlatform.windows;
        expect(
          PlatformExtension.isWebOnWindows,
          equals(true),
        );
        testAllTargetPlatformsBut(
          TargetPlatform.windows,
          actual: () => PlatformExtension.isWebOnWindows,
          expected: false,
        );
      });

      _testWeb('test isWebOnLinux', () {
        debugDefaultTargetPlatformOverride = TargetPlatform.linux;
        expect(
          PlatformExtension.isWebOnLinux,
          equals(true),
        );
        testAllTargetPlatformsBut(
          TargetPlatform.linux,
          actual: () => PlatformExtension.isWebOnLinux,
          expected: false,
        );
      });

      _testWeb('test isDesktopOrWeb', () {
        testAllTargetPlatforms(
          actual: () => PlatformExtension.isDesktopOrWeb,
          expected: true,
        );
      });

      _testWeb('test isDesktop', () {
        testAllTargetPlatforms(
          actual: () => PlatformExtension.isDesktop,
          expected: false,
        );
      });

      _testWeb('test isMobile', () {
        testAllTargetPlatforms(
          actual: () => PlatformExtension.isMobile,
          expected: false,
        );
      });

      _testWeb('test isNotMobile', () {
        testAllTargetPlatforms(
          actual: () => PlatformExtension.isNotMobile,
          expected: false,
        );
      });
    });

    group('when isWeb = false', () {
      _testNonWeb('test isMacOS', () {
        debugDefaultTargetPlatformOverride = TargetPlatform.macOS;
        expect(
          PlatformExtension.isMacOS,
          equals(true),
        );
        testAllTargetPlatformsBut(
          TargetPlatform.macOS,
          actual: () => PlatformExtension.isMacOS,
          expected: false,
        );
      });

      _testNonWeb('test isIOS', () {
        debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
        expect(
          PlatformExtension.isIOS,
          equals(true),
        );
        testAllTargetPlatformsBut(
          TargetPlatform.iOS,
          actual: () => PlatformExtension.isIOS,
          expected: false,
        );
      });

      _testNonWeb('test isAndroid', () {
        debugDefaultTargetPlatformOverride = TargetPlatform.android;
        expect(
          PlatformExtension.isAndroid,
          equals(true),
        );
        testAllTargetPlatformsBut(
          TargetPlatform.android,
          actual: () => PlatformExtension.isAndroid,
          expected: false,
        );
      });

      _testNonWeb('test isWindows', () {
        debugDefaultTargetPlatformOverride = TargetPlatform.windows;
        expect(
          PlatformExtension.isWindows,
          equals(true),
        );
        testAllTargetPlatformsBut(
          TargetPlatform.windows,
          actual: () => PlatformExtension.isWindows,
          expected: false,
        );
      });

      _testNonWeb('test isLinux', () {
        debugDefaultTargetPlatformOverride = TargetPlatform.linux;
        expect(
          PlatformExtension.isLinux,
          equals(true),
        );
        testAllTargetPlatformsBut(
          TargetPlatform.linux,
          actual: () => PlatformExtension.isLinux,
          expected: false,
        );
      });

      _testNonWeb('test isWebOnMacOS', () {
        testAllTargetPlatforms(
          actual: () => PlatformExtension.isWebOnMacOS,
          expected: false,
        );
      });

      _testNonWeb('test isWebOnWindows', () {
        testAllTargetPlatforms(
          actual: () => PlatformExtension.isWebOnWindows,
          expected: false,
        );
      });

      _testNonWeb('test isWebOnLinux', () {
        testAllTargetPlatforms(
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

@isTest
void _testWeb(String description, void Function() testFn) {
  test(description, () {
    PlatformExtension.debugIsWebOverride = true;
    testFn();
  });
}

@isTest
void _testNonWeb(String description, void Function() testFn) {
  test(description, () {
    PlatformExtension.debugIsWebOverride = false;
    testFn();
  });
}

List<TargetPlatform> _allPlatformsBut(TargetPlatform platform) {
  return [...TargetPlatform.values]..remove(platform);
}

void _testTargetPlatforms(
  List<TargetPlatform> platforms, {
  required bool Function() actual,
  required bool expected,
}) {
  for (final platform in platforms) {
    debugDefaultTargetPlatformOverride = platform;
    expect(
      actual(),
      equals(expected),
    );
  }
}

void testAllTargetPlatforms({
  required bool Function() actual,
  required bool expected,
}) {
  _testTargetPlatforms(
    TargetPlatform.values,
    actual: actual,
    expected: expected,
  );
}

void testAllTargetPlatformsBut(
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
