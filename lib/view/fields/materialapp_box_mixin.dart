library boxes;

//
// Copyright 2023 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//

import 'package:flutter/material.dart';

mixin MaterialAppFieldsBoxMixin {
  Key? key;
  GlobalKey<NavigatorState>? navigatorKey;
  GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey;
  Widget? home;
  Map<String, WidgetBuilder>? routes;
  String? initialRoute;
  RouteFactory? onGenerateRoute;
  InitialRouteListFactory? onGenerateInitialRoutes;
  RouteFactory? onUnknownRoute;
  List<NavigatorObserver>? navigatorObservers;
  RouteInformationProvider? routeInformationProvider;
  RouteInformationParser<Object>? routeInformationParser;
  RouterDelegate<Object>? routerDelegate;
  BackButtonDispatcher? backButtonDispatcher;
  RouterConfig<Object>? routerConfig;
  TransitionBuilder? builder;
  String? title;
  GenerateAppTitle? onGenerateTitle;
  ThemeData? theme;
  ThemeData? darkTheme;
  ThemeData? highContrastTheme;
  ThemeData? highContrastDarkTheme;
  ThemeMode? themeMode;
  Duration? themeAnimationDuration;
  Curve? themeAnimationCurve;
  Color? color;
  Locale? locale;
  Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  LocaleListResolutionCallback? localeListResolutionCallback;
  LocaleResolutionCallback? localeResolutionCallback;
  Iterable<Locale>? supportedLocales;
  bool? showPerformanceOverlay;
  bool? checkerboardRasterCacheImages;
  bool? checkerboardOffscreenLayers;
  bool? showSemanticsDebugger;
  bool? debugShowCheckedModeBanner;
  Map<ShortcutActivator, Intent>? shortcuts;
  Map<Type, Action<Intent>>? actions;
  String? restorationScopeId;
  ScrollBehavior? scrollBehavior;
  bool? debugShowMaterialGrid;
}
