import 'package:flutter/widgets.dart';
import 'package:flutter_async_builder/flutter_async_builder.dart';
import 'package:reactive_preferences/provider/pref_provider.dart';
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
    return SimpleFutureBuilder<SharedPreferencePref>(
      future: SharedPreferences.getInstance().then(
        (value) => SharedPreferencePref(value),
      ),
      loading: loading,
      error: error,
      builder: (context, pref) {
        return PreferenceProvider<SharedPreferencePref>(
          pref: pref,
          child: Builder(builder: (context) {
            return builder(context);
          }),
        );
      },
    );
  }
}
