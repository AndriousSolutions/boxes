//
// Copyright 2023 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//

import 'package:boxes/switch_box.dart';
import 'package:boxes/slider_box.dart';
import 'package:example/_example_imports.dart';

///
class AppDrawer {
  factory AppDrawer() => _this ??= AppDrawer._();
  static AppDrawer? _this;
  AppDrawer._() {
    appBarController = AppBarController();
  }
  late AppBarController appBarController;

  ///
  Widget get drawer => Drawer(
        child: ListView(
          children: <Widget>[
            _leading,
            _title,
            _actions,
            _flexibleSpace,
            _bottom,
            _elevation,
            _shadowColor,
            _shape,
            _backgroundColor,
            _primary,
            _centerTitle,
            _titleSpacing,
            _toolbarOpacity,
            _bottomOpacity,
            _toolbarHeight,
            _leadingWidth,
          ],
        ),
      );

  Widget get _leading => switchFunc('leading', false, (v) {
        if (v) {
          appBarController.leading = IconButton(
            icon: const Icon(Icons.local_pizza_outlined),
            // This is the actual code to open your drawer by the way.
            onPressed: () => Scaffold.of(appBarController.context).openDrawer(),
            tooltip: MaterialLocalizations.of(appBarController.context)
                .openAppDrawerTooltip,
          );
        } else {
          appBarController.leading = null;
        }
      });

  Widget get _title => switchFunc('title', true, (v) {
        //
        if (v) {
          appBarController.title = null;
        } else {
          appBarController.title = const SizedBox();
        }
      });

  Widget get _actions => switchFunc('actions', false, (v) {
        //
        if (v) {
          appBarController.actions = [
            const Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(
                Icons.search,
                size: 26,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(
                Icons.linear_scale_outlined,
                size: 26,
              ),
            ),
          ];
        } else {
          appBarController.actions = null;
        }
      });

  Widget get _flexibleSpace => switchFunc('flexibleSpace', false, (v) {
        //
        if (v) {
          appBarController.flexibleSpace = const Center(
            child: Text(
              'This is behind the Title',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        } else {
          appBarController.flexibleSpace = null;
        }
      });

  Widget get _bottom => switchFunc('bottom', false, (v) {
        //
        if (v) {
          appBarController.bottom = PreferredSize(
            preferredSize: const Size.fromHeight(4),
            child: Container(
              color: Colors.orange,
              height: 16,
            ),
          );
        } else {
          appBarController.bottom = null;
        }
      });

  Widget get _elevation => sliderFunc('elevation', 4, (v) {
        if (v > 0) {
          appBarController.elevation = v;
        } else {
          appBarController.elevation = null;
        }
        return v;
      });

  Widget get _shadowColor => switchFunc('shadowColor', false, (v) {
        if (v) {
          appBarController.shadowColor = Colors.deepOrange;
        } else {
          appBarController.shadowColor = null;
        }
      });

  Widget get _shape => switchFunc('shape', false, (v) {
        // shape
        if (v) {
          appBarController.shape = const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          );
        } else {
          appBarController.shape = null;
        }
      });

  Widget get _backgroundColor => switchFunc('backgroundColor', false, (v) {
        if (v) {
          appBarController.backgroundColor = Colors.greenAccent;
        } else {
          appBarController.backgroundColor = null;
        }
      });

  Widget get _primary =>
      switchFunc('primary', true, (v) => appBarController.primary = v);

  Widget get _centerTitle =>
      switchFunc('centerTitle', true, (v) => appBarController.centerTitle = v);

  Widget get _titleSpacing => sliderFunc(
        'titleSpacing',
        16,
        (v) => appBarController.titleSpacing = v,
        min: 0,
        max: 24,
        divisions: 5,
      );

  Widget get _toolbarOpacity => sliderFunc(
        'toolbarOpacity',
        1,
        (v) => appBarController.toolbarOpacity = v,
        min: 0,
        max: 1,
        divisions: 5,
      );

  Widget get _bottomOpacity => sliderFunc(
        'bottomOpacity',
        1,
        (v) => appBarController.bottomOpacity = v,
        min: 0,
        max: 1,
        divisions: 5,
      );

  Widget get _toolbarHeight => sliderFunc(
        'toolbarHeight',
        56,
        (v) => appBarController.toolbarHeight = v,
        min: 56,
        max: 106,
        divisions: 8,
        round: true,
      );

  Widget get _leadingWidth => sliderFunc(
        'leadingWidth',
        56,
        (v) => appBarController.leadingWidth = v,
        min: 56,
        max: 106,
        divisions: 8,
        round: true,
      );

  // ignore: avoid_positional_boolean_parameters
  Widget switchFunc(String title, bool value, void Function(bool v) func) =>
      SwitchBox(
        controller: SwitchBoxController(
          title: Text(title),
          value: value,
          onChanged: (v) {
            func(v);
            appBarController
                .notifyBoxes(); // Rebuilds just the AppBar in this app.
          },
        ),
      );

  Widget sliderFunc(
    String title,
    double value,
    double Function(double v) func, {
    double min = 4.0,
    double max = 16.0,
    int divisions = 2,
    bool round = false,
  }) =>
      SliderBox(
        controller: SliderBoxController(
          title: title,
          min: min,
          max: max,
          divisions: divisions,
          round: round,
        ),
        value: value,
        onChanged: (v) {
          func(v);
          appBarController
              .notifyBoxes(); // Rebuilds just the AppBar in this app.
        },
      );
}
