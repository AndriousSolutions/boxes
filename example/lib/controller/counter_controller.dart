//
// Copyright 2023 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//

import '../_example_imports.dart';

import 'package:boxes/boxes.dart';

/// Performs the 'business side' of the app.
///
class BusinessEnd with TextFieldsBoxMixin, InheritedWidgetBoxMixin {
  factory BusinessEnd() => _this ??= BusinessEnd._();
  static BusinessEnd? _this;
  BusinessEnd._() {
    _propertyText = TextDescription();
  }
  late TextDescription _propertyText;

  Widget get description => _propertyText.textWidget;

  /// The Text widget 'data' property
  @override
  get data => _data ?? '$_counter';
  String? _data;

  int _counter = 0;

  void onPressed() {
    _counter++;
    notifyBoxes();
    MaterialAppController().onCount(_counter);
  }

  @override
  get style => Theme.of(context).textTheme.headlineMedium;

  bool onCount(int? count) {
    // Always test parameters
    if (count == null) return false;

    if (count > 60) return false;

    ///
    if (count > 56) {
      _propertyText.description = "";
      _data = null;
      notifyBoxes();
      return true;
    }

    ///
    if (count > 55) {
      _propertyText.description = "Text Widget's itself!";
      _data = "Isn't this cool?";
      notifyBoxes();
      return true;
    }

    return false;
  }
}
