library boxes;

//
// Copyright 2023 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//

import 'dart:ui' as ui show TextHeightBehavior;
import 'package:flutter/material.dart';

export 'dart:ui' show TextHeightBehavior;

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
  double? textScaleFactor;
  int? maxLines;
  String? semanticsLabel;
  TextWidthBasis? textWidthBasis;
  ui.TextHeightBehavior? textHeightBehavior;
  Color? selectionColor;
}
