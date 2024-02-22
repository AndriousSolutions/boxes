library boxes;

//
// Copyright 2023 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//

import 'package:boxes/boxes_view.dart'
    show InheritedWidgetBoxMixin, TextFieldsBoxMixin, makeInheritedWidgetBox;

import 'package:flutter/material.dart';

export 'package:boxes/controller/InheritedWidget_box_mixin.dart';

///
class TextBox extends StatelessWidget {
  ///
  TextBox({
    super.key,
    String? data,
    TextFieldsBoxMixin? controller,
  }) : widget = makeInheritedWidgetBox(
          keyId: key,
          controller: controller,
          child: _TextBox(controller: controller, data: data),
        );

  TextBox.rich({
    super.key,
    InlineSpan? textSpan,
    TextFieldsBoxMixin? controller,
  }) : widget = makeInheritedWidgetBox(
          keyId: key,
          controller: controller,
          child: _TextBox(controller: controller, textSpan: textSpan),
        );

  final Widget widget;

  @override
  Widget build(BuildContext context) => widget;
}

///
class _TextBox extends StatelessWidget {
  ///
  _TextBox({
    // ignore: unused_element
    super.key,
    TextFieldsBoxMixin? controller,
    this.data,
    this.textSpan,
  }) : controller = controller ?? TextBoxController();

  final String? data;
  final InlineSpan? textSpan;
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
    if ((controller.textSpan == null && textSpan == null) ||
        controller.data != null ||
        data != null) {
      text = Text(
        controller.data ?? data ?? '',
        key: controller.key,
        style: controller.style,
        strutStyle: controller.strutStyle,
        textAlign: controller.textAlign,
        textDirection: controller.textDirection,
        locale: controller.locale,
        softWrap: controller.softWrap,
        overflow: controller.overflow,
        textScaler: controller.textScaler,
        maxLines: controller.maxLines,
        semanticsLabel: controller.semanticsLabel,
        textWidthBasis: controller.textWidthBasis,
        textHeightBehavior: controller.textHeightBehavior,
        selectionColor: controller.selectionColor,
      );
    } else {
      text = Text.rich(
        controller.textSpan ?? textSpan!,
        key: controller.key,
        style: controller.style,
        strutStyle: controller.strutStyle,
        textAlign: controller.textAlign,
        textDirection: controller.textDirection,
        locale: controller.locale,
        softWrap: controller.softWrap,
        overflow: controller.overflow,
        textScaler: controller.textScaler,
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

class TextBoxController with TextFieldsBoxMixin, InheritedWidgetBoxMixin {
  TextBoxController({
    Key? key,
    String? data,
    InlineSpan? textSpan,
    TextStyle? style,
    StrutStyle? strutStyle,
    TextAlign? textAlign,
    TextDirection? textDirection,
    Locale? locale,
    bool? softWrap,
    TextOverflow? overflow,
    @Deprecated('Deprecated. Use textScaler instead') double? textScaleFactor,
    TextScaler? textScaler,
    int? maxLines,
    String? semanticsLabel,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
    Color? selectionColor,
  }) {
    this.key = key;
    this.style = style;
    this.strutStyle = strutStyle;
    this.textAlign = textAlign;
    this.textDirection = textDirection;
    this.locale = locale;
    this.softWrap = softWrap;
    this.overflow = overflow;
    this.textScaler = textScaler;
    this.maxLines = maxLines;
    this.semanticsLabel = semanticsLabel;
    this.textWidthBasis = textWidthBasis;
    this.textHeightBehavior = textHeightBehavior;
    this.selectionColor = selectionColor;
  }
}
