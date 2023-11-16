library boxes;

//
// Copyright 2023 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//
import 'package:boxes/view/state_box.dart';

mixin ControllerBoxMixin<T> {
  /// The current value
  T? boxValue;

  /// Supply the associated State object
  StateBox<T, StatefulWidgetBox<T>>? boxState;

  // /// Signature for callbacks that report that an underlying value has changed.
  // void onChanged(T? value) {}
  //
  // /// Called when the dropdown button is tapped.
  // void onTap() {}
}

class ControllerBox<T> with ControllerBoxMixin<T> {}
