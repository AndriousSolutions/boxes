//
// Copyright 2023 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//

import '../_example_app_imports.dart';

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
    _prevTheme = _theme;

    _propertyText = TextDescription();
  }
  late TextDescription _propertyText;

  /// Each getter is a corresponding field found in the MaterialApp widget

  @override
  get title => 'Flutter Demo';

  @override
  get theme => _theme;
  @override
  set theme(ThemeData? theme) {
    if (theme == null) {
      _theme = _prevTheme;
    } else {
      _prevTheme = _theme;
      _theme = theme;
    }
  }

  late ThemeData _theme;
  late ThemeData _prevTheme;

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
  bool onCount(int? count) {
    // Always test parameters
    if (count == null) return true;

    ///
    if (count > 53) return false;

    if (count > 52) {
      _propertyText.description = "";
      // null turns off the dark theme
      _themeMode = null;
      // If device is in 'dark mode', setting this to null is further necessary.
      _darkTheme = null;
      notifyBoxes();
      return true;
    }

    if (count > 51) {
      _propertyText.description = "Turn on Dark Mode";
      _themeMode = ThemeMode.dark;
      // field, darkTheme, cannot be null
      _darkTheme = ThemeData(brightness: Brightness.dark, useMaterial3: true);
      notifyBoxes();
      return true;
    }

    // if (count > 12) {
    //   _color = null;
    //   notifyClients();
    //   return true;
    // }
    //
    // if (count > 11) {
    //   _color = Colors.blue;
    //   notifyClients();
    //   return true;
    // }

    if (count > 50) {
      _showPerformanceOverlay = false;
      _propertyText.description = "";
      notifyBoxes();
      return true;
    }

    if (count > 49) {
      _showPerformanceOverlay = true;
      _propertyText.description = "Performance Overlay";
      notifyBoxes();
      return true;
    }

    // if (count > 10) {
    //   _checkerboardRasterCacheImages = false;
    //   notifyClients();
    //   return true;
    // }
    //
    // if (count > 8) {
    //   _checkerboardRasterCacheImages = true;
    //   notifyClients();
    //   return true;
    // }

    // if (count > 10) {
    //   _checkerboardOffscreenLayers = false;
    //   notifyClients();
    //   return true;
    // }
    //
    // if (count > 9) {
    //   _checkerboardOffscreenLayers = true;
    //   notifyClients();
    //   return true;
    // }

    // if (count > 10) {
    //   _showSemanticsDebugger = false;
    //   notifyClients();
    //   return true;
    // }
    //
    // if (count > 9) {
    //   _showSemanticsDebugger = true;
    //   notifyClients();
    //   return true;
    // }

    if (count > 48) {
      _showBanner = true;
      _propertyText.description = "";
      notifyBoxes();
      return true;
    }

    if (count > 47) {
      _showBanner = false;
      _propertyText.description = "Hide debug banner";
      notifyBoxes();
      return true;
    }

    if (count > 46) {
      _debugShowMaterialGrid = false;
      _propertyText.description = "";
      notifyBoxes();
      return true;
    }

    if (count > 45) {
      _debugShowMaterialGrid = true;
      _propertyText.description = "Show Material grid";
      notifyBoxes();
      return true;
    }

    ///
    if (count > 44) {
      _theme = _theme.copyWith(useMaterial3: true);
      _propertyText.description = "Back to Design ver. 3";
      notifyBoxes();
      return true;
    }

    ///
    if (count > 43) {
      _theme = _theme.copyWith(useMaterial3: false);
      _propertyText.description = "Material Design ver. 2";
      notifyBoxes();
      return true;
    }

    ///
    if (count > 42) {
      theme = null;
      _propertyText.description = "";
      notifyBoxes();
      return true;
    }

    ///
    if (count > 41) {
      _theme = ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      );
      _propertyText.description = "MaterialApp's theme";
      notifyBoxes();
      return true;
    }

    return false;
  }
}
