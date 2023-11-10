library boxes;

//
// Copyright 2023 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//

import 'package:flutter/material.dart';

import 'package:boxes/controller/InheritedWidget_box_mixin.dart';

///
class InheritedBoxWidget extends StatefulWidget {
  ///
  const InheritedBoxWidget({
    super.key,
    this.keyId,
    required this.controller,
    required this.child,
  });
  final Key? keyId;
  final InheritedWidgetBoxMixin controller;
  final Widget child;

  @override
  State<StatefulWidget> createState() => _InheritedBoxWidgetState();
}

class _InheritedBoxWidgetState extends State<InheritedBoxWidget> {
  //
  @override
  void initState() {
    super.initState();
    // controller collects this State object.
    widget.controller.initState(this);
  }

  @override
  void dispose() {
    widget.controller.dispose(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final widget = this.widget;
    return InheritedWidgetBox(
      key: ObjectKey(this),
      controller: widget.controller,
      child: widget.child,
    );
  }
}

/// The InheritedWidget potentially assigned to any box widget
class InheritedWidgetBox extends InheritedWidget {
  const InheritedWidgetBox({
    super.key,
    required this.controller,
    required super.child,
  });

  final InheritedWidgetBoxMixin controller;

  @override
  InheritedElement createElement() {
    final element = super.createElement();
    controller.createElement(element);
    return element;
  }

  @override
  bool updateShouldNotify(InheritedWidgetBox oldWidget) {
    var update = controller == oldWidget.controller;
    if (update) {
      update = controller.updateShouldNotify(oldWidget);
    }
    return update;
  }
}
