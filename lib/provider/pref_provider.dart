// You have generated a new plugin project without
// specifying the `--platforms` flag. A plugin project supports no platforms is generated.
// To add platforms, run `flutter create -t plugin --platforms <platforms> .` under the same
// directory. You can also find a detailed instruction on how to add platforms in the `pubspec.yaml` at https://flutter.dev/docs/development/packages-and-plugins/developing-packages#plugin-platforms.

import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_async_builder/builder/builder_functions.dart';
import 'package:reactive_preferences/prefs/pref.dart';

class PreferenceProvider<T extends Pref> extends StatelessWidget {
  final Future<T> pref;
  final WidgetBuilder loading;
  final ErrorBuilder error;
  final WidgetBuilder builder;

  const PreferenceProvider({
    Key key,
    this.pref,
    this.loading,
    this.error,
    @required this.builder,
  }) : super(key: key);

  static Pref of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_P>().state.pref;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Pref>(
      future: pref,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          if (error == null) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          }
          return error(context, snapshot.error);
        } else if (!snapshot.hasData) {
          if (loading == null) {
            return Container();
          }
          return loading(context);
        } else {
          return _PrefWidget(
            pref: snapshot.data,
            child: builder(context),
          );
        }
      },
    );
  }
}

class _PrefWidget extends StatefulWidget {
  final Pref pref;
  final Widget child;

  const _PrefWidget({
    Key key,
    @required this.child,
    @required this.pref,
  }) : super(key: key);

  @override
  __PrefWidgetState createState() => __PrefWidgetState();
}

class __PrefWidgetState extends State<_PrefWidget> {
  Pref get pref => widget.pref;

  @override
  Widget build(BuildContext context) {
    return _P(
      child: widget.child,
      state: this,
    );
  }

  @override
  void dispose() {
    widget.pref.dispose();
    super.dispose();
  }
}

class _P extends InheritedWidget {
  final __PrefWidgetState state;

  const _P({
    Key key,
    @required Widget child,
    @required this.state,
  })  : assert(child != null),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(_P old) {
    return true;
  }
}
