//
// Copyright 2023 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//

import '../_example_imports.dart';

import 'package:boxes/boxes.dart';

class AppBarController with AppBarFieldsBoxMixin, InheritedWidgetBoxMixin {
  factory AppBarController({Widget? title}) {
    // Supply a new title any time
    if (title != null) {
      _title = title;
    }
    return _this ??= AppBarController._();
  }
  static AppBarController? _this;
  AppBarController._() {
    //
    _propertyText = TextDescription();
  }
  late TextDescription _propertyText;

  @override
  get title {
    /// You can programmatically conceive the title anytime you want
    /// or you simply pass along the parameter value for now.
    /// You're in control.
    return _title;
  }

  @override
  set title(Widget? title) {
    if (title == null) {
      _title = _prevTitle; // Returns to the previous value;
    } else {
      _prevTitle ??= _title;
      _title = title;
    }
  }

  static Widget? _title;
  Widget? _prevTitle;

  @override
  get bottomOpacity => _bottomOpacity;
  @override
  set bottomOpacity(double? v) {
    if (v == null || v == 0) {
      _bottomOpacity = null;
      bottom = null;
    } else {
      _bottomOpacity = v;
      bottom = PreferredSize(
        preferredSize: const Size.fromHeight(4),
        child: Container(
          color: Colors.orange,
          height: 16,
        ),
      );
    }
  }

  double? _bottomOpacity;

  @override
  get elevation => _elevation;
  @override
  set elevation(double? v) {
    if (v == null || v <= 4) {
      _elevation = null;
      shadowColor = null;
    } else {
      _elevation = v;
      shadowColor = Colors.blueGrey;
    }
  }

  double? _elevation;

  /// Note you're given access to the AppBar's BuildContext object, context.
  @override
  get backgroundColor {
    if (!_setColor) {
      _backgroundColor = Theme.of(context).colorScheme.inversePrimary;
      _prevBackgroundColor = _backgroundColor;
    }
    return _backgroundColor;
  }

  @override
  set backgroundColor(Color? color) {
    if (color == null) {
      _backgroundColor = _prevBackgroundColor;
    } else {
      _prevBackgroundColor = _backgroundColor;
      _backgroundColor = color;
    }
    _setColor = true;
  }

  Color? _prevBackgroundColor;
  Color? _backgroundColor;
  bool _setColor = false;

  bool onCount(int? count) {
    // Always test parameters
    if (count == null) return false;

    if (count > 50) return false;

    // if (count > 36) {
    //   _propertyText.description = "";
    //   iconTheme = null;
    //   actions = null;
    //   notifyBoxes();
    //   return true;
    // }
    //
    // ///
    // if (count > 35) {
    //   _propertyText.description = "AppBar's iconTheme";
    //   iconTheme = AppBarTheme.of(context).iconTheme?.copyWith(
    //         size: 26,
    //         weight: 600,
    //         color: Colors.pink,
    //       );
    //   actions = [
    //     const Padding(
    //       padding: EdgeInsets.only(right: 20),
    //       child: Icon(
    //         Icons.search,
    //       ),
    //     ),
    //     const Padding(
    //       padding: EdgeInsets.only(right: 20),
    //       child: Icon(
    //         Icons.linear_scale_outlined,
    //       ),
    //     ),
    //   ];
    //   notifyBoxes();
    //   return true;
    // }

    if (count > 34) {
      _propertyText.description = "";
      foregroundColor = null;
      notifyBoxes();
      return true;
    }

    if (count > 33) {
      _propertyText.description = "AppBar's foregroundColor";
      foregroundColor = Colors.pink;
      notifyBoxes();
      return true;
    }

    if (count > 32) {
      _propertyText.description = "";
      backgroundColor = null;
      notifyBoxes();
      return true;
    }

    if (count > 31) {
      _propertyText.description = "AppBar's backgroundColor";
      backgroundColor = Colors.greenAccent;
      notifyBoxes();
      return true;
    }

    if (count > 30) {
      _propertyText.description = "";
      shape = null;
      notifyBoxes();
      return true;
    }

    if (count > 29) {
      _propertyText.description = "AppBar's shape property";
      shape = const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      );
      notifyBoxes();
      return true;
    }

    if (count > 28) {
      _propertyText.description = "";
      elevation = null;
      // shadowColor = null;
      notifyBoxes();
      return true;
    }

    if (count > 27) {
      _propertyText.description = "AppBar's shadowColor & elevation";
      elevation = 16;
      // shadowColor = Colors.blueGrey;
      notifyBoxes();
      return true;
    }

    if (count > 26) {
      _propertyText.description = "";
      bottom = null;
      notifyBoxes();
      return true;
    }

    if (count > 25) {
      _propertyText.description = "AppBar's bottom property";
      bottom = PreferredSize(
        preferredSize: const Size.fromHeight(4),
        child: Container(
          color: Colors.greenAccent,
          height: 16,
        ),
      );
      notifyBoxes();
      return true;
    }

    ///
    if (count > 24) {
      _propertyText.description = "";
      flexibleSpace = null;
      notifyBoxes();
      return true;
    }

    ///
    if (count > 23) {
      _propertyText.description = "AppBar's flexibleSpace";
      flexibleSpace = const Center(
        child: Text(
          'This is behind the Title',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
      notifyBoxes();
      return true;
    }

    if (count > 22) {
      primary = true;
      _propertyText.description = "AppBar is primary";
      notifyBoxes();
      return true;
    }

    if (count > 21) {
      primary = false;
      _propertyText.description = "AppBar is not primary";
      titleTextStyle = null;
      notifyBoxes();
      return true;
    }

    if (count > 20) {
      _propertyText.description = "";
      titleTextStyle = null;
      notifyBoxes();
      return true;
    }

    if (count > 19) {
      _propertyText.description = "AppBar's font";
      titleTextStyle = const TextStyle(
        color: Colors.black,
        fontFamily: 'Courier New',
        fontSize: 24,
        fontWeight: FontWeight.bold,
      );
      notifyBoxes();
      return true;
    }

    ///
    if (count > 18) {
      _propertyText.description = "";
      actions = null;
      notifyBoxes();
      return true;
    }

    ///
    if (count > 17) {
      _propertyText.description = "AppBar's added actions";
      actions = [
        const Padding(
          padding: EdgeInsets.only(right: 20),
          child: Icon(
            Icons.search,
            size: 26,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 20),
          child: Icon(
            Icons.linear_scale_outlined,
            size: 26,
          ),
        ),
      ];
      notifyBoxes();
      return true;
    }

    ///
    if (count > 16) {
      title = null;
      _propertyText.description = "";
      notifyBoxes();
      return true;
    }

    if (count > 15) {
      title = const Text("Isn't this amazing?");
      _propertyText.description = "Isn't this amazing?";
      notifyBoxes();
      return true;
    }

    ///
    if (count > 14) {
      leading = null;
      _propertyText.description = "";
      notifyBoxes();
      return true;
    }

    ///
    if (count > 13) {
      leading = const Icon(Icons.insert_emoticon);
      _propertyText.description = "AppBar leading icon";
      notifyBoxes();
      return true;
    }

    return false;
  }
}
