library boxes;

//
// Copyright 2023 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//
import 'package:boxes/controller/controller_box.dart';
import 'package:boxes/view/state_box.dart';

import 'package:flutter/gestures.dart'
    show DragStartBehavior, GestureLongPressCallback, GestureTapCallback;
import 'package:flutter/material.dart';

/// Likely needed by subclasses
export 'package:boxes/controller/controller_box.dart';

class SwitchBox extends StatefulWidgetBox<bool> {
  SwitchBox({
    super.key,
    super.controller,
    this.value,
    this.onChanged,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.isThreeLine,
    this.dense,
    this.visualDensity,
    this.shape,
    this.style,
    this.selectedColor,
    this.iconColor,
    this.textColor,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.leadingAndTrailingTextStyle,
    this.contentPadding,
    this.enabled,
    this.onTap,
    this.onLongPress,
    this.onFocusChange,
    this.mouseCursor,
    this.selected,
    this.focusColor,
    this.hoverColor,
    this.splashColor,
    this.focusNode,
    this.autofocus,
    this.tileColor,
    this.selectedTileColor,
    this.enableFeedback,
    this.horizontalTitleGap,
    this.minVerticalPadding,
    this.minLeadingWidth,
    this.titleAlignment,
    this.activeColor,
    this.activeTrackColor,
    this.inactiveThumbColor,
    this.inactiveTrackColor,
    this.activeThumbImage,
    this.onActiveThumbImageError,
    this.inactiveThumbImage,
    this.onInactiveThumbImageError,
    this.thumbColor,
    this.trackColor,
    this.trackOutlineColor,
    this.trackOutlineWidth,
    this.thumbIcon,
    this.materialTapTargetSize,
    this.dragStartBehavior,
    this.overlayColor,
    this.splashRadius,
  });

  /// Whether this switch is on or off.
  final bool? value;
  final ValueChanged<bool>? onChanged;

  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final bool? isThreeLine;
  final bool? dense;
  final VisualDensity? visualDensity;
  final ShapeBorder? shape;
  final Color? selectedColor;
  final Color? iconColor;
  final Color? textColor;
  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;
  final TextStyle? leadingAndTrailingTextStyle;
  final ListTileStyle? style;
  final EdgeInsetsGeometry? contentPadding;
  final bool? enabled;
  final GestureTapCallback? onTap;
  final GestureLongPressCallback? onLongPress;
  final bool? selected;
  final Color? splashColor;
  final Color? tileColor;
  final Color? selectedTileColor;
  final bool? enableFeedback;
  final double? horizontalTitleGap;
  final double? minVerticalPadding;
  final double? minLeadingWidth;
  final ListTileTitleAlignment? titleAlignment;

  final MouseCursor? mouseCursor;
  final Color? focusColor;
  final Color? hoverColor;
  final FocusNode? focusNode;
  final ValueChanged<bool>? onFocusChange;
  final bool? autofocus;

  final Color? activeColor;
  final Color? activeTrackColor;
  final Color? inactiveThumbColor;
  final Color? inactiveTrackColor;
  final ImageProvider? activeThumbImage;
  final ImageErrorListener? onActiveThumbImageError;
  final ImageProvider? inactiveThumbImage;
  final ImageErrorListener? onInactiveThumbImageError;
  final MaterialStateProperty<Color?>? thumbColor;
  final MaterialStateProperty<Color?>? trackColor;
  final MaterialStateProperty<Color?>? trackOutlineColor;
  final MaterialStateProperty<double?>? trackOutlineWidth;
  final MaterialStateProperty<Icon?>? thumbIcon;
  final MaterialTapTargetSize? materialTapTargetSize;
  final DragStartBehavior? dragStartBehavior;
  final MaterialStateProperty<Color?>? overlayColor;
  final double? splashRadius;

  @override
  StateBox<bool, SwitchBox> createState() => _SwitchBoxState();
}

class _SwitchBoxState extends StateBox<bool, SwitchBox> {
  @override
  void initState() {
    super.initState();
    //
    con.boxValue ??= w.value ?? false;
  }

  SwitchBoxMixin? box;

  @override
  void didUpdateWidget(covariant SwitchBox oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (con is SwitchBoxMixin) {
      box = con as SwitchBoxMixin?;
    } else {
      box = null;
    }
  }

