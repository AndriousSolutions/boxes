library boxes;

//
// Copyright 2023 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//

import 'package:flutter/material.dart'
    show
        BuildContext,
        InheritedElement,
        InheritedWidget,
        Key,
        ObjectKey,
        State,
        StatefulWidget,
        Widget;

import 'package:boxes/controller/InheritedWidget_box_mixin.dart'
    show InheritedWidgetBoxMixin;

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
  State<StatefulWidget> createState() => InheritedBoxWidgetState();
}

class InheritedBoxWidgetState extends State<InheritedBoxWidget> {
  //
  // Set when this InheritedWidget's dependencies are to be notified.
  bool notified = false;

  @override
  void initState() {
    super.initState();
    _widget = widget;
    // controller collects this State object.
    _widget.controller.initInherited(this);
  }

  late InheritedBoxWidget _widget;

  @override
  void dispose() {
    _widget.controller.disposeInherited(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => InheritedWidgetBox(
        key: ObjectKey(this),
        controller: _widget.controller,
        child: _widget.child,
      );
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
      // The controller itself determines whether to update dependencies or not.
      update = controller.updateShouldNotify(oldWidget);
    }
    return update;
  }
}
