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
  });
  //
  final Text? title;

  final Text? opt01;

  final Text? opt02;

  final String? groupValue;

  final ValueChanged<String>? onChanged;

  @override
  StateBox<String, RadioBox> createState() => _RadioBoxState();
}

class _RadioBoxState extends StateBox<String, RadioBox> {
  // Create the radio buttons
  @override
  void initState() {
    super.initState();

    if (con is RadioFieldsBoxMixin<String>) {
      box = con as RadioFieldsBoxMixin<String>?;
    }

    final opt01 = box?.opt01 ?? widget.opt01;
    final opt02 = box?.opt02 ?? widget.opt02;

    // Stop everything if either is not provided.
    if (opt01 != null && opt02 != null) {
      // If there's a default selection
      initValue = widget.groupValue;
      options = buildOptions();
      con.boxValue ??= box?.groupValue ?? w.groupValue;
      box?.groupValue = con.boxValue;
    }
  }

  late Widget? options;
  late String? initValue;

  RadioFieldsBoxMixin<String>? box;

  @override
  void didUpdateWidget(covariant RadioBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (con is RadioFieldsBoxMixin<String>) {
      box = con as RadioFieldsBoxMixin<String>?;
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
                //
                setState(() {
                  con.boxValue = v!;
                });

                box?.onChanged?.call(v!);

                if (w.onChanged != null) {
                  w.onChanged!(v!);
                }
              }),
          InkWell(
            onTap: () {
              //
              final v = labels[i];

              setState(() {
                con.boxValue = v!;
              });

              box?.onTap?.call();

              box?.onChanged?.call(v!);

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
      mainAxisSize: box?.mainAxisSize ?? MainAxisSize.max,
      mainAxisAlignment: box?.mainAxisAlignment ?? MainAxisAlignment.start,
      crossAxisAlignment: box?.crossAxisAlignment ?? CrossAxisAlignment.center,
      textDirection: box?.textDirection,
      verticalDirection: box?.verticalDirection ?? VerticalDirection.down,
      textBaseline: box?.textBaseline,
      children: [
        box?.title ?? w.title ?? const Text(''),
        Row(children: radioRow)
      ],
    );
  }
}

/// User has the option to extend this class or use the mixin (see below)
class RadioBoxController<T> with RadioFieldsBoxMixin<T> {
  RadioBoxController({
    Text? title,
    Text? opt01,
    Text? opt02,
    T? groupValue,
    ValueChanged<String>? onChanged,
    VoidCallback? onTap,
    MainAxisAlignment? mainAxisAlignment,
    MainAxisSize? mainAxisSize,
    CrossAxisAlignment? crossAxisAlignment,
    TextDirection? textDirection,
    VerticalDirection? verticalDirection,
    TextBaseline? textBaseline,
  }) {
    this.title = title;
    this.opt01 = opt01;
    this.opt02 = opt02;
    this.groupValue = groupValue;
    this.onChanged = onChanged;
    this.onTap = onTap;
    this.mainAxisAlignment = mainAxisAlignment;
    this.mainAxisSize = mainAxisSize;
    this.crossAxisAlignment = crossAxisAlignment;
    this.textDirection = textDirection;
    this.verticalDirection = verticalDirection;
    this.textBaseline = textBaseline;
  }
}

/// Supply the functions and properties of its implemented mixin.
mixin RadioFieldsBoxMixin<T> implements ControllerBoxMixin<T> {
  //
  @override
  StateBox<T, StatefulWidgetBox<T>>? boxState;

  @override
  T? boxValue;

  Text? title;
  Text? opt01;
  Text? opt02;
  T? groupValue;
  ValueChanged<String>? onChanged;
  VoidCallback? onTap;
  MainAxisAlignment? mainAxisAlignment;
  MainAxisSize? mainAxisSize;
  CrossAxisAlignment? crossAxisAlignment;
  TextDirection? textDirection;
  VerticalDirection? verticalDirection;
  TextBaseline? textBaseline;
}
