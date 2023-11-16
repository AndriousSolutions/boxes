//
// Copyright 2023 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//

import 'package:example/_example_imports.dart';

// class BrightnessSetting {
//   factory BrightnessSetting(
//           Brightness brightness, void Function(Brightness v) func) =>
//       _this ??= BrightnessSetting._(brightness, func);
//   BrightnessSetting._(Brightness brightness, void Function(Brightness v) func) {
//     radio = GroupValue<Brightness>(brightness, func);
//   }
//   static BrightnessSetting? _this;
//
//   late GroupValue<Brightness> radio;
//
//   Column get radioButtons {
//     return Column(children: [
//       const Text('Brightness'),
//       Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           const Text('Light'),
//           Radio(
//             value: Brightness.light,
//             groupValue: radio.groupValue,
//             onChanged: (v) => radio.onChanged(v),
//           ),
//           const Text('Dark'),
//           Radio(
//             value: Brightness.dark,
//             groupValue: radio.groupValue,
//             onChanged: (v) => radio.onChanged(v),
//           ),
//         ],
//       ),
//     ]);
//   }
// }
