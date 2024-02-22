library boxes;

//
// Copyright 2023 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//

import 'package:boxes/boxes_view.dart'
    show
        ContainerFieldsBoxMixin,
        InheritedWidgetBoxMixin,
        RowFieldsBoxMixin,
        makeInheritedWidgetBox;

import 'package:flutter/material.dart'
    show
        BuildContext,
        Clip,
        Container,
        CrossAxisAlignment,
        MainAxisAlignment,
        MainAxisSize,
        Row,
        StatelessWidget,
        VerticalDirection,
        Widget;

export 'package:boxes/controller/InheritedWidget_box_mixin.dart';

///
class ContainerRowBox extends StatelessWidget {
  ///
  ContainerRowBox({
    super.key,
    ContainerFieldsBoxMixin? controller,
    required List<Widget> children,
  }) : widget = makeInheritedWidgetBox(
          keyId: key,
          controller: controller,
          child: _ContainerRowBox(
            controller: controller,
            children: children,
          ),
        );

  final Widget widget;

  @override
  Widget build(BuildContext context) => widget;
}

class _ContainerRowBox extends StatelessWidget {
  ///
  _ContainerRowBox({
    // ignore: unused_element
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

/// Used if a controller is not explicitly provided to the Box widget above.
class _ContainerRowBoxController
    with ContainerFieldsBoxMixin, RowFieldsBoxMixin, InheritedWidgetBoxMixin {}