  @override
  Widget build(BuildContext context) => ListTile(
        leading: box?.leading ?? w.leading,
        title: box?.title ?? w.title,
        subtitle: box?.subtitle ?? w.subtitle,
        isThreeLine: box?.isThreeLine ?? w.isThreeLine ?? false,
        dense: box?.dense ?? w.dense,
        visualDensity: box?.visualDensity ?? w.visualDensity,
        shape: box?.shape ?? w.shape,
        style: box?.style ?? w.style,
        selectedColor: box?.selectedColor ?? w.selectedColor,
        iconColor: box?.iconColor ?? w.iconColor,
        textColor: box?.textColor ?? w.textColor,
        titleTextStyle: box?.titleTextStyle ?? w.titleTextStyle,
        subtitleTextStyle: box?.subtitleTextStyle ?? w.subtitleTextStyle,
        leadingAndTrailingTextStyle:
            box?.leadingAndTrailingTextStyle ?? w.leadingAndTrailingTextStyle,
        contentPadding: box?.contentPadding ?? w.contentPadding,
        enabled: box?.enabled ?? w.enabled ?? true,
        onTap: () {
          box?.onTap();
          _onChanged(!con.boxValue!);
        },
        onLongPress: box?.onLongPress ?? w.onLongPress,
        onFocusChange: box?.onFocusChange ?? w.onFocusChange,
        mouseCursor: box?.mouseCursor ?? w.mouseCursor,
        selected: box?.selected ?? w.selected ?? false,
        focusColor: box?.focusColor ?? w.focusColor,
        hoverColor: box?.hoverColor ?? w.hoverColor,
        splashColor: box?.splashColor ?? w.splashColor,
        focusNode: box?.focusNode ?? w.focusNode,
        autofocus: box?.autofocus ?? w.autofocus ?? false,
        tileColor: box?.tileColor ?? w.tileColor,
        selectedTileColor: box?.selectedTileColor ?? w.selectedTileColor,
        enableFeedback: box?.enableFeedback ?? w.enableFeedback,
        horizontalTitleGap: box?.horizontalTitleGap ?? w.horizontalTitleGap,
        minVerticalPadding: box?.minVerticalPadding ?? w.minVerticalPadding,
        minLeadingWidth: box?.minLeadingWidth ?? w.minLeadingWidth,
        titleAlignment: box?.titleAlignment ?? w.titleAlignment,
        trailing: Switch(
          value: con.boxValue!,
          onChanged: _onChanged,
          activeColor: box?.activeColor ?? w.activeColor,
          activeTrackColor: box?.activeTrackColor ?? w.activeTrackColor,
          inactiveThumbColor: box?.inactiveThumbColor ?? w.inactiveThumbColor,
          inactiveTrackColor: box?.inactiveTrackColor ?? w.inactiveTrackColor,
          activeThumbImage: box?.activeThumbImage ?? w.activeThumbImage,
          onActiveThumbImageError:
              box?.onActiveThumbImageError ?? w.onActiveThumbImageError,
          inactiveThumbImage: box?.inactiveThumbImage ?? w.inactiveThumbImage,
          onInactiveThumbImageError:
              box?.onInactiveThumbImageError ?? w.onInactiveThumbImageError,
          thumbColor: box?.thumbColor ?? w.thumbColor,
          trackColor: box?.trackColor ?? w.trackColor,
          trackOutlineColor: box?.trackOutlineColor ?? w.trackOutlineColor,
          trackOutlineWidth: box?.trackOutlineWidth ?? w.trackOutlineWidth,
          thumbIcon: box?.thumbIcon ?? w.thumbIcon,
          materialTapTargetSize:
              box?.materialTapTargetSize ?? w.materialTapTargetSize,
          dragStartBehavior: box?.dragStartBehavior ??
              w.dragStartBehavior ??
              DragStartBehavior.start,
          mouseCursor: box?.mouseCursor ?? w.mouseCursor,
          focusColor: box?.focusColor ?? w.focusColor,
          hoverColor: box?.hoverColor ?? w.hoverColor,
          overlayColor: box?.overlayColor ?? w.overlayColor,
          splashRadius: box?.splashRadius ?? w.splashRadius,
          focusNode: box?.focusNode ?? w.focusNode,
          onFocusChange: box?.onFocusChange ?? w.onFocusChange,
          autofocus: box?.autofocus ?? w.autofocus ?? false,
        ),
      );

  // Called when the value toggles
  void _onChanged(bool v) {
    //
    setState(() => con.boxValue = v);

    con.onChanged(v);

    if (w.onChanged != null) {
      w.onChanged!(v);
    }
  }
}

/// User has the option to extend a class or use a mixin (see below)
class SwitchBoxController with SwitchBoxMixin {}

/// Supply the functions and properties of its implemented mixin.
mixin SwitchBoxMixin implements ControllerBoxMixin<bool> {
  //
  @override
  StateBox<bool, StatefulWidgetBox<bool>>? boxState;

  @override
  bool? boxValue;

  /// Signature for callbacks that report that an underlying value has changed.
  @override
  //ignore: avoid_positional_boolean_parameters
  void onChanged(bool? value) {}

  /// Called when the dropdown button is tapped.
  @override
  void onTap() {}

  bool? value;
  Widget? leading;
  Widget? title;
  Widget? subtitle;
  Widget? trailing;
  bool? isThreeLine;
  bool? dense;
  VisualDensity? visualDensity;
  ShapeBorder? shape;
  Color? selectedColor;
  Color? iconColor;
  Color? textColor;
  TextStyle? titleTextStyle;
  TextStyle? subtitleTextStyle;
  TextStyle? leadingAndTrailingTextStyle;
  ListTileStyle? style;
  EdgeInsetsGeometry? contentPadding;
  bool? enabled;
  GestureLongPressCallback? onLongPress;
  bool? selected;
  Color? splashColor;
  Color? tileColor;
  Color? selectedTileColor;
  bool? enableFeedback;
  double? horizontalTitleGap;
  double? minVerticalPadding;
  double? minLeadingWidth;
  ListTileTitleAlignment? titleAlignment;

  MouseCursor? mouseCursor;
  Color? focusColor;
  Color? hoverColor;
  FocusNode? focusNode;
  ValueChanged<bool>? onFocusChange;
  bool? autofocus;

  Color? activeColor;
  Color? activeTrackColor;
  Color? inactiveThumbColor;
  Color? inactiveTrackColor;
  ImageProvider? activeThumbImage;
  ImageErrorListener? onActiveThumbImageError;
  ImageProvider? inactiveThumbImage;
  ImageErrorListener? onInactiveThumbImageError;
  MaterialStateProperty<Color?>? thumbColor;
  MaterialStateProperty<Color?>? trackColor;
  MaterialStateProperty<Color?>? trackOutlineColor;
  MaterialStateProperty<double?>? trackOutlineWidth;
  MaterialStateProperty<Icon?>? thumbIcon;
  MaterialTapTargetSize? materialTapTargetSize;
  DragStartBehavior? dragStartBehavior;
  MaterialStateProperty<Color?>? overlayColor;
  double? splashRadius;
}
