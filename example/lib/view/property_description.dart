//
// Copyright 2023 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//

import '../_example_app_imports.dart';

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

  Widget get widget {
    _widget ??= Padding(
      padding: const EdgeInsets.all(30),
      child: TextBox(controller: _textBoxController),
    );
    return _widget!;
  }

  set widget(Widget? widget) {
    if (widget != null) {
      _widget = widget;
    }
  }

  Widget? _widget;

  String get description => _textBoxController.data!;
  set description(String? text) {
    if (text != null) {
      _textBoxController.data = text.trim();
      _textBoxController.notifyBoxes();
    }
  }
}

class _TextBoxController
    with ImageFieldsBoxMixin, TextFieldsBoxMixin, InheritedWidgetBoxMixin {
  @override
  get style => TextStyle(
        color: Colors.red,
        fontSize: Theme.of(context).textTheme.headlineMedium?.fontSize,
      );
}
