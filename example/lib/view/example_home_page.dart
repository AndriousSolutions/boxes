//
// Copyright 2023 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//

import '../_example_app_imports.dart';

import 'package:boxes/boxes.dart';

///
class HomePage extends StatefulWidget {
  ///
  const HomePage({
    super.key,
    required this.title,
    this.process,
  });
  final String title;
  final String? process;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //
  @override
  void initState() {
    super.initState();

    /// This separate class is concerned with the 'business end' of this app.
    /// At this location, you have no idea what that is---and that's a good thing.
    logic = BusinessEnd();
  }

  late BusinessEnd logic;

  @override
  void dispose() {
    logic.dispose();
    super.dispose();
  }

  /// ScaffoldBox encloses the Scaffold widget, of course,
  /// but does supply the eight 'data source' properties (see. [ScaffoldBox]).
  /// However, all its properties are handled by its accompanying controller if any.
  /// Further, the controller takes precedence if it too has 'data source' properties defined.
  @override
  Widget build(BuildContext context) => ScaffoldBox(
        controller: ScaffoldController(),

        /// As of this writing, the only thing a developer can explicitly pass to
        /// the AppBar enclosed in the [AppBarBox] is the property, List<Widgets>? actions
        /// Even then, a controller's 'actions' takes precedence.
        /// The rest of the AppBar's 30 properties are dictated by
        /// the accompanying controller if any.
        /// For example, it's been decided to controller [AppBarController] will explicit take in a title.
        ///
        /// Note: All the Box widget also takes in a the Key property value, however, some don't use it on the
        /// widget it explicitly encloses. The enclosed widget instead will receive its key from
        /// (you guess it) the controller if any.
        ///
        appBar: AppBarBox(
          controller: AppBarController(
            title: Text(widget.title),
          ),
        ),
        body: CenterColumnBox(
          controller: CenterColumnController(),
          children: <Widget>[
//            logic.picture,
            logic.description,
            const Text(
              'You have pushed the button this many times:',
            ),
            TextBox(controller: logic),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: logic.onPressed,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      );
}
