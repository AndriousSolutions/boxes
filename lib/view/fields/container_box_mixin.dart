library boxes;

//
// Copyright 2023 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//

import 'package:flutter/material.dart';

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
  Clip? clipBehavior;
}
