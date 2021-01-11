import 'package:flutter/widgets.dart';
import 'package:flutter_async_builder/builder/simple_stream_builder.dart';
import 'package:flutter_async_builder/flutter_async_builder.dart';
import 'package:reactive_preferences/provider/pref_provider.dart';
import 'package:reactive_preferences/reactive_preferences.dart';

class PreferenceBuilder<T> extends StatelessWidget {
  final String prefKey;
  final T defaultValue;
  final DataBuilder<T> builder;
  final ErrorBuilder error;
  final WidgetBuilder loading;

  const PreferenceBuilder({
    Key key,
    @required this.prefKey,
    @required this.defaultValue,
    @required this.builder,
    this.error,
    this.loading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleStreamBuilder<T>(
      stream: PreferenceProvider.of(context).get(
        prefKey,
        defaultValue,
      ),
      builder: builder,
      error: error,
      loading: loading,
    );
  }
}

class PreferenceMultiBuilder<T> extends StatelessWidget {
  final List<String> prefKeys;
  final List<T> defaultValues;
  final DataBuilder<List<T>> builder;
  final ErrorBuilder error;
  final WidgetBuilder loading;

  const PreferenceMultiBuilder({
    Key key,
    @required this.prefKeys,
    @required this.defaultValues,
    @required this.builder,
    this.error,
    this.loading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleStreamListBuilder<T>(
      stream: PreferenceProvider.of(context).getMultiple(
        prefKeys,
        defaultValues,
      ),
      builder: builder,
      error: error,
      loading: loading,
    );
  }
}

class AnimatedPreferenceBuilder<T> extends StatelessWidget {
  final String prefKey;
  final T defaultValue;
  final DataBuilder<T> builder;
  final ErrorBuilder error;
  final WidgetBuilder loading;
  final Duration duration;
  final Duration reverseDuration;
  final Curve switchInCurve;
  final Curve switchOutCurve;
  final AnimatedSwitcherTransitionBuilder transitionBuilder;
  final AnimatedSwitcherLayoutBuilder layoutBuilder;

  const AnimatedPreferenceBuilder({
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
    return AnimatedStreamBuilder<T>(
      stream: PreferenceProvider.of(context).get(
        prefKey,
        defaultValue,
      ),
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

class AnimatedPreferenceMultiBuilder<T> extends StatelessWidget {
  final List<String> prefKeys;
  final List<T> defaultValues;
  final DataBuilder<List<T>> builder;
  final ErrorBuilder error;
  final WidgetBuilder loading;
  final Duration duration;
  final Duration reverseDuration;
  final Curve switchInCurve;
  final Curve switchOutCurve;
  final AnimatedSwitcherTransitionBuilder transitionBuilder;
  final AnimatedSwitcherLayoutBuilder layoutBuilder;

  const AnimatedPreferenceMultiBuilder({
    Key key,
    @required this.prefKeys,
    @required this.defaultValues,
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
    return AnimatedStreamListBuilder<T>(
      stream: PreferenceProvider.of(context).getMultiple(
        prefKeys,
        defaultValues,
      ),
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
