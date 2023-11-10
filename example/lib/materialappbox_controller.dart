//
// Copyright 2023 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//

import '_example_imports.dart';

import 'package:boxes/boxes.dart';

class MaterialAppController
    with MaterialAppFieldsBoxMixin, InheritedWidgetBoxMixin {
  /// A factory constructor always for one instance from multiple constructor calls
  /// This constructor is called throughout the example app.
  factory MaterialAppController() => _this ??= MaterialAppController._();
  static MaterialAppController? _this;
  MaterialAppController._() {
    //
    _theme = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    );
  }

  @override
  get title => 'Flutter Demo';

  @override
  get onGenerateTitle => null;

  @override
  get theme => _theme;
  late ThemeData _theme;

  @override
  get darkTheme => null;

  @override
  get highContrastTheme => null;

  @override
  get highContrastDarkTheme => null;

  @override
  get themeMode => null;

  @override
  get themeAnimationDuration => null;

  @override
  get themeAnimationCurve => null;

  @override
  get color => null;

  @override
  get showPerformanceOverlay => null;

  @override
  get checkerboardRasterCacheImages => null;

  @override
  get checkerboardOffscreenLayers => null;

  @override
  get showSemanticsDebugger => null;

  @override
  get debugShowCheckedModeBanner => _showBanner;
  var _showBanner = true;

  @override
  get shortcuts => null;

  @override
  get actions => null;

  @override
  get restorationScopeId => null;

  @override
  get scrollBehavior => null;

  @override
  get debugShowMaterialGrid => null;

  /// Routine changing the app's properties
  /// with every incrementation of the counter.
  void onCount(int? count) {
    // Always test parameters
    if (count == null) return;

    ///
    if (count > 15) return;

    if (count > 14) {
      _showBanner = false;
      notifyClients();
      return;
    }

    ///
    if (AppBarController().onCount(count)) {
      return;
    }

    ///
    if (count > 5) {
      _theme = _theme.copyWith(useMaterial3: true);
      notifyClients();
      return;
    }

    ///
    if (count > 4) {
      _theme = _theme.copyWith(useMaterial3: false);
      notifyClients();
      return;
    }

    ///
    if (count > 3) {
      _theme = ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      );
      notifyClients();
      return;
    }
  }
}
