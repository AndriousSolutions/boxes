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
class TextBox extends StatelessWidget {
  ///
  TextBox({
    super.key,
    TextFieldsBoxMixin? controller,
  }) : widget = makeInheritedWidgetBox(
          keyId: key,
          controller: controller,
          child: _TextBox(controller: controller),
        );

  TextBox.rich({
    super.key,
    TextFieldsBoxMixin? controller,
  }) : widget = makeInheritedWidgetBox(
          keyId: key,
          controller: controller,
          child: _TextBox(controller: controller),
        );

  final Widget widget;

  @override
  Widget build(BuildContext context) => widget;
}

///
class _TextBox extends StatelessWidget {
  ///
  _TextBox({
    super.key,
    TextFieldsBoxMixin? controller,
  }) : controller = controller ?? _TextBoxController();

  final TextFieldsBoxMixin controller;

  @override
  Widget build(BuildContext context) {
    //
    controller.context = context;

    if (controller is InheritedWidgetBoxMixin) {
      (controller as InheritedWidgetBoxMixin).dependOnInheritedWidget(context);
    }
    Text text;

    // data takes precedence even if textSpan != null
    if (controller.textSpan == null || controller.data != null) {
      text = Text(
        controller.data ?? '',
        key: controller.key,
        style: controller.style,
        strutStyle: controller.strutStyle,
        textAlign: controller.textAlign,
        textDirection: controller.textDirection,
        locale: controller.locale,
        softWrap: controller.softWrap,
        overflow: controller.overflow,
        textScaleFactor: controller.textScaleFactor,
        maxLines: controller.maxLines,
        semanticsLabel: controller.semanticsLabel,
        textWidthBasis: controller.textWidthBasis,
        textHeightBehavior: controller.textHeightBehavior,
        selectionColor: controller.selectionColor,
      );
    } else {
      text = Text.rich(
        controller.textSpan!,
        key: controller.key,
        style: controller.style,
        strutStyle: controller.strutStyle,
        textAlign: controller.textAlign,
        textDirection: controller.textDirection,
        locale: controller.locale,
        softWrap: controller.softWrap,
        overflow: controller.overflow,
        textScaleFactor: controller.textScaleFactor,
        maxLines: controller.maxLines,
        semanticsLabel: controller.semanticsLabel,
        textWidthBasis: controller.textWidthBasis,
        textHeightBehavior: controller.textHeightBehavior,
        selectionColor: controller.selectionColor,
      );
    }
    return text;
  }
}

class _TextBoxController with TextFieldsBoxMixin, InheritedWidgetBoxMixin {}
