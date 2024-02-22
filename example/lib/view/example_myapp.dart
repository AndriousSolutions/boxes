//
// Copyright 2023 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//

import '../_example_app_imports.dart';

import 'package:boxes/boxes.dart';

///
class MyApp extends StatelessWidget {
  ///
  const MyApp({super.key});

  /// MaterialApp widget replaced by its 'box' equivalent.
  @override
  Widget build(BuildContext context) => MaterialAppBox(
        /// The controller 'controls' the widget's many properties and most events.
        controller: MaterialAppController(),

        /// The only two regular properties available to you: home and routes.
        /// The other 39 properties are specified by the provided controller
        /// using its mixin, MaterialAppFieldsBoxMixin
        home: const HomePage(
          title: 'Flutter Demo Home Page',
        ),
      );
}
