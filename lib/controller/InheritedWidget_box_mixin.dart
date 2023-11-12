library boxes;

//
// Copyright 2023 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//

import 'dart:collection';

import 'package:flutter/cupertino.dart';

import 'package:boxes/view/inherited_widget_box.dart';

mixin InheritedWidgetBoxMixin {
  //
  ///  Set a widget through its context as a dependent of an InheritedWidget
  ///  Return false if not configured to use an InheritedWidget
  bool dependOnInheritedWidget(BuildContext? context) {
    var dependOn = context != null;
    // Don't bother if already a dependency
//    if (dependOn && !_dependencies.contains(context)) {
    if (dependOn) {
      // Look up the widget tree for the first box InheritedWidget
      final element =
          context.getElementForInheritedWidgetOfExactType<InheritedWidgetBox>();
      if (element == null) {
        _newDependencies.add(context);
      } else {
        context.dependOnInheritedElement(element);
//        _dependencies.add(context);
      }
    }
    return dependOn;
  }

  // Collect any 'widgets' depending on this State object's InheritedWidget.
  final Set<BuildContext> _newDependencies = {};
// todo: getElementForInheritedWidgetOfExactType is expensive but acceptable
// todo: Don't collect dependencies for now.
//  final Set<BuildContext> _dependencies = HashSet<BuildContext>();

  @mustCallSuper
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    //
    bool shouldUpdate = false;

    /// At least one of the dependencies was notified.
    for (final state in _inheritedStates.values) {
      //
      if (state.notified) {
        shouldUpdate = true;
        state.notified = false;
        break;
      }
    }
    return shouldUpdate;
  }

  /// Create an InheritedWidget supplying a Widget's Key as id.
  Widget inheritedWidget({Key? keyId, required Widget child}) =>
      InheritedBoxWidget(
        keyId: keyId,
        controller: this,
        child: child,
      );

  final _inheritedKeys = HashMap<Key, int>();
  final _inheritedStates = HashMap<int, InheritedBoxWidgetState>();

  /// Add the 'Inherited' State object to the Controller's collection
  void initState(InheritedBoxWidgetState state) {
    final hash = state.hashCode;
    _inheritedStates.addAll({hash: state});
    final key = state.widget.keyId;
    // The user needs to be using unique keys. Ignore if already contained.
    if (key != null && !_inheritedKeys.containsKey(key)) {
      _inheritedKeys.addAll({key: hash});
    }
  }

  /// Call in the 'Inherited' State object's dispose() function
  void dispose(InheritedBoxWidgetState state) {
//    _dependencies.clear();
    final hash = state.hashCode;
    _inheritedStates.remove(hash);
    for (final entry in _inheritedKeys.entries) {
      if (entry.value == hash) {
        _inheritedKeys.remove(entry.key);
        break;
      }
    }
  }

  /// Assign any box widgets that are 'below' the InhertiedWidget in the Widget tree.
  InheritedElement? createElement(InheritedElement? element) {
    //
    if (element != null) {
      //
      if (_newDependencies.isNotEmpty) {
        for (final context in _newDependencies.toList(growable: false)) {
          context.dependOnInheritedElement(element);
//          _dependencies.add(context);
        }
        _newDependencies.clear();
      }
    }
    return element;
  }

  /// Notify by the box Widget's key or by another type (to be later determined).
  bool notifyClient(Object? object) {
    InheritedBoxWidgetState? state;
    var notify = object != null;
    if (notify) {
      notify = object is Key;
      if (notify) {
        final hash = _inheritedKeys[object];
        if (hash != null) {
          state = _inheritedStates[hash];
        }
        notify = state != null;
        if (notify) {
          notify = state.mounted;
          if (notify) {
            state.notified = true;
            //ignore: INVALID_USE_OF_PROTECTED_MEMBER
            state.setState(() {});
          }
        }
      }
    }
    return notify;
  }

  /// Notify all the controller's dependent box widgets
  void notifyClients() {
    for (final state in _inheritedStates.values) {
      if (state.mounted) {
        state.notified = true;
        //ignore: INVALID_USE_OF_PROTECTED_MEMBER
        state.setState(() {});
      }
    }
  }

  /// Best to clear dependencies from time to time
  //todo: Where to call this?
  Future<void> _clearClients() async {
    // toList(growable: false) prevents concurrent error
    for (final context in _newDependencies.toList(growable: false)) {
      if (!context.mounted) {
        _newDependencies.remove(context);
      }
    }
  }
}

// Widget makeWidgetBox({
//   Key? keyId,
//   bool? stateful,
//   Object? controller,
//   Widget? child,
//   WidgetBuilder? builder,
// }) {
//   Widget widget;
//   assert(child != null || builder != null, "Must provide a 'child' widget");
//   assert(
//       (child != null && builder == null) || (child == null && builder != null),
//       "Must provide only one not both: child or builder");
//   if (child == null && builder == null) {
//     widget = const SizedBox();
//   } else if (builder != null &&
//       stateful != null &&
//       stateful &&
//       controller != null) {
//     widget = makeStatefulInheritedWidgetBox(
//         keyId: keyId, controller: controller, builder: builder);
//   } else {
//     widget = makeInheritedWidgetBox(
//         keyId: keyId, controller: controller, child: child!);
//   }
//   return widget;
// }

/// Insert an InheritedWidget to the Widget tree if a controller is provided
Widget makeInheritedWidgetBox({
  Key? keyId,
  Object? controller,
  required Widget child,
}) {
  Widget widget;
  //  Supply the Widget's Key if any as id.
  if (controller == null || controller is! InheritedWidgetBoxMixin) {
    widget = child;
  } else {
    //
    widget = controller.inheritedWidget(keyId: keyId, child: child);
  }
  return widget;
}

/// Insert an InheritedWidget to the Widget tree if a controller is provided
/// wrapped in a StatefulWidget
Widget makeStatefulInheritedWidgetBox({
  Key? keyId,
  required Object controller,
  required WidgetBuilder builder,
}) {
  return _StatefulBoxWrapper(
    key: PrivateBoxGlobalKey(controller),
    keyId: keyId,
    controller: controller,
    builder: builder,
  );
}

/// Supply a GlobalKey so Wrapper's State object is created ever only once.
class PrivateBoxGlobalKey extends GlobalObjectKey {
  const PrivateBoxGlobalKey(super.value);
}

class _StatefulBoxWrapper extends StatefulWidget {
  const _StatefulBoxWrapper({
    super.key,
    this.keyId,
    required this.controller,
    required this.builder,
  });
  final Key? keyId;
  final Object controller;
  final WidgetBuilder builder;
  @override
  State<StatefulWidget> createState() => _StatefulBoxWrapperState();
}

class _StatefulBoxWrapperState extends State<_StatefulBoxWrapper> {
  @override
  void initState() {
    super.initState();

    child = widget.builder(context);

    final controller = widget.controller;

    if (controller is InheritedWidgetBoxMixin) {
      child = controller.inheritedWidget(keyId: widget.keyId, child: child);
    }
  }

  late Widget child;

  @override
  Widget build(BuildContext context) => child;
}
