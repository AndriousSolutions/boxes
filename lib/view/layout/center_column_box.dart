library boxes;

//
// Copyright 2023 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//

import 'package:boxes/view/_view_export_file.dart';

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
    super.key,
    ColumnFieldsBoxMixin? controller,
    required this.children,
  }) : controller = controller ?? _CenterColumnBoxController();

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

class _CenterColumnBoxController
    with CenterFieldsBoxMixin, ColumnFieldsBoxMixin, InheritedWidgetBoxMixin {}
