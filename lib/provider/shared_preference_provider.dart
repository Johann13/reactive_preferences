import 'package:flutter/widgets.dart';
import 'package:flutter_async_builder/flutter_async_builder.dart';
import 'package:reactive_preferences/provider/pref_provider.dart';
import 'package:reactive_preferences/reactive_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceProvider extends StatelessWidget {
  final WidgetBuilder builder;
  final WidgetBuilder? loading;
  final ErrorBuilder? error;

  const SharedPreferenceProvider({
    Key? key,
    required this.builder,
    this.loading,
    this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleFutureBuilder<SharedPreferencePref>(
      future: SharedPreferences.getInstance().then(
        (value) => SharedPreferencePref(value),
      ),
      loading: loading,
      error: error,
      builder: (context, pref) {
        return PreferenceProvider<SharedPreferencePref?>(
          pref: pref,
          child: Builder(builder: (context) {
            return builder(context);
          }),
        );
      },
    );
  }

  static SharedPreferencePref of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<
            PreferenceProvider<SharedPreferencePref>>()!
        .pref;
  }
}
