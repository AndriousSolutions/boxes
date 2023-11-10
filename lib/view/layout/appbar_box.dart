library boxes;

//
// Copyright 2023 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//

import 'package:boxes/view/_view_export_file.dart';

import 'package:flutter/material.dart';

export 'package:boxes/controller/InheritedWidget_box_mixin.dart';

///
class AppBarBox extends StatelessWidget implements PreferredSizeWidget {
  ///
  AppBarBox({
    super.key,
    AppBarFieldsBoxMixin? controller,
    List<Widget>? actions,
  })  : widget = makeInheritedWidgetBox(
          keyId: key,
          controller: controller,
          child: _AppBarBox(
            controller: controller,
            actions: actions,
          ),
        ),
        preferredSize = _PreferredAppBarSize(controller);

  final Widget widget;

  @override
  Widget build(BuildContext context) => widget;

  @override
  final Size preferredSize;
}

class _PreferredAppBarSize extends Size {
  _PreferredAppBarSize(AppBarFieldsBoxMixin? con)
      : toolbarHeight = con?.toolbarHeight,
        bottomHeight = con?.bottom?.preferredSize.height,
        super.fromHeight((con?.toolbarHeight ?? kToolbarHeight) +
            (con?.bottom?.preferredSize.height ?? 0));

  final double? toolbarHeight;
  final double? bottomHeight;
}

class _AppBarBox extends StatelessWidget {
  ///
  _AppBarBox({
    super.key,
    AppBarFieldsBoxMixin? controller,
    required this.actions,
  }) : controller = controller ?? _AppBarBoxController();

  final AppBarFieldsBoxMixin controller;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    //
    controller.context = context;

    if (controller is InheritedWidgetBoxMixin) {
      (controller as InheritedWidgetBoxMixin).dependOnInheritedWidget(context);
    }
    return AppBar(
      key: controller.key,
      leading: controller.leading,
      automaticallyImplyLeading: controller.automaticallyImplyLeading ?? true,
      title: controller.title,
      actions: controller.actions ?? actions,
      flexibleSpace: controller.flexibleSpace,
      bottom: controller.bottom,
      elevation: controller.elevation,
      scrolledUnderElevation: controller.scrolledUnderElevation,
      notificationPredicate: controller.notificationPredicate ??
          defaultScrollNotificationPredicate,
      shadowColor: controller.shadowColor,
      surfaceTintColor: controller.surfaceTintColor,
      shape: controller.shape,
      backgroundColor: controller.backgroundColor,
      foregroundColor: controller.foregroundColor,
      iconTheme: controller.iconTheme,
      actionsIconTheme: controller.actionsIconTheme,
      primary: controller.primary ?? true,
      centerTitle: controller.centerTitle,
      excludeHeaderSemantics: controller.excludeHeaderSemantics ?? false,
      titleSpacing: controller.titleSpacing,
      toolbarOpacity: controller.toolbarOpacity ?? 1.0,
      bottomOpacity: controller.bottomOpacity ?? 1.0,
      toolbarHeight: controller.toolbarHeight,
      leadingWidth: controller.leadingWidth,
      toolbarTextStyle: controller.toolbarTextStyle,
      titleTextStyle: controller.titleTextStyle,
      systemOverlayStyle: controller.systemOverlayStyle,
      forceMaterialTransparency: controller.forceMaterialTransparency ?? false,
      clipBehavior: controller.clipBehavior,
    );
  }
}

class _AppBarBoxController with AppBarFieldsBoxMixin, InheritedWidgetBoxMixin {}
