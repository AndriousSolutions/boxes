//
// Copyright 2023 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//

import '../_example_imports.dart';

import 'package:boxes/boxes.dart';

class TextDescription {
  factory TextDescription() => _this ??= TextDescription._();
  static TextDescription? _this;
  TextDescription._() {
    //
    _textBoxController = _TextBoxController();

    _textBoxController.data = '';
  }
  late _TextBoxController _textBoxController;
  late TextTheme textTheme;

  Widget get textWidget => Padding(
        padding: const EdgeInsets.all(30),
        child: TextBox(controller: _textBoxController),
      );

  String get description => _textBoxController.data!;
  set description(String? text) {
    if (text != null) {
      _textBoxController.data = text.trim();
      _textBoxController.notifyBoxes();
    }
  }
}

class _TextBoxController with TextFieldsBoxMixin, InheritedWidgetBoxMixin {
  @override
  get style => TextStyle(
        color: Colors.red,
        fontSize: Theme.of(context).textTheme.headlineMedium?.fontSize,
      );
}
