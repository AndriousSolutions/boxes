library boxes;

//
// Copyright 2023 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//

import 'package:boxes/boxes_view.dart'
    show
        InheritedWidgetBoxMixin,
        MaterialAppFieldsBoxMixin,
        makeInheritedWidgetBox;

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
    // ignore: unused_element
    super.key,
    MaterialAppFieldsBoxMixin? controller,
    this.home,
    this.routes,
  }) : controller = controller ?? MaterialAppBoxController();

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

/// User has the option to extend this class or use the indicated mixin
class MaterialAppBoxController
    with MaterialAppFieldsBoxMixin, InheritedWidgetBoxMixin {
  MaterialAppBoxController({
    Key? key,
    GlobalKey<NavigatorState>? navigatorKey,
    GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey,
    Widget? home,
    Map<String, WidgetBuilder>? routes,
    String? initialRoute,
    RouteFactory? onGenerateRoute,
    InitialRouteListFactory? onGenerateInitialRoutes,
    RouteFactory? onUnknownRoute,
    List<NavigatorObserver>? navigatorObservers,
    RouteInformationProvider? routeInformationProvider,
    RouteInformationParser<Object>? routeInformationParser,
    RouterDelegate<Object>? routerDelegate,
    BackButtonDispatcher? backButtonDispatcher,
    RouterConfig<Object>? routerConfig,
    TransitionBuilder? builder,
    String? title,
    GenerateAppTitle? onGenerateTitle,
    ThemeData? theme,
    ThemeData? darkTheme,
    ThemeData? highContrastTheme,
    ThemeData? highContrastDarkTheme,
    ThemeMode? themeMode,
    Duration? themeAnimationDuration,
    Curve? themeAnimationCurve,
    Color? color,
    Locale? locale,
    Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates,
    LocaleListResolutionCallback? localeListResolutionCallback,
    LocaleResolutionCallback? localeResolutionCallback,
    Iterable<Locale>? supportedLocales,
    bool? debugShowMaterialGrid,
    bool? showPerformanceOverlay,
    bool? checkerboardRasterCacheImages,
    bool? checkerboardOffscreenLayers,
    bool? showSemanticsDebugger,
    bool? debugShowCheckedModeBanner,
    Map<ShortcutActivator, Intent>? shortcuts,
    Map<Type, Action<Intent>>? actions,
    String? restorationScopeId,
    ScrollBehavior? scrollBehavior,
  }) {
    this.key = key;
    this.navigatorKey = navigatorKey;
    this.scaffoldMessengerKey = scaffoldMessengerKey;
    this.home = home;
    this.routes = routes;
    this.initialRoute = initialRoute;
    this.onGenerateRoute = onGenerateRoute;
    this.onGenerateInitialRoutes = onGenerateInitialRoutes;
    this.onUnknownRoute = onUnknownRoute;
    this.navigatorObservers = navigatorObservers;
    this.builder = builder;
    this.title = title;
    this.onGenerateTitle = onGenerateTitle;
    this.color = color;
    this.theme = theme;
    this.darkTheme = darkTheme;
    this.highContrastTheme = highContrastTheme;
    this.highContrastDarkTheme = highContrastDarkTheme;
    this.themeMode = themeMode;
    this.themeAnimationDuration = themeAnimationDuration;
    this.themeAnimationCurve = themeAnimationCurve;
    this.locale = locale;
    this.localizationsDelegates = localizationsDelegates;
    this.localeListResolutionCallback = localeListResolutionCallback;
    this.localeResolutionCallback = localeResolutionCallback;
    this.supportedLocales = supportedLocales;
    this.debugShowMaterialGrid = debugShowMaterialGrid;
    this.showPerformanceOverlay = showPerformanceOverlay;
    this.checkerboardRasterCacheImages = checkerboardRasterCacheImages;
    this.checkerboardOffscreenLayers = checkerboardOffscreenLayers;
    this.showSemanticsDebugger = showSemanticsDebugger;
    this.debugShowCheckedModeBanner = debugShowCheckedModeBanner;
    this.shortcuts = shortcuts;
    this.actions = actions;
    this.restorationScopeId = restorationScopeId;
    this.scrollBehavior = scrollBehavior;
  }
}
