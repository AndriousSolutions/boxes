//
// Copyright 2023 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//

import 'dart:async';

import 'package:flutter/material.dart';

///
class TimerController {
  /// Only one instance of the class is required.
  TimerController({this.seconds, this.duration, this.callback});
  final int? seconds;
  final Duration? duration;
  final void Function()? callback;

  Timer? _timer;
  void Function()? onCallback;

  /// Stop the timer
  void dispose() {
    cancelTimer();
  }

  /// If WidgetsBindingObserver is implemented to note system events
  void didChangeAppLifecycleState(AppLifecycleState state) {
    //
    if (state != AppLifecycleState.resumed) {
      /// AppLifecycleState.paused (may enter the suspending state at any time)
      /// AppLifecycleState.inactive (may be paused at any time)
      /// AppLifecycleState.suspending (Android only)
      cancelTimer();
    } else {
      /// Create the Timer again.
      initTimer();
    }
  }

  bool _initTimer = false;

  /// Cancel the timer
  void cancelTimer() {
    _timer?.cancel();
    _initTimer = false;
  }

  /// Create a Timer to run periodically.
  void initTimer() {
    // Initialize once.
    if (_initTimer) {
      return;
    }

    _initTimer = true;

    Duration duration;

    /// Supply a 'default' duration if one is not provided.
    if (this.duration == null) {
      int seconds = 3;
      if (this.seconds != null && this.seconds! > seconds) {
        seconds = this.seconds!;
      }
      duration = Duration(seconds: seconds);
    } else {
      duration = const Duration(seconds: 3);
      if (this.duration! > duration) {
        duration = this.duration!;
      }
    }

    _timer = Timer.periodic(duration, (timer) {
      //
      cancelTimer();

      try {
        //
        onCallback?.call();

        callback?.call();

        initTimer();
      } catch (e) {
        // Don't initialize anymore.
        _initTimer = true;
      }
    });
  }
}
