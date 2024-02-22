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

class SliderBox extends StatefulWidgetBox<double> {
  SliderBox({
    super.key,
    super.controller,
    this.title,
    // this.textStyle,
    this.value,
    this.onChanged,
    // this.min,
    // this.max,
    // this.divisions,
    // this.round,
  });

  final String? title;
  // final TextStyle? textStyle;
  final double? value;
  final void Function(double v)? onChanged;
  // final double? min;
  // final double? max;
  // final int? divisions;
  // final bool? round;

  @override
  StateBox<double, SliderBox> createState() => _SlideBoxState();
}

class _SlideBoxState extends StateBox<double, SliderBox> {
  @override
  void initState() {
    super.initState();

    if (con is SliderFieldsBoxMixin) {
      box = con as SliderFieldsBoxMixin?;
    }
  }

  SliderFieldsBoxMixin? box;

  @override
  void didUpdateWidget(covariant SliderBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (con is SliderFieldsBoxMixin) {
      box = con as SliderFieldsBoxMixin?;
    } else {
      box = null;
    }
  }

  @override
  Widget build(BuildContext context) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(box?.title ?? w.title ?? '',
              style: box?.textStyle ??
                  const TextStyle(fontWeight: FontWeight.w400)),
        ),
        Slider(
          value: box?.round ?? false
              ? con.boxValue?.roundToDouble() ?? w.value!.roundToDouble()
              : con.boxValue ?? w.value!,
          min: box?.min ?? 4,
          max: box?.max ?? 16,
          divisions: box?.divisions ?? 2,
          label: box?.round ?? false
              ? con.boxValue?.round().toString() ?? w.value!.round().toString()
              : con.boxValue?.toString() ?? w.value!.toString(),
          onChanged: (v) {
            //
            box?.onChanged?.call(v);

            if (w.onChanged != null) {
              w.onChanged!(v);
            }
            setState(() {
              con.boxValue = v;
            });
          },
        )
      ]);
}

/// User has the option to extend this class or use the mixin (see below)
class SliderBoxController with SliderFieldsBoxMixin {
  SliderBoxController({
    ValueChanged<double>? onChanged,
    String? title,
    TextStyle? textStyle,
    double? value,
    double? min,
    double? max,
    int? divisions,
    bool? round,
  }) {
    this.onChanged = onChanged;
    this.title = title;
    this.textStyle = textStyle;
    this.value = value;
    this.min = min;
    this.max = max;
    this.divisions = divisions;
    this.round = round;
  }
}

/// Supply the functions and properties of its implemented mixin.
mixin SliderFieldsBoxMixin implements ControllerBoxMixin<double> {
  //
  @override
  StateBox<double, StatefulWidgetBox<double>>? boxState;

  @override
  double? boxValue;

  ValueChanged<double>? onChanged;
  String? title;
  TextStyle? textStyle;
  double? value;
  double? min;
  double? max;
  int? divisions;
  bool? round;
}
