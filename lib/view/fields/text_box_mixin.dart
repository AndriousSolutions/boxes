library boxes;

//
// Copyright 2023 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//

import 'package:flutter/material.dart'
    show
        BuildContext,
        Color,
        InlineSpan,
        Key,
        Locale,
        StrutStyle,
        TextAlign,
        TextDirection,
        TextHeightBehavior,
        TextOverflow,
        TextScaler,
        TextStyle,
        TextWidthBasis;

mixin TextFieldsBoxMixin {
  late BuildContext context;
  Key? key;
  String? data;
  InlineSpan? textSpan;
  TextStyle? style;
  StrutStyle? strutStyle;
  TextAlign? textAlign;
  TextDirection? textDirection;
  Locale? locale;
  bool? softWrap;
  TextOverflow? overflow;
  @Deprecated('Deprecated. Use textScaler instead')
  double? textScaleFactor;
  TextScaler? textScaler;
  int? maxLines;
  String? semanticsLabel;
  TextWidthBasis? textWidthBasis;
  TextHeightBehavior? textHeightBehavior;
  Color? selectionColor;
}
