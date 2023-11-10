library boxes;

//
// Copyright 2023 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//
import 'package:boxes/controller/controller_box.dart';
import 'package:boxes/view/state_box.dart';

import 'package:flutter/material.dart';

/// Likely needed by subclasses
export 'package:boxes/controller/controller_box.dart';

class RadioBox extends StatefulWidgetBox<String> {
  //
  RadioBox({
    super.key,
    super.controller,
    this.title,
    this.opt01,
    this.opt02,
    this.groupValue,
    this.onChanged,
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.crossAxisAlignment,
    this.textDirection,
    this.verticalDirection,
    this.textBaseline,
  });
  //
  final Text? title;

  final Text? opt01;

  final Text? opt02;

  final String? groupValue;

  final ValueChanged<String>? onChanged;

  /// How the children should be placed along the main axis.
  final MainAxisAlignment? mainAxisAlignment;

  /// How much space should be occupiedin the main axis.
  final MainAxisSize? mainAxisSize;

  /// How the children should be placed along the cross axis.
  final CrossAxisAlignment? crossAxisAlignment;

  /// Determines the order to lay children out horizontally and how to interpret
  /// `start` and `end` in the horizontal direction.
  final TextDirection? textDirection;

  /// Determines the order to lay children out vertically and how to interpret
  /// `start` and `end` in the vertical direction.
  final VerticalDirection? verticalDirection;

  /// If aligning items according to their baseline, which baseline to use.
  final TextBaseline? textBaseline;

  @override
  StateBox<String, RadioBox> createState() => _RadioBoxState();
}

class _RadioBoxState extends StateBox<String, RadioBox> {
  // Create the radio buttons
  @override
  void initState() {
    super.initState();

    if (con is RadioBoxMixin<String>) {
      box = con as RadioBoxMixin<String>?;
    }

    final opt01 = box?.opt01 ?? widget.opt01;
    final opt02 = box?.opt02 ?? widget.opt02;

    // Stop everything if either is not provided.
    if (opt01 != null && opt02 != null) {
      // If there's a default selection
      initValue = widget.groupValue;
      options = buildOptions();
      con.boxValue = box?.groupValue ?? w.groupValue;
    }
  }

  late Widget? options;
  late String? initValue;

  RadioBoxMixin<String>? box;

  @override
  void didUpdateWidget(covariant RadioBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (con is RadioBoxMixin<String>) {
      box = con as RadioBoxMixin<String>?;
    } else {
      box = null;
    }
  }

  @override
  void dispose() {
    box = null;
    super.dispose();
  }

  /// If null, always null
  @override
  Widget build(BuildContext context) =>
      options == null ? const SizedBox() : buildOptions();

  // Create the options
  Widget buildOptions() {
    //
    final radioRow = <Widget>[];

    final texts = <Text>[box?.opt01 ?? w.opt01!, box?.opt02 ?? w.opt02!];
    final labels = <String?>[
      box?.opt01?.data ?? w.opt01!.data,
      box?.opt02?.data ?? w.opt02!.data
    ];

    // Supply a default value if any
    if (initValue != null && labels.contains(initValue)) {
      con.boxValue = initValue;
      initValue = null;
    }

    //
    for (int i = 0; i <= texts.length - 1; i++) {
      //
      final row = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Radio<String>(
              value: labels[i] ?? '',
              groupValue: con.boxValue,
              onChanged: (v) {
                setState(() {
                  con.boxValue = v!;
                });
                if (box?.onChanged != null) {
                  box!.onChanged(v!);
                }
                if (w.onChanged != null) {
                  w.onChanged!(v!);
                }
              }),
          InkWell(
            onTap: () {
              final v = labels[i];
              setState(() {
                con.boxValue = v!;
              });
              if (box?.onTap != null) {
                box!.onTap();
              }
              if (box?.onChanged != null) {
                box!.onChanged(v!);
              }
              if (w.onChanged != null) {
                w.onChanged!(v!);
              }
            },
            child: texts[i],
          ),
        ],
      );
      radioRow.add(row);
    }

    return Row(
      mainAxisSize: box?.mainAxisSize ?? w.mainAxisSize ?? MainAxisSize.max,
      mainAxisAlignment: box?.mainAxisAlignment ??
          w.mainAxisAlignment ??
          MainAxisAlignment.start,
      crossAxisAlignment: box?.crossAxisAlignment ??
          w.crossAxisAlignment ??
          CrossAxisAlignment.center,
      textDirection: box?.textDirection ?? w.textDirection,
      verticalDirection: box?.verticalDirection ??
          w.verticalDirection ??
          VerticalDirection.down,
      textBaseline: box?.textBaseline ?? w.textBaseline,
      children: [
        box?.title ?? w.title ?? const Text(''),
        Row(children: radioRow)
      ],
    );
  }
}

/// User has the option to extend a class or use a mixin (see below)
class RadioBoxController<T> with RadioBoxMixin<T> {}

/// Supply the functions and properties of its implemented mixin.
mixin RadioBoxMixin<T> implements ControllerBoxMixin<T> {
  //
  @override
  StateBox<T, StatefulWidgetBox<T>>? boxState;

  @override
  T? boxValue;

  /// Signature for callbacks that report that an underlying value has changed.
  @override
  void onChanged(T? value) {}

  /// Called when the dropdown button is tapped.
  @override
  void onTap() {}

  Text? title;
  Text? opt01;
  Text? opt02;
  T? groupValue;
  MainAxisAlignment? mainAxisAlignment;
  MainAxisSize? mainAxisSize;
  CrossAxisAlignment? crossAxisAlignment;
  TextDirection? textDirection;
  VerticalDirection? verticalDirection;
  TextBaseline? textBaseline;
}
