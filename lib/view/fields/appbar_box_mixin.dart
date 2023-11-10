library boxes;

//
// Copyright 2023 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle;

export 'package:flutter/services.dart' show SystemUiOverlayStyle;

mixin AppBarFieldsBoxMixin {
  late BuildContext context;
  Key? key;
  Widget? leading;
  bool? automaticallyImplyLeading;
  Widget? title;
  List<Widget>? actions;
  Widget? flexibleSpace;
  PreferredSizeWidget? bottom;
  double? elevation;
  double? scrolledUnderElevation;
  ScrollNotificationPredicate? notificationPredicate;
  Color? shadowColor;
  Color? surfaceTintColor;
  ShapeBorder? shape;
  Color? backgroundColor;
  Color? foregroundColor;
  IconThemeData? iconTheme;
  IconThemeData? actionsIconTheme;
  bool? primary;
  bool? centerTitle;
  bool? excludeHeaderSemantics;
  double? titleSpacing;
  double? toolbarOpacity;
  double? bottomOpacity;
  Size? preferredSize;
  double? toolbarHeight;
  double? leadingWidth;
  TextStyle? toolbarTextStyle;
  TextStyle? titleTextStyle;
  SystemUiOverlayStyle? systemOverlayStyle;
  bool? forceMaterialTransparency;
  Clip? clipBehavior;
}
