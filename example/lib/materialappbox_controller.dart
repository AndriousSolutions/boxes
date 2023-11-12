//
// Copyright 2023 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//

import '_example_imports.dart';

import 'package:boxes/boxes.dart';

/// The MaterialApp widget now has a controller
/// allowing for spontaneous updates of its properties
/// If set up with a GlobalKey, it's child Widget will be left alone and not rebuilt
/// with every update. Brilliant.
class MaterialAppController
    with MaterialAppFieldsBoxMixin, InheritedWidgetBoxMixin {
  // A factory constructor always for one instance from multiple constructor calls
  // This constructor is called throughout the example app.
  factory MaterialAppController() => _this ??= MaterialAppController._();

  static MaterialAppController? _this;

  MaterialAppController._() {
    //
    _theme = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    );
  }

  /// Each getter is a corresponding field found in the MaterialApp widget

  @override
  get title => 'Flutter Demo';

  @override
  get theme => _theme;
  late ThemeData _theme;

  @override
  get darkTheme => _darkTheme;
  ThemeData? _darkTheme;

  @override
  get themeMode => _themeMode;
  ThemeMode? _themeMode;

  // @override
  // get color => _color;
  // Color? _color;

  @override
  get showPerformanceOverlay => _showPerformanceOverlay;
  var _showPerformanceOverlay = false;

  // @override
  // get checkerboardRasterCacheImages => _checkerboardRasterCacheImages;
  // var _checkerboardRasterCacheImages = false;

  // @override
  // get checkerboardOffscreenLayers => _checkerboardOffscreenLayers;
  // var _checkerboardOffscreenLayers = false;

  // @override
  // get showSemanticsDebugger => _showSemanticsDebugger;
  // var _showSemanticsDebugger = false;

  @override
  get debugShowCheckedModeBanner => _showBanner;
  var _showBanner = true;

  @override
  get debugShowMaterialGrid => _debugShowMaterialGrid;
  var _debugShowMaterialGrid = false;

  /// Routine changing the app's properties
  /// with every incrementation of the counter.
  void onCount(int? count) {
    // Always test parameters
    if (count == null) return;

    ///
    if (count > 19) return;

    ///
    if (AppBarController().onCount(count)) {
      return;
    }

    if (count > 11) {
      // null turns off the dark theme
      _themeMode = null;
      notifyClients();
      return;
    }

    if (count > 10) {
      _themeMode = ThemeMode.dark;
      // field, darkTheme, cannot be null
      _darkTheme = ThemeData(brightness: Brightness.dark, useMaterial3: true);
      notifyClients();
      return;
    }

    // if (count > 11) {
    //   _color = null;
    //   notifyClients();
    //   return;
    // }
    //
    // if (count > 10) {
    //   _color = Colors.blue;
    //   notifyClients();
    //   return;
    // }

    if (count > 9) {
      _showPerformanceOverlay = false;
      notifyClients();
      return;
    }

    if (count > 8) {
      _showPerformanceOverlay = true;
      notifyClients();
      return;
    }

    // if (count > 9) {
    //   _checkerboardRasterCacheImages = false;
    //   notifyClients();
    //   return;
    // }
    //
    // if (count > 8) {
    //   _checkerboardRasterCacheImages = true;
    //   notifyClients();
    //   return;
    // }

    // if (count > 9) {
    //   _checkerboardOffscreenLayers = false;
    //   notifyClients();
    //   return;
    // }
    //
    // if (count > 8) {
    //   _checkerboardOffscreenLayers = true;
    //   notifyClients();
    //   return;
    // }

    // if (count > 9) {
    //   _showSemanticsDebugger = false;
    //   notifyClients();
    //   return;
    // }
    //
    // if (count > 8) {
    //   _showSemanticsDebugger = true;
    //   notifyClients();
    //   return;
    // }

    if (count > 7) {
      _showBanner = true;
      notifyClients();
      return;
    }

    if (count > 6) {
      _showBanner = false;
      notifyClients();
      return;
    }

    if (count > 5) {
      _debugShowMaterialGrid = false;
      notifyClients();
      return;
    }

    if (count > 4) {
      _debugShowMaterialGrid = true;
      notifyClients();
      return;
    }

    ///
    if (count > 3) {
      _theme = _theme.copyWith(useMaterial3: true);
      notifyClients();
      return;
    }

    ///
    if (count > 2) {
      _theme = _theme.copyWith(useMaterial3: false);
      notifyClients();
      return;
    }

    ///
    if (count > 1) {
      _theme = ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      );
      notifyClients();
      return;
    }
  }
}
