library boxes;

//
// Copyright 2023 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//

import 'package:boxes/boxes_view.dart'
    show
        InheritedWidgetBoxMixin,
        ScaffoldFieldsBoxMixin,
        makeInheritedWidgetBox;

import 'package:flutter/material.dart';

import 'package:flutter/gestures.dart' show DragStartBehavior;

/// Likely needed by subclasses
export 'package:boxes/controller/controller_box.dart';

///
class ScaffoldBox extends StatelessWidget {
  ///
  ScaffoldBox({
    super.key,
    ScaffoldFieldsBoxMixin? controller,
    PreferredSizeWidget? appBar,
    Widget? body,
    Widget? drawer,
    Widget? endDrawer,
    Widget? bottomNavigationBar,
    Widget? bottomSheet,
    Widget? floatingActionButton,
    List<Widget>? persistentFooterButtons,
  }) : widget = makeInheritedWidgetBox(
          keyId: key,
          controller: controller,
          child: _ScaffoldBox(
            appBar: appBar,
            body: body,
            drawer: drawer,
            endDrawer: endDrawer,
            bottomNavigationBar: bottomNavigationBar,
            bottomSheet: bottomSheet,
            floatingActionButton: floatingActionButton,
            persistentFooterButtons: persistentFooterButtons,
            controller: controller,
          ),
        );
  final Widget widget;

  @override
  Widget build(BuildContext context) => widget;
}

///
class _ScaffoldBox extends StatelessWidget {
  _ScaffoldBox({
    // ignore: unused_element
    super.key,
    this.appBar,
    this.body,
    this.drawer,
    this.endDrawer,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.floatingActionButton,
    this.persistentFooterButtons,
    ScaffoldFieldsBoxMixin? controller,
  }) : controller = controller ?? ScaffoldBoxController();

  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? drawer;
  final Widget? endDrawer;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final Widget? floatingActionButton;
  final List<Widget>? persistentFooterButtons;
  final ScaffoldFieldsBoxMixin controller;

  @override
  Widget build(BuildContext context) {
    //
    if (controller is InheritedWidgetBoxMixin) {
      (controller as InheritedWidgetBoxMixin).dependOnInheritedWidget(context);
    }
    return Scaffold(
      key: controller.key,
      appBar: controller.appBar ?? appBar,
      body: controller.body ?? body,
      floatingActionButton:
          controller.floatingActionButton ?? floatingActionButton,
      floatingActionButtonLocation: controller.floatingActionButtonLocation,
      floatingActionButtonAnimator: controller.floatingActionButtonAnimator,
      persistentFooterButtons:
          controller.persistentFooterButtons ?? persistentFooterButtons,
      persistentFooterAlignment: controller.persistentFooterAlignment ??
          AlignmentDirectional.centerEnd,
      drawer: controller.drawer ?? drawer,
      onDrawerChanged: controller.onDrawerChanged,
      endDrawer: controller.endDrawer ?? endDrawer,
      onEndDrawerChanged: controller.onEndDrawerChanged,
      bottomNavigationBar:
          controller.bottomNavigationBar ?? bottomNavigationBar,
      bottomSheet: controller.bottomSheet ?? bottomSheet,
      backgroundColor: controller.backgroundColor,
      resizeToAvoidBottomInset: controller.resizeToAvoidBottomInset,
      primary: controller.primary ?? true,
      drawerDragStartBehavior:
          controller.drawerDragStartBehavior ?? DragStartBehavior.start,
      extendBody: controller.extendBody ?? false,
      extendBodyBehindAppBar: controller.extendBodyBehindAppBar ?? false,
      drawerScrimColor: controller.drawerScrimColor,
      drawerEdgeDragWidth: controller.drawerEdgeDragWidth,
      drawerEnableOpenDragGesture:
          controller.drawerEnableOpenDragGesture ?? true,
      endDrawerEnableOpenDragGesture:
          controller.endDrawerEnableOpenDragGesture ?? true,
      restorationId: controller.restorationId,
    );
  }
}

/// User has the option to extend this class or use the indicated mixin
class ScaffoldBoxController
    with ScaffoldFieldsBoxMixin, InheritedWidgetBoxMixin {
  ///
  ScaffoldBoxController({
    Key? key,
    bool? extendBody,
    bool? extendBodyBehindAppBar,
    PreferredSizeWidget? appBar,
    Widget? body,
    Widget? floatingActionButton,
    FloatingActionButtonLocation? floatingActionButtonLocation,
    FloatingActionButtonAnimator? floatingActionButtonAnimator,
    List<Widget>? persistentFooterButtons,
    AlignmentDirectional? persistentFooterAlignment,
    Widget? drawer,
    DrawerCallback? onDrawerChanged,
    Widget? endDrawer,
    DrawerCallback? onEndDrawerChanged,
    Color? drawerScrimColor,
    Color? backgroundColor,
    Widget? bottomNavigationBar,
    Widget? bottomSheet,
    bool? resizeToAvoidBottomInset,
    bool? primary,
    DragStartBehavior? drawerDragStartBehavior,
    double? drawerEdgeDragWidth,
    bool? drawerEnableOpenDragGesture,
    bool? endDrawerEnableOpenDragGesture,
    String? restorationId,
  }) {
    this.key = key;
    this.extendBody = extendBody;
    this.extendBodyBehindAppBar = extendBodyBehindAppBar;
    this.appBar = appBar;
    this.body = body;
    this.floatingActionButton = floatingActionButton;
    this.floatingActionButtonLocation = floatingActionButtonLocation;
    this.floatingActionButtonAnimator = floatingActionButtonAnimator;
    this.persistentFooterButtons = persistentFooterButtons;
    this.persistentFooterAlignment = persistentFooterAlignment;
    this.drawer = drawer;
    this.onDrawerChanged = onDrawerChanged;
    this.endDrawer = endDrawer;
    this.onEndDrawerChanged = onEndDrawerChanged;
    this.drawerScrimColor = drawerScrimColor;
    this.backgroundColor = backgroundColor;
    this.bottomNavigationBar = bottomNavigationBar;
    this.bottomSheet = bottomSheet;
    this.resizeToAvoidBottomInset = resizeToAvoidBottomInset;
    this.primary = primary;
    this.drawerDragStartBehavior = drawerDragStartBehavior;
    this.drawerEdgeDragWidth = drawerEdgeDragWidth;
    this.drawerEnableOpenDragGesture = drawerEnableOpenDragGesture;
    this.endDrawerEnableOpenDragGesture = endDrawerEnableOpenDragGesture;
    this.restorationId = restorationId;
  }
}
