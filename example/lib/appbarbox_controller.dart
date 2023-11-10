//
// Copyright 2023 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//

import '_example_imports.dart';

import 'package:boxes/boxes.dart';

class AppBarController with AppBarFieldsBoxMixin, InheritedWidgetBoxMixin {
  factory AppBarController({Widget? title}) =>
      _this ??= AppBarController._(title);
  static AppBarController? _this;
  AppBarController._(Widget? title) {
    _title = title;
  }

  @override
  get automaticallyImplyLeading => null;

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
      _title = _prevTitle;
    } else {
      _prevTitle = _title;
      _title = title;
    }
  }

  static Widget? _title;
  Widget? _prevTitle;

  @override
  get actions => null;

  @override
  get flexibleSpace => null;

  @override
  get bottom => null;

  @override
  get elevation => null;

  @override
  get scrolledUnderElevation => null;

  @override
  get notificationPredicate => null;

  @override
  get shadowColor => null;

  @override
  get surfaceTintColor => null;

  @override
  get shape => null;

  /// Note you're given access to the AppBar's BuildContext object, context.
  @override
  get backgroundColor {
    if (!_setColor) {
      _backgroundColor = Theme.of(context).colorScheme.inversePrimary;
    }
    return _backgroundColor;
  }

  @override
  set backgroundColor(Color? color) {
    _backgroundColor = color;
    _setColor = true;
  }

  Color? _backgroundColor;
  bool _setColor = false;

  @override
  get foregroundColor => null;

  @override
  get iconTheme => null;

  @override
  get actionsIconTheme => null;

  @override
  get primary => null;

  @override
  get centerTitle => null;

  @override
  get excludeHeaderSemantics => null;

  @override
  get titleSpacing => null;

  @override
  get toolbarOpacity => null;

  @override
  get bottomOpacity => null;

  @override
  get preferredSize => null;

  @override
  get toolbarHeight => null;

  @override
  get leadingWidth => null;

  @override
  get toolbarTextStyle => null;

  @override
  get titleTextStyle => null;

  @override
  get systemOverlayStyle => null;

  @override
  get forceMaterialTransparency => null;

  @override
  get clipBehavior => null;

  bool onCount(int? count) {
    // Always test parameters
    if (count == null) return false;

    ///
    if (count > 13) {
      leading = null;
      notifyClients();
      return true;
    }

    ///
    if (count > 12) {
      leading = const Icon(Icons.insert_emoticon);
      notifyClients();
      return true;
    }

    ///
    if (count > 11) {
      title = null;
      notifyClients();
      return true;
    }

    if (count > 10) {
      title = const Text("Isn't this amazing?");
      notifyClients();
      return true;
    }

    if (count > 9) {
      primary = true;
      notifyClients();
      return true;
    }

    if (count > 8) {
      primary = false;
      notifyClients();
      return true;
    }

    if (count > 6) {
      backgroundColor = null;
      notifyClients();
      return true;
    }

    return false;
  }
}
