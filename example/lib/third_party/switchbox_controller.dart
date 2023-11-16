import 'package:example/_example_imports.dart';
import 'package:boxes/switch_box.dart';

class SwitchBoxController with SwitchBoxMixin {
  SwitchBoxController({
    bool? value,
    Widget? title,
    ValueChanged<bool>? onChanged,
  }) {
    this.value = value;
    this.title = title;
    this.onChanged = onChanged;
  }
}
