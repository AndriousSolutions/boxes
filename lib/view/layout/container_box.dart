library boxes;

//
// Copyright 2023 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//

import 'package:boxes/boxes_view.dart'
    show
        InheritedWidgetBoxMixin,
        ContainerFieldsBoxMixin,
        makeInheritedWidgetBox;

import 'package:flutter/material.dart';

/// Likely needed by subclasses
export 'package:boxes/controller/controller_box.dart';

///
class ContainerBox extends StatelessWidget {
  ContainerBox({
    super.key,
    ContainerFieldsBoxMixin? controller,
    Widget? child,
  }) : widget = makeInheritedWidgetBox(
          keyId: key,
          controller: controller,
          child: _ContainerBox(
            controller: controller,
            child: child,
          ),
        );
  final Widget widget;

  @override
  Widget build(BuildContext context) => widget;
}

///
class _ContainerBox extends StatelessWidget {
  _ContainerBox({
    // ignore: unused_element
    super.key,
    ContainerFieldsBoxMixin? controller,
    this.child,
  }) : controller = controller ?? ContainerBoxController();

  final Widget? child;
  final ContainerFieldsBoxMixin controller;

  @override
  Widget build(BuildContext context) {
    //
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
      child: controller.child ?? child,
    );
  }
}

/// User has the option to extend this class or use the specified mixin
class ContainerBoxController
    with ContainerFieldsBoxMixin, InheritedWidgetBoxMixin {
  ///
  ContainerBoxController({
    Key? key,
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    Color? color,
    Decoration? decoration,
    Decoration? foregroundDecoration,
    double? width,
    double? height,
    BoxConstraints? constraints,
    EdgeInsetsGeometry? margin,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
    Widget? child,
    Clip? clipBehavior,
  }) {
    this.key = key;
    this.alignment = alignment;
    this.padding = padding;
    this.color = color;
    this.decoration = decoration;
    this.foregroundDecoration = foregroundDecoration;
    this.width = width;
    this.height = height;
    this.constraints = constraints;
    this.margin = margin;
    this.transform = transform;
    this.transformAlignment = transformAlignment;
    this.clipBehavior = clipBehavior;
    this.child = child;
  }
}
