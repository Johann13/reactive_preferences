import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reactive_preferences/preference_builder.dart';

import 'file:///C:/Projekte/reactive_preferences/lib/provider/pref_provider.dart';

class PreferenceCheckbox extends StatelessWidget {
  final String prefKey;
  final bool defaultValue;
  final String title;
  final String subtitle;
  final Widget secondary;

  const PreferenceCheckbox({
    Key key,
    @required this.prefKey,
    @required this.defaultValue,
    @required this.title,
    this.subtitle,
    this.secondary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferenceBuilder(
      prefKey: prefKey,
      defaultValue: defaultValue,
      builder: (context, value) {
        return CheckboxListTile(
          title: Text(title),
          subtitle: subtitle != null ? Text(subtitle) : null,
          secondary: secondary,
          value: value,
          onChanged: (v) {
            PreferenceProvider.of(context).set(prefKey, v);
          },
        );
      },
    );
  }
}
