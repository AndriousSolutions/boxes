library boxes;

//
// Copyright 2023 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//

import 'dart:io' show File;

import 'package:boxes/boxes_view.dart'
    show ImageFieldsBoxMixin, InheritedWidgetBoxMixin, makeInheritedWidgetBox;

import 'package:flutter/foundation.dart' show Uint8List;

import 'package:flutter/material.dart';

export 'package:boxes/controller/InheritedWidget_box_mixin.dart';

///
class ImageBox extends StatelessWidget {
  ///
  ImageBox({
    super.key,
    ImageProvider? image,
    ImageFieldsBoxMixin? controller,
  }) : widget = makeInheritedWidgetBox(
          keyId: key,
          controller: controller,
          child: _ImageBox(
            image: image,
            controller: controller,
          ),
        );

  ImageBox.network({
    super.key,
    String? src,
    ImageFieldsBoxMixin? controller,
  }) : widget = makeInheritedWidgetBox(
          keyId: key,
          controller: controller,
          child: _ImageBox(
            src: src,
            controller: controller,
          ),
        );

  ImageBox.file({
    super.key,
    File? file,
    ImageFieldsBoxMixin? controller,
  }) : widget = makeInheritedWidgetBox(
          keyId: key,
          controller: controller,
          child: _ImageBox(
            file: file,
            controller: controller,
          ),
        );

  ImageBox.asset({
    super.key,
    String? name,
    AssetBundle? bundle,
    String? package,
    ImageFieldsBoxMixin? controller,
  }) : widget = makeInheritedWidgetBox(
          keyId: key,
          controller: controller,
          child: _ImageBox(
            name: name,
            bundle: bundle,
            package: package,
            controller: controller,
          ),
        );

  ImageBox.memory({
    super.key,
    Uint8List? bytes,
    ImageFieldsBoxMixin? controller,
  }) : widget = makeInheritedWidgetBox(
          keyId: key,
          controller: controller,
          child: _ImageBox(
            bytes: bytes,
            controller: controller,
          ),
        );

  final Widget widget;

  @override
  Widget build(BuildContext context) => widget;
}

///
class _ImageBox extends StatelessWidget {
  ///
  _ImageBox({
    // ignore: unused_element
    super.key,
    this.image,
    this.src,
    this.file,
    this.name,
    this.bundle,
    this.package,
    this.bytes,
    ImageFieldsBoxMixin? controller,
  }) : controller = controller ?? ImageBoxController();

  final ImageProvider? image;
  final String? src;
  final File? file;
  final String? name;
  final AssetBundle? bundle;
  final String? package;
  final Uint8List? bytes;
  final ImageFieldsBoxMixin controller;

