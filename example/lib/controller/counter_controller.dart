//
// Copyright 2023 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//

import '../_example_app_imports.dart';

import 'package:boxes/boxes.dart';

/// Performs the 'business side' of the app.
class BusinessEnd
    with TextFieldsBoxMixin, ImageFieldsBoxMixin, InheritedWidgetBoxMixin {
  /// There's only ever one instance of this class
  factory BusinessEnd() => _this ??= BusinessEnd._();
  static BusinessEnd? _this;
  BusinessEnd._() {
    _propertyText = TextDescription();
    _googleFonts = GoogleFonts.asMap().keys.toList(growable: false);
    _fontLength = _googleFonts.length;
    _random = Random();
    _timer = TimerController();
    _timer.onCallback = () {
      //
      if (_fontCount >= _fontLength) {
        _fontCount = 0;
      }

      /// Text widget
      _style =
          GoogleFonts.getFont(_googleFonts[_fontCount]).copyWith(fontSize: 72);

      _fontCount++;

      notifyBoxes();
    };
  }
  late TextDescription _propertyText;
  late List<String> _googleFonts;
  late int _fontLength;
  late Random _random;
  late TimerController _timer;

  void dispose() {
    _timer.dispose();
  }

  // The current Google Font List item
  int _fontCount = 0;

  Widget get picture => ImageBox.asset(name: name, controller: this);

  Widget get description => _propertyText.widget;

  /// The Text widget 'data' property
  @override
  get data => _data ?? '$_counter';
  String? _data;

  int _counter = 0;

  void onPressed() {
    //
    _timer.cancelTimer();

    _counter++;

    onCount(_counter);

    // As it happens, there's just one 'box'. The Text widget.
    // However, it could very easily be many many more.
    notifyBoxes();

    _timer.initTimer();
  }

  /// Text widget
  @override
  get style => _style ?? Theme.of(context).textTheme.headlineMedium;
  TextStyle? _style;

  /// Image widget
  @override
  get width => 5;

  @override
  get height => 10;

  // @override
  // get opacity => 1;

  /// Called with every press of the button.
  /// Calls other controllers that change the visual characteristics
  /// of their associated UI widget depending on the count value.
  bool onCount(int? count) {
    // Always test parameters
    if (count == null) return false;

    if (count > 55) {
      return false;
    }

    /// Manipulate the app's AppBar
    if (AppBarController().onCount(count)) {
      return true;
    }

    /// Manipulate the app's Scaffold widget
    if (ScaffoldController().onCount(count)) {
      return true;
    }

    /// Manipulate the app's MaterialApp widget
    if (MaterialAppController().onCount(count)) {
      return true;
    }

    ///
    if (count > 54) {
      _propertyText.description = "";
      _data = null;
      return true;
    }

    ///
    if (count > 53) {
      _propertyText.description = "Text Widget's itself!";
      _data = "Isn't this cool?";
      return true;
    }

    return false;
  }

  int _index = 0;

  /// Change the type font with each new count
  void typoCount(int? count) {
    //
    if (count == _index) {
      _index = -1;
      name = 'assets/images/neuman.jpg';
    } else if (count != null && count % 10 == 0) {
      _index = randomIndex(count, count + 10);
    }
  }

  /// Generate the next random number.
  int randomIndex(int min, int max) => min + _random.nextInt(max - min);
}
