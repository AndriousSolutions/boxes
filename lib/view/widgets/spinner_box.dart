library boxes;

//
// Copyright 2023 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//
import 'package:boxes/controller/controller_box.dart';

import 'package:boxes/view/state_box.dart';

import 'package:flutter/cupertino.dart';

/// Likely needed by subclasses
export 'package:boxes/controller/controller_box.dart';

///
class SpinnerBox extends StatefulWidgetBox<int> {
  ///
  SpinnerBox({
    super.key,
    super.controller,
    this.diameterRatio,
    this.backgroundColor,
    this.offAxisFraction,
    this.useMagnifier,
    this.magnification,
    this.scrollController,
    this.squeeze,
    this.itemExtent,
    this.onSelectedItemChanged,
    this.children,
    this.itemBuilder,
    this.childCount,
    this.selectionOverlay,
    this.looping,
  });

  final double? diameterRatio;
  final Color? backgroundColor;
  final double? offAxisFraction;
  final bool? useMagnifier;
  final double? magnification;
  final FixedExtentScrollController? scrollController;
  final double? itemExtent;
  final double? squeeze;
  final ValueChanged<int>? onSelectedItemChanged;
  final List<Widget>? children;
  final NullableIndexedWidgetBuilder? itemBuilder;
  final int? childCount;
  final Widget? selectionOverlay;
  final bool? looping;

  @override
  State<SpinnerBox> createState() => _SpinnerBoxState();
}

class _SpinnerBoxState extends StateBox<int, SpinnerBox> {
  @override
  void initState() {
    super.initState();
    if (con is SpinnerFieldsBoxMixin) {
      box = con as SpinnerFieldsBoxMixin?;
    }
    con.boxValue ??= null;
  }

  SpinnerFieldsBoxMixin? box;

  @override
  void didUpdateWidget(covariant SpinnerBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (con is SpinnerFieldsBoxMixin) {
      box = con as SpinnerFieldsBoxMixin?;
    } else {
      box = null;
    }
  }

  @override
  void dispose() {
    box = null;
    super.dispose();
  }

  final double _kDefaultDiameterRatio = 1.07;
  final double _kSqueeze = 1.45;
  final double _kItemExtent = 25;

  @override
  Widget build(BuildContext context) {
    //
    Widget spinner;
    //
    final itemBuilder = box?.itemBuilder ?? widget.itemBuilder;

    final children = box?.children ?? widget.children;

    if (itemBuilder != null && (children == null || children.isEmpty)) {
      //
      spinner = CupertinoPicker.builder(
        diameterRatio: box?.diameterRatio ??
            widget.diameterRatio ??
            _kDefaultDiameterRatio,
        backgroundColor: box?.backgroundColor ?? widget.backgroundColor,
        offAxisFraction: box?.offAxisFraction ?? widget.offAxisFraction ?? 0.0,
        useMagnifier: box?.useMagnifier ?? widget.useMagnifier ?? false,
        magnification: box?.magnification ?? widget.magnification ?? 1.0,
        scrollController: box?.scrollController ?? widget.scrollController,
        squeeze: box?.squeeze ?? widget.squeeze ?? _kSqueeze,
        itemExtent: box?.itemExtent ?? widget.itemExtent ?? _kItemExtent,
        onSelectedItemChanged: _onSelectedItemChanged,
        itemBuilder: itemBuilder,
        childCount: box?.childCount ?? widget.childCount,
        selectionOverlay: box?.selectionOverlay ?? widget.selectionOverlay,
      );
    } else {
      //
      spinner = CupertinoPicker(
        diameterRatio: box?.diameterRatio ??
            widget.diameterRatio ??
            _kDefaultDiameterRatio,
        backgroundColor: box?.backgroundColor ?? widget.backgroundColor,
        offAxisFraction: box?.offAxisFraction ?? widget.offAxisFraction ?? 0.0,
        useMagnifier: box?.useMagnifier ?? widget.useMagnifier ?? false,
        magnification: box?.magnification ?? widget.magnification ?? 1.0,
        scrollController: box?.scrollController ?? widget.scrollController,
        squeeze: box?.squeeze ?? widget.squeeze ?? _kSqueeze,
        itemExtent: box?.itemExtent ?? widget.itemExtent ?? _kItemExtent,
        onSelectedItemChanged: _onSelectedItemChanged,
        selectionOverlay: box?.selectionOverlay ?? widget.selectionOverlay,
        looping: box?.looping ?? widget.looping ?? false,
        children: children ?? <Widget>[],
      );
    }
    return spinner;
  }

  // Determine the selected value
  void _onSelectedItemChanged(int value) {
    //
    con.boxValue = value;

    box?.onSelectedItemChanged?.call(value);
  }
}

/// User has the option to extend this class or use the mixin (see below)
class SpinnerBoxController with SpinnerFieldsBoxMixin {
  SpinnerBoxController({
    double? diameterRatio,
    Color? backgroundColor,
    double? offAxisFraction,
    bool? useMagnifier,
    double? magnification,
    FixedExtentScrollController? scrollController,
    double? itemExtent,
    double? squeeze,
    ValueChanged<int>? onSelectedItemChanged,
    List<Widget>? children,
    NullableIndexedWidgetBuilder? itemBuilder,
    int? childCount,
    Widget? selectionOverlay,
    bool? looping,
  }) {
    this.diameterRatio = diameterRatio;
    this.backgroundColor = backgroundColor;
    this.offAxisFraction = offAxisFraction;
    this.useMagnifier = useMagnifier;
    this.magnification = magnification;
    this.scrollController = scrollController;
    this.squeeze = squeeze;
    this.itemExtent = itemExtent;
    this.onSelectedItemChanged = onSelectedItemChanged;
    this.children = children;
    this.itemBuilder = itemBuilder;
    this.childCount = childCount;
    this.selectionOverlay = selectionOverlay;
    this.looping = looping;
  }
}

/// Supply the functions and properties of its implemented mixin.
mixin SpinnerFieldsBoxMixin implements ControllerBoxMixin<int> {
  //
  @override
  StateBox<int, StatefulWidgetBox<int>>? boxState;

  @override
  int? boxValue;

  // /// Signature for callbacks that report that an underlying value has changed.
  // @override
  // void onChanged(int? value) {}
  //
  // /// Called when the dropdown button is tapped.
  // @override
  // void onTap() {}

  double? diameterRatio;
  Color? backgroundColor;
  double? offAxisFraction;
  bool? useMagnifier;
  double? magnification;
  FixedExtentScrollController? scrollController;
  double? itemExtent;
  double? squeeze;
  ValueChanged<int>? onSelectedItemChanged;
  List<Widget>? children;
  NullableIndexedWidgetBuilder? itemBuilder;
  int? childCount;
  Widget? selectionOverlay;
  bool? looping;
}
