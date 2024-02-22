library boxes;

//
// Copyright 2023 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//

import 'package:flutter/material.dart'
    show
        AlignmentDirectional,
        Color,
        DrawerCallback,
        FloatingActionButtonAnimator,
        FloatingActionButtonLocation,
        Key,
        PreferredSizeWidget,
        Widget;

import 'package:flutter/gestures.dart' show DragStartBehavior;

export 'package:boxes/controller/InheritedWidget_box_mixin.dart';

mixin ScaffoldFieldsBoxMixin {
  Key? key;
  bool? extendBody;
  bool? extendBodyBehindAppBar;
  PreferredSizeWidget? appBar;
  Widget? body;
  Widget? floatingActionButton;
  FloatingActionButtonLocation? floatingActionButtonLocation;
  FloatingActionButtonAnimator? floatingActionButtonAnimator;
  List<Widget>? persistentFooterButtons;
  AlignmentDirectional? persistentFooterAlignment;
  Widget? drawer;
  DrawerCallback? onDrawerChanged;
  Widget? endDrawer;
  DrawerCallback? onEndDrawerChanged;
  Color? drawerScrimColor;
  Color? backgroundColor;
  Widget? bottomNavigationBar;
  Widget? bottomSheet;
  bool? resizeToAvoidBottomInset;
  bool? primary;
  DragStartBehavior? drawerDragStartBehavior;
  double? drawerEdgeDragWidth;
  bool? drawerEnableOpenDragGesture;
  bool? endDrawerEnableOpenDragGesture;
  String? restorationId;
}
