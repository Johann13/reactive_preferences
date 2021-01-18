import 'package:flutter/widgets.dart';
import 'package:flutter_async_builder/builder/simple_stream_builder.dart';
import 'package:flutter_async_builder/flutter_async_builder.dart';
import 'package:reactive_preferences/reactive_preferences.dart';

class SharedPreferenceBuilder<T> extends StatelessWidget {
  final String prefKey;
  final T defaultValue;
  final DataBuilder<T> builder;
  final ErrorBuilder error;
  final WidgetBuilder loading;

  const SharedPreferenceBuilder({
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
      stream: SharedPreferenceProvider.of(context).get(
        prefKey,
        defaultValue,
      ),
      builder: builder,
      error: error,
      loading: loading,
    );
  }
}

class SharedPreferenceMultiBuilder<T> extends StatelessWidget {
  final List<String> prefKeys;
  final List<T> defaultValues;
  final DataBuilder<List<T>> builder;
  final ErrorBuilder error;
  final WidgetBuilder loading;

  const SharedPreferenceMultiBuilder({
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
      stream: SharedPreferenceProvider.of(context).getMultiple(
        prefKeys,
        defaultValues,
      ),
      builder: builder,
      error: error,
      loading: loading,
    );
  }
}

class AnimatedSharedPreferenceBuilder<T> extends StatelessWidget {
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

  const AnimatedSharedPreferenceBuilder({
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
      stream: SharedPreferenceProvider.of(context).get(
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

class AnimatedSharedPreferenceMultiBuilder<T> extends StatelessWidget {
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

  const AnimatedSharedPreferenceMultiBuilder({
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
      stream: SharedPreferenceProvider.of(context).getMultiple(
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
