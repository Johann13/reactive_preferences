import 'package:flutter/widgets.dart';
import 'package:flutter_async_builder/builder/builder_functions.dart';
import 'package:flutter_async_builder/builder/simple_stream_builder.dart';
import 'package:reactive_preferences/pref_provider.dart';

class PreferenceBuilderBool extends StatelessWidget {
  final String prefKey;
  final bool defaultValue;
  final DataBuilder<bool> builder;
  final ErrorBuilder error;
  final WidgetBuilder loading;

  const PreferenceBuilderBool({
    Key key,
    @required this.prefKey,
    @required this.defaultValue,
    @required this.builder,
    this.error,
    this.loading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleStreamBuilder<bool>(
      stream: PreferenceProvider.of(context).getBool(prefKey, defaultValue),
      builder: builder,
      error: error,
      loading: loading,
    );
  }
}

class PreferenceBuilderInt extends StatelessWidget {
  final String prefKey;
  final int defaultValue;
  final DataBuilder<int> builder;
  final ErrorBuilder error;
  final WidgetBuilder loading;

  const PreferenceBuilderInt({
    Key key,
    @required this.prefKey,
    @required this.defaultValue,
    @required this.builder,
    this.error,
    this.loading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleStreamBuilder<int>(
      stream: PreferenceProvider.of(context).getInt(prefKey, defaultValue),
      builder: builder,
      error: error,
      loading: loading,
    );
  }
}

class PreferenceBuilderDouble extends StatelessWidget {
  final String prefKey;
  final double defaultValue;
  final DataBuilder<double> builder;
  final ErrorBuilder error;
  final WidgetBuilder loading;

  const PreferenceBuilderDouble({
    Key key,
    @required this.prefKey,
    @required this.defaultValue,
    @required this.builder,
    this.error,
    this.loading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleStreamBuilder<double>(
      stream: PreferenceProvider.of(context).getDouble(prefKey, defaultValue),
      builder: builder,
      error: error,
      loading: loading,
    );
  }
}

class PreferenceBuilderString extends StatelessWidget {
  final String prefKey;
  final String defaultValue;
  final DataBuilder<String> builder;
  final ErrorBuilder error;
  final WidgetBuilder loading;

  const PreferenceBuilderString({
    Key key,
    @required this.prefKey,
    @required this.defaultValue,
    @required this.builder,
    this.error,
    this.loading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleStreamBuilder<String>(
      stream: PreferenceProvider.of(context).getString(prefKey, defaultValue),
      builder: builder,
      error: error,
      loading: loading,
    );
  }
}

class PreferenceBuilderList extends StatelessWidget {
  final String prefKey;
  final List<String> defaultValue;
  final DataBuilder<List<String>> builder;
  final ErrorBuilder error;
  final WidgetBuilder loading;

  const PreferenceBuilderList({
    Key key,
    @required this.prefKey,
    @required this.defaultValue,
    @required this.builder,
    this.error,
    this.loading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleStreamBuilder<List<String>>(
      stream: PreferenceProvider.of(context).getList(prefKey, defaultValue),
      builder: builder,
      error: error,
      loading: loading,
    );
  }
}

class AnimatedPreferenceBuilderBool extends StatelessWidget {
  final String prefKey;
  final bool defaultValue;
  final DataBuilder<bool> builder;
  final ErrorBuilder error;
  final WidgetBuilder loading;
  final Duration duration;
  final Duration reverseDuration;
  final Curve switchInCurve;
  final Curve switchOutCurve;
  final AnimatedSwitcherTransitionBuilder transitionBuilder;
  final AnimatedSwitcherLayoutBuilder layoutBuilder;

  const AnimatedPreferenceBuilderBool({
    Key key,
    @required this.prefKey,
    @required this.defaultValue,
    @required this.builder,
    this.error,
    this.loading,
    this.duration = const Duration(milliseconds: 300),
    this.reverseDuration,
    this.switchInCurve = Curves.linear,
    this.switchOutCurve = Curves.linear,
    this.transitionBuilder = AnimatedSwitcher.defaultTransitionBuilder,
    this.layoutBuilder = AnimatedSwitcher.defaultLayoutBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedStreamBuilder<bool>(
      stream: PreferenceProvider.of(context).getBool(prefKey, defaultValue),
      builder: builder,
      error: error,
      loading: loading,
      duration: duration,
      reverseDuration: reverseDuration,
      switchInCurve: switchInCurve,
      switchOutCurve: switchOutCurve,
      transitionBuilder: transitionBuilder,
      layoutBuilder: layoutBuilder,
    );
  }
}

class AnimatedPreferenceBuilderInt extends StatelessWidget {
  final String prefKey;
  final int defaultValue;
  final DataBuilder<int> builder;
  final ErrorBuilder error;
  final WidgetBuilder loading;
  final Duration duration;
  final Duration reverseDuration;
  final Curve switchInCurve;
  final Curve switchOutCurve;
  final AnimatedSwitcherTransitionBuilder transitionBuilder;
  final AnimatedSwitcherLayoutBuilder layoutBuilder;

