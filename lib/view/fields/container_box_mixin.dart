library boxes;

//
// Copyright 2023 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//

import 'package:flutter/material.dart'
    show
        AlignmentGeometry,
        BoxConstraints,
        Clip,
        Color,
        Decoration,
        EdgeInsetsGeometry,
        Key,
        Matrix4,
        Widget;

mixin ContainerFieldsBoxMixin {
  Key? key;
  AlignmentGeometry? alignment;
  EdgeInsetsGeometry? padding;
  Color? color;
  Decoration? decoration;
  Decoration? foregroundDecoration;
  double? width;
  double? height;
  BoxConstraints? constraints;
  EdgeInsetsGeometry? margin;
  Matrix4? transform;
  AlignmentGeometry? transformAlignment;
  Widget? child;
  Clip? clipBehavior;
}
