import 'package:flutter/widgets.dart';
import 'package:flutter_async_builder/builder/builder_functions.dart';
import 'package:reactive_preferences/prefs/shared_preference_prefs_impl.dart';
import 'package:reactive_preferences/reactive_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceProvider extends StatelessWidget {
  final WidgetBuilder loading;
  final ErrorBuilder error;
  final WidgetBuilder builder;

  const SharedPreferenceProvider({
    Key key,
    this.loading,
    this.error,
    this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferenceProvider<SharedPreferencePref>(
      pref: SharedPreferences.getInstance().then(
        (value) {
          return SharedPreferencePref(value);
        },
      ),
      builder: builder,
      loading: loading,
      error: error,
    );
  }
}
