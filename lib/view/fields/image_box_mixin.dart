library boxes;

//
// Copyright 2023 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//

import 'dart:io' show File;

import 'package:flutter/foundation.dart' show Uint8List;

import 'package:flutter/material.dart';

mixin ImageFieldsBoxMixin {
  late BuildContext context;
  Key? key;
  ImageProvider? image;
  String? src;
  File? file;
  String? name;
  AssetBundle? bundle;
  Uint8List? bytes;
  ImageFrameBuilder? frameBuilder;
  ImageLoadingBuilder? loadingBuilder;
  ImageErrorWidgetBuilder? errorBuilder;
  double? scale;
  double? width;
  double? height;
  Color? color;
  Animation<double>? opacity;
  FilterQuality? filterQuality;
  BlendMode? colorBlendMode;
  BoxFit? fit;
  AlignmentGeometry? alignment;
  ImageRepeat? repeat;
  Rect? centerSlice;
  bool? matchTextDirection;
  bool? gaplessPlayback;
  String? semanticLabel;
  bool? excludeFromSemantics;
  bool? isAntiAlias;
  String? package;
  Map<String, String>? headers;
  int? cacheWidth;
  int? cacheHeight;
}
