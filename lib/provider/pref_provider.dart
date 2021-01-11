// You have generated a new plugin project without
// specifying the `--platforms` flag. A plugin project supports no platforms is generated.
// To add platforms, run `flutter create -t plugin --platforms <platforms> .` under the same
// directory. You can also find a detailed instruction on how to add platforms in the `pubspec.yaml` at https://flutter.dev/docs/development/packages-and-plugins/developing-packages#plugin-platforms.

import 'package:flutter/widgets.dart';
import 'package:reactive_preferences/prefs/pref.dart';

class PreferenceProvider<T extends Pref> extends InheritedWidget {
  final T pref;

  const PreferenceProvider({
    Key key,
    @required Widget child,
    @required this.pref,
  })  : assert(child != null),
        super(key: key, child: child);

  static Pref of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<PreferenceProvider>()
        .pref;
  }

  @override
  bool updateShouldNotify(PreferenceProvider old) {
    return false;
  }
}
