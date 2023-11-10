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
class ContainerRow extends StatelessWidget {
  ///
  ContainerRow({
    super.key,
    ContainerFieldsBoxMixin? controller,
    required List<Widget> children,
  }) : widget = makeInheritedWidgetBox(
          keyId: key,
          controller: controller,
          child: _ContainerRow(
            controller: controller,
            children: children,
          ),
        );

  final Widget widget;

  @override
  Widget build(BuildContext context) => widget;
}

class _ContainerRow extends StatelessWidget {
  ///
  _ContainerRow({
    super.key,
    ContainerFieldsBoxMixin? controller,
    required this.children,
  }) : controller = controller ?? _ContainerRowBoxController();

  final ContainerFieldsBoxMixin controller;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    //
    RowFieldsBoxMixin? row;

    if (controller is RowFieldsBoxMixin) {
      row = controller as RowFieldsBoxMixin;
    }

    if (controller is InheritedWidgetBoxMixin) {
      (controller as InheritedWidgetBoxMixin).dependOnInheritedWidget(context);
    }
    return Container(
      key: controller.key,
      alignment: controller.alignment,
      padding: controller.padding,
      color: controller.color,
      decoration: controller.decoration,
      foregroundDecoration: controller.foregroundDecoration,
      width: controller.width,
      height: controller.height,
      constraints: controller.constraints,
      margin: controller.margin,
      transform: controller.transform,
      transformAlignment: controller.transformAlignment,
      clipBehavior: controller.clipBehavior ?? Clip.none,
      child: Row(
        mainAxisAlignment: row?.mainAxisAlignment ?? MainAxisAlignment.start,
        mainAxisSize: row?.mainAxisSize ?? MainAxisSize.max,
        crossAxisAlignment:
            row?.crossAxisAlignment ?? CrossAxisAlignment.center,
        textDirection: row?.textDirection,
        verticalDirection: row?.verticalDirection ?? VerticalDirection.down,
        textBaseline: row?.textBaseline,
        children: children,
      ),
    );
  }
}

class _ContainerRowBoxController
    with ContainerFieldsBoxMixin, RowFieldsBoxMixin, InheritedWidgetBoxMixin {}
