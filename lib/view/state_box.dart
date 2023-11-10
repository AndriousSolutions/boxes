library boxes;

//
// Copyright 2023 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//
import 'package:boxes/controller/controller_box.dart';

import 'package:flutter/material.dart';

abstract class StatefulWidgetBox<T> extends StatefulWidget {
  StatefulWidgetBox({
    super.key,
    ControllerBoxMixin<T>? controller,
  }) : con = controller ?? ControllerBox<T>();

  final ControllerBoxMixin<T> con;

  // ignore: INVALID_USE_OF_PROTECTED_MEMBER
  void refresh() => con.boxState?.setState(() {});

  T? get selectedValue => con.boxValue;

  StateBox<T, StatefulWidgetBox<T>>? get state => con.boxState;

  @override
  State createState();
}

abstract class StateBox<T, U extends StatefulWidgetBox<T>> extends State<U> {
  @override
  void initState() {
    super.initState();
    w = widget;
    con = w.con;
    con.boxState = this;
  }

  late U w;
  late ControllerBoxMixin<T> con;

  @override
  void didUpdateWidget(covariant U oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Important to prevent memory leaks
    con.boxState = null;
    final value = con.boxValue; // Important to retain the current value
    con.boxValue = null;
    // There's a new widget with possibly a new controller
    w = widget;
    con = w.con;
    con.boxState = this;
    con.boxValue = value;
  }

  @override
  void dispose() {
    super.dispose();
    con.boxState = null;
  }
}
