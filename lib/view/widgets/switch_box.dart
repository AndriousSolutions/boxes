library boxes;

//
// Copyright 2023 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//

import 'package:boxes/controller/controller_box.dart';

import 'package:boxes/view/state_box.dart';

import 'package:flutter/gestures.dart'
    show DragStartBehavior, GestureLongPressCallback;

import 'package:flutter/material.dart';

/// Likely needed by subclasses
export 'package:boxes/controller/controller_box.dart';

class SwitchBox extends StatefulWidgetBox<bool> {
  SwitchBox({
    super.key,
    super.controller,
  });

  @override
  StateBox<bool, SwitchBox> createState() => _SwitchBoxState();
}

class _SwitchBoxState extends StateBox<bool, SwitchBox> {
  @override
  void initState() {
    super.initState();
    //
    if (con is SwitchBoxMixin) {
      box = con as SwitchBoxMixin?;
    }
    con.boxValue ??= box?.value ??= false;
    box?.value = con.boxValue;
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
        leading: box?.leading,
        title: box?.title,
        subtitle: box?.subtitle,
        isThreeLine: box?.isThreeLine ?? false,
        dense: box?.dense,
        visualDensity: box?.visualDensity,
        shape: box?.shape,
        style: box?.style,
        selectedColor: box?.selectedColor,
        iconColor: box?.iconColor,
        textColor: box?.textColor,
        titleTextStyle: box?.titleTextStyle,
        subtitleTextStyle: box?.subtitleTextStyle,
        leadingAndTrailingTextStyle: box?.leadingAndTrailingTextStyle,
        contentPadding: box?.contentPadding,
        enabled: box?.enabled ?? true,
        onTap: () {
          box?.onTap?.call();
          _onChanged(!con.boxValue!);
        },
        onLongPress: box?.onLongPress,
        onFocusChange: box?.onFocusChange,
        mouseCursor: box?.mouseCursor,
        selected: box?.selected ?? false,
        focusColor: box?.focusColor,
        hoverColor: box?.hoverColor,
        splashColor: box?.splashColor,
        focusNode: box?.focusNode,
        autofocus: box?.autofocus ?? false,
        tileColor: box?.tileColor,
        selectedTileColor: box?.selectedTileColor,
        enableFeedback: box?.enableFeedback,
        horizontalTitleGap: box?.horizontalTitleGap,
        minVerticalPadding: box?.minVerticalPadding,
        minLeadingWidth: box?.minLeadingWidth,
        titleAlignment: box?.titleAlignment,
        trailing: Switch(
          value: con.boxValue!,
          onChanged: _onChanged,
          activeColor: box?.activeColor,
          activeTrackColor: box?.activeTrackColor,
          inactiveThumbColor: box?.inactiveThumbColor,
          inactiveTrackColor: box?.inactiveTrackColor,
          activeThumbImage: box?.activeThumbImage,
          onActiveThumbImageError: box?.onActiveThumbImageError,
          inactiveThumbImage: box?.inactiveThumbImage,
          onInactiveThumbImageError: box?.onInactiveThumbImageError,
          thumbColor: box?.thumbColor,
          trackColor: box?.trackColor,
          trackOutlineColor: box?.trackOutlineColor,
          trackOutlineWidth: box?.trackOutlineWidth,
          thumbIcon: box?.thumbIcon,
          materialTapTargetSize: box?.materialTapTargetSize,
          dragStartBehavior: box?.dragStartBehavior ?? DragStartBehavior.start,
          mouseCursor: box?.mouseCursor,
          focusColor: box?.focusColor,
          hoverColor: box?.hoverColor,
          overlayColor: box?.overlayColor,
          splashRadius: box?.splashRadius,
          focusNode: box?.focusNode,
          onFocusChange: box?.onFocusChange,
          autofocus: box?.autofocus ?? false,
        ),
      );

  // Called when the value toggles
  void _onChanged(bool v) {
    //
    setState(() {});

    con.boxValue = v;

    box?.value = v;

    box?.onChanged?.call(v);
  }
}

