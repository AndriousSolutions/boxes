//
// Copyright 2023 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//

import '../_example_imports.dart';

import 'package:boxes/boxes.dart';

class ScaffoldController with ScaffoldFieldsBoxMixin, InheritedWidgetBoxMixin {
  factory ScaffoldController() => _this ??= ScaffoldController._();
  static ScaffoldController? _this;
  ScaffoldController._() {
    //
    _propertyText = TextDescription();
  }
  late TextDescription _propertyText;

  bool onCount(int? count) {
    // Always test parameters
    if (count == null) return false;

    if (count > 54) {
      appBar = null;
      _propertyText.description = "";
      notifyBoxes();
      return true;
    }

    if (count > 53) {
      appBar = null;
      _propertyText.description = "Remove appBar property";
      notifyBoxes();
      return true;
    }

    if (count > 52) {
      floatingActionButtonLocation = FloatingActionButtonLocation.endFloat;
      _propertyText.description = "Button Location: endFloat";
      notifyBoxes();
      return true;
    }

    if (count > 51) {
      floatingActionButtonLocation = FloatingActionButtonLocation.endTop;
      _propertyText.description = "Button Location: endTop";
      notifyBoxes();
      return true;
    }

    if (count > 50) {
      floatingActionButtonLocation = FloatingActionButtonLocation.centerTop;
      _propertyText.description = "Button Location: centerTop";
      notifyBoxes();
      return true;
    }

    if (count > 49) {
      floatingActionButtonLocation = FloatingActionButtonLocation.startTop;
      _propertyText.description = "Button Location: startTop";
      notifyBoxes();
      return true;
    }

    if (count > 48) {
      floatingActionButtonLocation = FloatingActionButtonLocation.startFloat;
      _propertyText.description = "Button Location: startFloat";
      notifyBoxes();
      return true;
    }

    if (count > 47) {
      floatingActionButtonLocation = FloatingActionButtonLocation.centerFloat;
      _propertyText.description = "Button Location: centerFloat";
      notifyBoxes();
      return true;
    }

    if (count > 46) {
      persistentFooterButtons = null;
      _propertyText.description = "";
      notifyBoxes();
      return true;
    }

    if (count > 45) {
      persistentFooterButtons = [
        IconButton(icon: const Icon(Icons.insert_emoticon), onPressed: () {}),
        IconButton(icon: const Icon(Icons.mood), onPressed: () {}),
        IconButton(icon: const Icon(Icons.mood_bad), onPressed: () {}),
        IconButton(
            icon: const Icon(Icons.sentiment_dissatisfied), onPressed: () {}),
        IconButton(icon: const Icon(Icons.sentiment_neutral), onPressed: () {}),
        IconButton(
            icon: const Icon(Icons.sentiment_satisfied), onPressed: () {}),
        IconButton(
            icon: const Icon(Icons.sentiment_very_dissatisfied),
            onPressed: () {}),
      ];
      _propertyText.description = "persistentFooterButtons";
      notifyBoxes();
      return true;
    }

    if (count > 44) {
      endDrawer = null;
      _propertyText.description = "";
      notifyBoxes();
      return true;
    }

    if (count > 43) {
      endDrawer = drawer;
      _propertyText.description = "endDrawer";
      notifyBoxes();
      return true;
    }

    if (count > 42) {
      backgroundColor = null;
      _propertyText.description = "";
      notifyBoxes();
      return true;
    }

    if (count > 41) {
      backgroundColor = Colors.greenAccent;
      _propertyText.description = "Scaffold's backgroundColor";
      notifyBoxes();
      return true;
    }

    if (count > 40) {
      bottomSheet = null;
      _propertyText.description = "";
      notifyBoxes();
      return true;
    }

    if (count > 39) {
      bottomSheet = Container(
        decoration:
            BoxDecoration(border: Border.all(width: 1, color: Colors.red)),
        height: 30,
        child: const Center(child: Text('bottomSheet')),
      );
      _propertyText.description = "Scaffold's bottomSheet";
      notifyBoxes();
      return true;
    }

    if (count > 38) {
      bottomNavigationBar = null;
      _propertyText.description = "";
      notifyBoxes();
      return true;
    }

    if (count > 37) {
      _propertyText.description = "bottomNavigationBar";
      bottomNavigationBar = BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
      );
      notifyBoxes();
      return true;
    }

    if (count > 36) {
      primary = null;
      _propertyText.description = "";
      notifyBoxes();
      return true;
    }

    ///
    if (count > 35) {
      primary = true;
      _propertyText.description = "Scaffold's primary";
      notifyBoxes();
      return true;
    }

    return false;
  }
}
