//
// Copyright 2023 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//

import '../_example_imports.dart';

import 'package:boxes/boxes.dart';

/// Unlike the other controllers, this uses a factory constructor.
/// The other controllers are re-instantiated (recreated) at times.
/// This class is only created once and used again and again.
class CenterColumnController
    with ColumnFieldsBoxMixin, InheritedWidgetBoxMixin {
  factory CenterColumnController() => _this ??= CenterColumnController._();
  static CenterColumnController? _this;
  CenterColumnController._();

  @override
  get mainAxisAlignment => MainAxisAlignment.center;
}
