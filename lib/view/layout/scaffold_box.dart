library boxes;

//
// Copyright 2023 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//

import 'package:boxes/boxes.dart';
import 'package:flutter/material.dart';

import 'package:flutter/gestures.dart';

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
  }) : controller = controller ?? _ScaffoldBoxController();

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
      bottomSheet: bottomSheet ?? controller.bottomSheet,
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

class _ScaffoldBoxController
    with ScaffoldFieldsBoxMixin, InheritedWidgetBoxMixin {}
