library boxes;

//
// Copyright 2023 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//

import 'package:flutter/material.dart'
    show
        CrossAxisAlignment,
        Key,
        MainAxisAlignment,
        MainAxisSize,
        Text,
        TextBaseline,
        TextDirection,
        ValueChanged,
        VerticalDirection;

mixin RadioFieldsBoxMixin {
  Key? key;
  Text? title;
  Text? opt01;
  Text? opt02;
  String? groupValue;
  ValueChanged<String>? onChanged;
  MainAxisAlignment? mainAxisAlignment;
  MainAxisSize? mainAxisSize;
  CrossAxisAlignment? crossAxisAlignment;
  TextDirection? textDirection;
  VerticalDirection? verticalDirection;
  TextBaseline? textBaseline;
}
