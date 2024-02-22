library boxes;

//
// Copyright 2023 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//

import 'package:boxes/boxes_view.dart'
    show
        CenterFieldsBoxMixin,
        ColumnFieldsBoxMixin,
        InheritedWidgetBoxMixin,
        makeInheritedWidgetBox;

import 'package:flutter/material.dart';

/// Likely needed by subclasses
export 'package:boxes/controller/InheritedWidget_box_mixin.dart';

///
class CenterColumnBox extends StatelessWidget {
  ///
  CenterColumnBox({
    super.key,
    ColumnFieldsBoxMixin? controller,
    required List<Widget> children,
  }) : widget = makeInheritedWidgetBox(
          keyId: key,
          controller: controller,
          child: _CenterColumn(
            controller: controller,
            children: children,
          ),
        );

  final Widget widget;

  @override
  Widget build(BuildContext context) => widget;
}

///
class _CenterColumn extends StatelessWidget {
  _CenterColumn({
    // ignore: unused_element
    super.key,
    ColumnFieldsBoxMixin? controller,
    required this.children,
  }) : controller = controller ?? CenterColumnBoxController();

  final ColumnFieldsBoxMixin controller;

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    //
    CenterFieldsBoxMixin? center;

    if (controller is CenterFieldsBoxMixin) {
      center = controller as CenterFieldsBoxMixin;
    }

    if (controller is InheritedWidgetBoxMixin) {
      (controller as InheritedWidgetBoxMixin).dependOnInheritedWidget(context);
    }
    return Center(
      widthFactor: center?.widthFactor,
      heightFactor: center?.heightFactor,
      child: Column(
        key: controller.key,
        mainAxisAlignment:
            controller.mainAxisAlignment ?? MainAxisAlignment.start,
        mainAxisSize: controller.mainAxisSize ?? MainAxisSize.max,
        crossAxisAlignment:
            controller.crossAxisAlignment ?? CrossAxisAlignment.center,
        textDirection: controller.textDirection,
        verticalDirection:
            controller.verticalDirection ?? VerticalDirection.down,
        textBaseline: controller.textBaseline,
        children: children,
      ),
    );
  }
}

/// User has the option to extend this class or use the mixin (see below)
class CenterColumnBoxController
    with CenterFieldsBoxMixin, ColumnFieldsBoxMixin, InheritedWidgetBoxMixin {
  CenterColumnBoxController({
    double? widthFactor,
    double? heightFactor,
    MainAxisAlignment? mainAxisAlignment,
    MainAxisSize? mainAxisSize,
    CrossAxisAlignment? crossAxisAlignment,
    TextDirection? textDirection,
    VerticalDirection? verticalDirection,
    TextBaseline? textBaseline,
  }) {
    this.widthFactor = widthFactor;
    this.heightFactor = heightFactor;
    this.mainAxisAlignment = mainAxisAlignment;
    this.mainAxisSize = mainAxisSize;
    this.crossAxisAlignment = crossAxisAlignment;
    this.textDirection = textDirection;
    this.verticalDirection = verticalDirection;
    this.textBaseline = textBaseline;
  }
}
