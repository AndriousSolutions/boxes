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

///
class DropDownBox<T> extends StatefulWidgetBox<T> {
  ///
  DropDownBox({
    super.key,
    super.controller,
    this.items,
    this.menuItems,
    this.selectedItemBuilder,
    this.value,
    this.hint,
    this.disabledHint,
    this.onChanged,
    this.onTap,
    this.elevation,
    this.style,
    this.underline,
    this.icon,
    this.iconDisabledColor,
    this.iconEnabledColor,
    this.iconSize,
    this.isDense,
    this.isExpanded,
    this.itemHeight,
    this.focusColor,
    this.focusNode,
    this.autofocus,
    this.dropdownColor,
    this.menuMaxHeight,
    this.enableFeedback,
    this.alignment,
    this.borderRadius,
    this.padding,
  });

  final List<T>? items;
  final List<DropdownMenuItem<T>>? menuItems;
  final T? value;
  final Widget? hint;
  final Widget? disabledHint;
  final ValueChanged<T?>? onChanged;
  final VoidCallback? onTap;
  final DropdownButtonBuilder? selectedItemBuilder;
  final int? elevation;
  final TextStyle? style;
  final Widget? underline;
  final Widget? icon;
  final Color? iconDisabledColor;
  final Color? iconEnabledColor;
  final double? iconSize;
  final bool? isDense;
  final bool? isExpanded;
  final double? itemHeight;
  final Color? focusColor;
  final FocusNode? focusNode;
  final bool? autofocus;
  final Color? dropdownColor;
  final double? menuMaxHeight;
  final bool? enableFeedback;
  final AlignmentGeometry? alignment;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;

  @override
  StateBox<T, DropDownBox<T>> createState() => _DropDownBoxState<T>();
}

class _DropDownBoxState<T> extends StateBox<T, DropDownBox<T>> {
  @override
  void initState() {
    super.initState();
    if (con is DropDownBoxMixin<T>) {
      box = con as DropDownBoxMixin<T>?;
    }
    con.boxValue = box?.value ?? w.value;
  }

  DropDownBoxMixin<T>? box;

  @override
  void didUpdateWidget(covariant DropDownBox<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (con is DropDownBoxMixin<T>) {
      box = con as DropDownBoxMixin<T>?;
    } else {
      box = null;
    }
  }

  @override
  void dispose() {
    box = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => DropdownButton<T>(
        items: _menuItems(),
        selectedItemBuilder: box?.selectedItemBuilder ?? w.selectedItemBuilder,
        value: con.boxValue,
        hint: box?.hint ?? w.hint,
        disabledHint: box?.disabledHint ?? w.disabledHint,
        onChanged: (T? value) {
          //
          con.boxValue = value;

          con.onChanged(value);

          w.onChanged?.call(value);

          setState(() {});
        },
        onTap: () {
          con.onTap();
          w.onTap?.call();
        },
        elevation: box?.elevation ?? w.elevation ?? 8,
        style: box?.style ?? w.style,
        underline: box?.underline ?? w.underline,
        icon: box?.icon ?? w.icon,
        iconDisabledColor: box?.iconDisabledColor ?? w.iconDisabledColor,
        iconEnabledColor: box?.iconEnabledColor ?? w.iconEnabledColor,
        iconSize: box?.iconSize ?? w.iconSize ?? 24,
        isDense: box?.isDense ?? w.isDense ?? false,
        isExpanded: box?.isExpanded ?? w.isExpanded ?? false,
        itemHeight: box?.itemHeight ?? w.itemHeight ?? kMinInteractiveDimension,
        focusColor: box?.focusColor ?? w.focusColor,
        focusNode: box?.focusNode ?? w.focusNode,
        autofocus: box?.autofocus ?? w.autofocus ?? false,
        dropdownColor: box?.dropdownColor ?? w.dropdownColor,
        menuMaxHeight: box?.menuMaxHeight ?? w.menuMaxHeight,
        enableFeedback: box?.enableFeedback ?? w.enableFeedback,
        alignment:
            box?.alignment ?? w.alignment ?? AlignmentDirectional.centerStart,
        borderRadius:
            box?.borderRadius ?? w.borderRadius ?? BorderRadius.circular(16),
        padding: box?.padding ?? w.padding,
      );

  /// Supply the menu items.
  /// Pass controller if any takes precedence
  /// Menu items takes precedence over menu entries
  List<DropdownMenuItem<T>>? _menuItems() {
    //
    List<DropdownMenuItem<T>>? items;

    if (box?.items != null && box!.items!.isNotEmpty) {
      items = _dropDownMenuItem(box!.items!);
    }

    if (items == null && w.items != null && w.items!.isNotEmpty) {
      items = _dropDownMenuItem(w.items!);
    }

    items ??= box?.menuItems;

    return items ??= w.menuItems;
  }

  /// Return Dropdown Menu Items
  List<DropdownMenuItem<T>>? _dropDownMenuItem(List<T> items) {
    List<DropdownMenuItem<T>>? menuItems;
    try {
      menuItems = items.map<DropdownMenuItem<T>>((T value) {
        return DropdownMenuItem<T>(
          value: value,
          child: Text('$value'),
        );
      }).toList();
    } catch (e) {
      menuItems = null;
    }
    return menuItems;
  }
}

/// User has the option to extend a class or use a mixin (see below)
class DropDownBoxController<T> with DropDownBoxMixin<T> {}

/// Supply the functions and properties of its implemented mixin.
mixin DropDownBoxMixin<T> implements ControllerBoxMixin<T> {
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

  List<T>? items;
  List<DropdownMenuItem<T>>? menuItems;
  T? value;
  Widget? hint;
  Widget? disabledHint;
  DropdownButtonBuilder? selectedItemBuilder;
  int? elevation;
  TextStyle? style;
  Widget? underline;
  Widget? icon;
  Color? iconDisabledColor;
  Color? iconEnabledColor;
  double? iconSize;
  bool? isDense;
  bool? isExpanded;
  double? itemHeight;
  Color? focusColor;
  FocusNode? focusNode;
  bool? autofocus;
  Color? dropdownColor;
  double? menuMaxHeight;
  bool? enableFeedback;
  AlignmentGeometry? alignment;
  BorderRadius? borderRadius;
  EdgeInsetsGeometry? padding;
}