  const AnimatedPreferenceBuilderInt({
    Key key,
    @required this.prefKey,
    @required this.defaultValue,
    @required this.builder,
    this.error,
    this.loading,
    this.duration = const Duration(milliseconds: 300),
    this.reverseDuration,
    this.switchInCurve = Curves.linear,
    this.switchOutCurve = Curves.linear,
    this.transitionBuilder = AnimatedSwitcher.defaultTransitionBuilder,
    this.layoutBuilder = AnimatedSwitcher.defaultLayoutBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedStreamBuilder<int>(
      stream: PreferenceProvider.of(context).getInt(prefKey, defaultValue),
      builder: builder,
      error: error,
      loading: loading,
      duration: duration,
      reverseDuration: reverseDuration,
      switchInCurve: switchInCurve,
      switchOutCurve: switchOutCurve,
      transitionBuilder: transitionBuilder,
      layoutBuilder: layoutBuilder,
    );
  }
}

class AnimatedPreferenceBuilderDouble extends StatelessWidget {
  final String prefKey;
  final double defaultValue;
  final DataBuilder<double> builder;
  final ErrorBuilder error;
  final WidgetBuilder loading;
  final Duration duration;
  final Duration reverseDuration;
  final Curve switchInCurve;
  final Curve switchOutCurve;
  final AnimatedSwitcherTransitionBuilder transitionBuilder;
  final AnimatedSwitcherLayoutBuilder layoutBuilder;

  const AnimatedPreferenceBuilderDouble({
    Key key,
    @required this.prefKey,
    @required this.defaultValue,
    @required this.builder,
    this.error,
    this.loading,
    this.duration = const Duration(milliseconds: 300),
    this.reverseDuration,
    this.switchInCurve = Curves.linear,
    this.switchOutCurve = Curves.linear,
    this.transitionBuilder = AnimatedSwitcher.defaultTransitionBuilder,
    this.layoutBuilder = AnimatedSwitcher.defaultLayoutBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedStreamBuilder<double>(
      stream: PreferenceProvider.of(context).getDouble(prefKey, defaultValue),
      builder: builder,
      error: error,
      loading: loading,
      duration: duration,
      reverseDuration: reverseDuration,
      switchInCurve: switchInCurve,
      switchOutCurve: switchOutCurve,
      transitionBuilder: transitionBuilder,
      layoutBuilder: layoutBuilder,
    );
  }
}

class AnimatedPreferenceBuilderString extends StatelessWidget {
  final String prefKey;
  final String defaultValue;
  final DataBuilder<String> builder;
  final ErrorBuilder error;
  final WidgetBuilder loading;
  final Duration duration;
  final Duration reverseDuration;
  final Curve switchInCurve;
  final Curve switchOutCurve;
  final AnimatedSwitcherTransitionBuilder transitionBuilder;
  final AnimatedSwitcherLayoutBuilder layoutBuilder;

  const AnimatedPreferenceBuilderString({
    Key key,
    @required this.prefKey,
    @required this.defaultValue,
    @required this.builder,
    this.error,
    this.loading,
    this.duration = const Duration(milliseconds: 300),
    this.reverseDuration,
    this.switchInCurve = Curves.linear,
    this.switchOutCurve = Curves.linear,
    this.transitionBuilder = AnimatedSwitcher.defaultTransitionBuilder,
    this.layoutBuilder = AnimatedSwitcher.defaultLayoutBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedStreamBuilder<String>(
      stream: PreferenceProvider.of(context).getString(prefKey, defaultValue),
      builder: builder,
      error: error,
      loading: loading,
      duration: duration,
      reverseDuration: reverseDuration,
      switchInCurve: switchInCurve,
      switchOutCurve: switchOutCurve,
      transitionBuilder: transitionBuilder,
      layoutBuilder: layoutBuilder,
    );
  }
}

class AnimatedPreferenceBuilderList extends StatelessWidget {
  final String prefKey;
  final List<String> defaultValue;
  final DataBuilder<List<String>> builder;
  final ErrorBuilder error;
  final WidgetBuilder loading;
  final Duration duration;
  final Duration reverseDuration;
  final Curve switchInCurve;
  final Curve switchOutCurve;
  final AnimatedSwitcherTransitionBuilder transitionBuilder;
  final AnimatedSwitcherLayoutBuilder layoutBuilder;

  const AnimatedPreferenceBuilderList({
    Key key,
    @required this.prefKey,
    @required this.defaultValue,
    @required this.builder,
    this.error,
    this.loading,
    this.duration = const Duration(milliseconds: 300),
    this.reverseDuration,
    this.switchInCurve = Curves.linear,
    this.switchOutCurve = Curves.linear,
    this.transitionBuilder = AnimatedSwitcher.defaultTransitionBuilder,
    this.layoutBuilder = AnimatedSwitcher.defaultLayoutBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedStreamBuilder<List<String>>(
      stream: PreferenceProvider.of(context).getList(prefKey, defaultValue),
      builder: builder,
      error: error,
      loading: loading,
      duration: duration,
      reverseDuration: reverseDuration,
      switchInCurve: switchInCurve,
      switchOutCurve: switchOutCurve,
      transitionBuilder: transitionBuilder,
      layoutBuilder: layoutBuilder,
    );
  }
}