  @override
  Widget build(BuildContext context) {
    //
    controller.context = context;

    if (controller is InheritedWidgetBoxMixin) {
      (controller as InheritedWidgetBoxMixin).dependOnInheritedWidget(context);
    }

    Widget widget;

    if (controller.image != null || image != null) {
      //
      widget = Image(
        image: image == null ? controller.image! : image!,
        frameBuilder: controller.frameBuilder,
        loadingBuilder: controller.loadingBuilder,
        errorBuilder: controller.errorBuilder,
        semanticLabel: controller.semanticLabel,
        excludeFromSemantics: controller.excludeFromSemantics ?? false,
        width: controller.width,
        height: controller.height,
        color: controller.color,
        opacity: controller.opacity,
        colorBlendMode: controller.colorBlendMode,
        fit: controller.fit,
        alignment: controller.alignment ?? Alignment.center,
        repeat: controller.repeat ?? ImageRepeat.noRepeat,
        centerSlice: controller.centerSlice,
        matchTextDirection: controller.matchTextDirection ?? false,
        gaplessPlayback: controller.gaplessPlayback ?? false,
        isAntiAlias: controller.isAntiAlias ?? false,
        filterQuality: controller.filterQuality ?? FilterQuality.low,
      );
    } else if (controller.src != null || src != null) {
      //
      widget = Image.network(
        src == null ? controller.src! : src!,
        scale: controller.scale ?? 1,
        frameBuilder: controller.frameBuilder,
        loadingBuilder: controller.loadingBuilder,
        errorBuilder: controller.errorBuilder,
        semanticLabel: controller.semanticLabel,
        excludeFromSemantics: controller.excludeFromSemantics ?? false,
        width: controller.width,
        height: controller.height,
        color: controller.color,
        opacity: controller.opacity,
        colorBlendMode: controller.colorBlendMode,
        fit: controller.fit,
        alignment: controller.alignment ?? Alignment.center,
        repeat: controller.repeat ?? ImageRepeat.noRepeat,
        centerSlice: controller.centerSlice,
        matchTextDirection: controller.matchTextDirection ?? false,
        gaplessPlayback: controller.gaplessPlayback ?? false,
        isAntiAlias: controller.isAntiAlias ?? false,
        filterQuality: controller.filterQuality ?? FilterQuality.low,
      );
    } else if (controller.file != null || file != null) {
      //
      widget = Image.file(
        file == null ? controller.file! : file!,
        scale: controller.scale ?? 1,
        frameBuilder: controller.frameBuilder,
        errorBuilder: controller.errorBuilder,
        semanticLabel: controller.semanticLabel,
        excludeFromSemantics: controller.excludeFromSemantics ?? false,
        width: controller.width,
        height: controller.height,
        color: controller.color,
        opacity: controller.opacity,
        colorBlendMode: controller.colorBlendMode,
        fit: controller.fit,
        alignment: controller.alignment ?? Alignment.center,
        repeat: controller.repeat ?? ImageRepeat.noRepeat,
        centerSlice: controller.centerSlice,
        matchTextDirection: controller.matchTextDirection ?? false,
        gaplessPlayback: controller.gaplessPlayback ?? false,
        isAntiAlias: controller.isAntiAlias ?? false,
        filterQuality: controller.filterQuality ?? FilterQuality.low,
        cacheWidth: controller.cacheWidth,
        cacheHeight: controller.cacheHeight,
      );
    } else if (controller.name != null || name != null) {
      //
      widget = Image.asset(
        name == null ? controller.name! : name!,
        bundle: controller.bundle ?? bundle,
        frameBuilder: controller.frameBuilder,
        errorBuilder: controller.errorBuilder,
        semanticLabel: controller.semanticLabel,
        excludeFromSemantics: controller.excludeFromSemantics ?? false,
        scale: controller.scale,
        width: controller.width,
        height: controller.height,
        color: controller.color,
        opacity: controller.opacity,
        colorBlendMode: controller.colorBlendMode,
        fit: controller.fit,
        alignment: controller.alignment ?? Alignment.center,
        repeat: controller.repeat ?? ImageRepeat.noRepeat,
        centerSlice: controller.centerSlice,
        matchTextDirection: controller.matchTextDirection ?? false,
        gaplessPlayback: controller.gaplessPlayback ?? false,
        isAntiAlias: controller.isAntiAlias ?? false,
        package: controller.package ?? package,
        filterQuality: controller.filterQuality ?? FilterQuality.low,
        cacheWidth: controller.cacheWidth,
        cacheHeight: controller.cacheHeight,
      );
    } else if (controller.bytes != null || bytes != null) {
      //
      widget = Image.memory(
        bytes == null ? controller.bytes! : bytes!,
        frameBuilder: controller.frameBuilder,
        errorBuilder: controller.errorBuilder,
        semanticLabel: controller.semanticLabel,
        excludeFromSemantics: controller.excludeFromSemantics ?? false,
        width: controller.width,
        height: controller.height,
        color: controller.color,
        opacity: controller.opacity,
        colorBlendMode: controller.colorBlendMode,
        fit: controller.fit,
        alignment: controller.alignment ?? Alignment.center,
        repeat: controller.repeat ?? ImageRepeat.noRepeat,
        centerSlice: controller.centerSlice,
        matchTextDirection: controller.matchTextDirection ?? false,
        gaplessPlayback: controller.gaplessPlayback ?? false,
        isAntiAlias: controller.isAntiAlias ?? false,
        filterQuality: controller.filterQuality ?? FilterQuality.low,
        cacheWidth: controller.cacheWidth,
        cacheHeight: controller.cacheHeight,
      );
    } else {
      //
      widget = Placeholder(
        fallbackWidth: controller.width ?? 30,
        fallbackHeight: controller.height ?? 30,
      );
    }

    return widget;
  }
}

class ImageBoxController with ImageFieldsBoxMixin, InheritedWidgetBoxMixin {
  ImageBoxController({
    Key? key,
    ImageProvider? image,
    AssetBundle? bundle,
    Uint8List? bytes,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    FilterQuality? filterQuality,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    ImageRepeat? repeat,
    Rect? centerSlice,
    bool? matchTextDirection,
    bool? gaplessPlayback,
    String? semanticLabel,
    bool? excludeFromSemantics,
    bool? isAntiAlias,
    String? package,
    Map<String, String>? headers,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    this.image = image;
    this.frameBuilder = frameBuilder;
    this.loadingBuilder = loadingBuilder;
    this.errorBuilder = errorBuilder;
    this.semanticLabel = semanticLabel;
    this.excludeFromSemantics = excludeFromSemantics;
    this.width = width;
    this.height = height;
    this.color = color;
    this.opacity = opacity;
    this.colorBlendMode = colorBlendMode;
    this.fit = fit;
    this.alignment = alignment;
    this.repeat = repeat;
    this.centerSlice = centerSlice;
    this.matchTextDirection = matchTextDirection;
    this.gaplessPlayback = gaplessPlayback;
    this.isAntiAlias = isAntiAlias;
    this.filterQuality = filterQuality;
  }
}