/// User has the option to extend this class or use the mixin (see below)
class SwitchBoxController with SwitchBoxMixin {
  ///
  SwitchBoxController({
    bool? value,
    Widget? leading,
    Widget? title,
    Widget? subtitle,
    Widget? trailing,
    bool? isThreeLine,
    bool? dense,
    VisualDensity? visualDensity,
    ShapeBorder? shape,
    Color? selectedColor,
    Color? iconColor,
    Color? textColor,
    TextStyle? titleTextStyle,
    TextStyle? subtitleTextStyle,
    TextStyle? leadingAndTrailingTextStyle,
    ListTileStyle? style,
    EdgeInsetsGeometry? contentPadding,
    bool? enabled,
    VoidCallback? onTap,
    GestureLongPressCallback? onLongPress,
    bool? selected,
    Color? splashColor,
    Color? tileColor,
    Color? selectedTileColor,
    bool? enableFeedback,
    double? horizontalTitleGap,
    double? minVerticalPadding,
    double? minLeadingWidth,
    ListTileTitleAlignment? titleAlignment,
    MouseCursor? mouseCursor,
    Color? focusColor,
    Color? hoverColor,
    FocusNode? focusNode,
    ValueChanged<bool>? onFocusChange,
    bool? autofocus,
    ValueChanged<bool>? onChanged,
    Color? activeColor,
    Color? activeTrackColor,
    Color? inactiveThumbColor,
    Color? inactiveTrackColor,
    ImageProvider? activeThumbImage,
    ImageErrorListener? onActiveThumbImageError,
    ImageProvider? inactiveThumbImage,
    ImageErrorListener? onInactiveThumbImageError,
    MaterialStateProperty<Color?>? thumbColor,
    MaterialStateProperty<Color?>? trackColor,
    MaterialStateProperty<Color?>? trackOutlineColor,
    MaterialStateProperty<double?>? trackOutlineWidth,
    MaterialStateProperty<Icon?>? thumbIcon,
    MaterialTapTargetSize? materialTapTargetSize,
    DragStartBehavior? dragStartBehavior,
    MaterialStateProperty<Color?>? overlayColor,
    double? splashRadius,
  }) {
    this.value = value;
    this.leading = leading;
    this.title = title;
    this.subtitle = subtitle;
    this.trailing = trailing;
    this.isThreeLine = isThreeLine;
    this.dense = dense;
    this.visualDensity = visualDensity;
    this.shape = shape;
    this.selectedColor = selectedColor;
    this.iconColor = iconColor;
    this.textColor = textColor;
    this.titleTextStyle = titleTextStyle;
    this.subtitleTextStyle = subtitleTextStyle;
    this.leadingAndTrailingTextStyle = leadingAndTrailingTextStyle;
    this.style = style;
    this.contentPadding = contentPadding;
    this.enabled = enabled;
    this.onTap = onTap;
    this.onLongPress = onLongPress;
    this.selected = selected;
    this.splashColor = splashColor;
    this.tileColor = tileColor;
    this.selectedTileColor = selectedTileColor;
    this.enableFeedback = enableFeedback;
    this.horizontalTitleGap = horizontalTitleGap;
    this.minVerticalPadding = minVerticalPadding;
    this.minLeadingWidth = minLeadingWidth;
    this.titleAlignment = titleAlignment;
    this.mouseCursor = mouseCursor;
    this.focusColor = focusColor;
    this.hoverColor = hoverColor;
    this.focusNode = focusNode;
    this.onFocusChange = onFocusChange;
    this.autofocus = autofocus;
    this.onChanged = onChanged;
    this.activeColor = activeColor;
    this.activeTrackColor = activeTrackColor;
    this.inactiveThumbColor = inactiveThumbColor;
    this.inactiveTrackColor = inactiveTrackColor;
    this.activeThumbImage = activeThumbImage;
    this.onActiveThumbImageError = onActiveThumbImageError;
    this.inactiveThumbImage = inactiveThumbImage;
    this.onInactiveThumbImageError = onInactiveThumbImageError;
    this.thumbColor = thumbColor;
    this.trackColor = trackColor;
    this.trackOutlineColor = trackOutlineColor;
    this.trackOutlineWidth = trackOutlineWidth;
    this.thumbIcon = thumbIcon;
    this.materialTapTargetSize = materialTapTargetSize;
    this.dragStartBehavior = dragStartBehavior;
    this.overlayColor = overlayColor;
    this.splashRadius = splashRadius;
  }
}

/// Supply the functions and properties of its implemented mixin.
mixin SwitchBoxMixin implements ControllerBoxMixin<bool> {
  //
  @override
  StateBox<bool, StatefulWidgetBox<bool>>? boxState;

  @override
  bool? boxValue;

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
  VoidCallback? onTap;
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

  ValueChanged<bool>? onChanged;
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
