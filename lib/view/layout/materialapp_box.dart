library boxes;

//
// Copyright 2023 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//

import 'package:boxes/view/_view_export_file.dart';

import 'package:flutter/material.dart';

export 'package:boxes/controller/InheritedWidget_box_mixin.dart';

///
class MaterialAppBox extends StatelessWidget {
  ///
  MaterialAppBox({
    super.key,
    MaterialAppFieldsBoxMixin? controller,
    final Widget? home,
    final Map<String, WidgetBuilder>? routes,
  }) : widget = makeInheritedWidgetBox(
          keyId: key,
          controller: controller,
          child: _MaterialAppBox(
            controller: controller,
            home: home,
            routes: routes,
          ),
        );

  final Widget widget;

  @override
  Widget build(BuildContext context) => widget;
}

class _MaterialAppBox extends StatelessWidget {
  ///
  _MaterialAppBox({
    super.key,
    MaterialAppFieldsBoxMixin? controller,
    this.home,
    this.routes,
  }) : controller = controller ?? _MaterialAppBoxController();

  final MaterialAppFieldsBoxMixin controller;
  final Widget? home;
  final Map<String, WidgetBuilder>? routes;

  @override
  Widget build(BuildContext context) {
    //
    if (controller is InheritedWidgetBoxMixin) {
      (controller as InheritedWidgetBoxMixin).dependOnInheritedWidget(context);
    }

    return MaterialApp(
      key: controller.key ?? UniqueKey(), // Recreates its State object
      navigatorKey: controller.navigatorKey,
      scaffoldMessengerKey: controller.scaffoldMessengerKey,
      home: controller.home ?? home,
      routes: controller.routes ?? routes ?? const <String, WidgetBuilder>{},
      initialRoute: controller.initialRoute,
      onGenerateRoute: controller.onGenerateRoute,
      onGenerateInitialRoutes: controller.onGenerateInitialRoutes,
      onUnknownRoute: controller.onUnknownRoute,
      navigatorObservers:
          controller.navigatorObservers ?? const <NavigatorObserver>[],
      builder: controller.builder,
      title: controller.title ?? '',
      onGenerateTitle: controller.onGenerateTitle,
      color: controller.color,
      theme: controller.theme,
      darkTheme: controller.darkTheme,
      highContrastTheme: controller.highContrastTheme,
      highContrastDarkTheme: controller.highContrastDarkTheme,
      themeMode: controller.themeMode ?? ThemeMode.system,
      themeAnimationDuration:
          controller.themeAnimationDuration ?? kThemeAnimationDuration,
      themeAnimationCurve: controller.themeAnimationCurve ?? Curves.linear,
      locale: controller.locale,
      localizationsDelegates: controller.localizationsDelegates,
      localeListResolutionCallback: controller.localeListResolutionCallback,
      localeResolutionCallback: controller.localeResolutionCallback,
      supportedLocales:
          controller.supportedLocales ?? const <Locale>[Locale('en', 'US')],
      debugShowMaterialGrid: controller.debugShowMaterialGrid ?? false,
      showPerformanceOverlay: controller.showPerformanceOverlay ?? false,
      checkerboardRasterCacheImages:
          controller.checkerboardRasterCacheImages ?? false,
      checkerboardOffscreenLayers:
          controller.checkerboardOffscreenLayers ?? false,
      showSemanticsDebugger: controller.showSemanticsDebugger ?? false,
      debugShowCheckedModeBanner: controller.debugShowCheckedModeBanner ?? true,
      shortcuts: controller.shortcuts,
      actions: controller.actions,
      restorationScopeId: controller.restorationScopeId,
      scrollBehavior: controller.scrollBehavior,
    );
  }
}

/// Used if a controller is not explicitly provided to the Box widget above.
class _MaterialAppBoxController
    with MaterialAppFieldsBoxMixin, InheritedWidgetBoxMixin {}
