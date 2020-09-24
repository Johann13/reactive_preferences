import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_async_builder/builder/simple_stream_builder.dart';
import 'package:reactive_preferences/provider/shared_preference_provider.dart';
import 'package:reactive_preferences/reactive_preferences.dart';

void main() {
  runApp(
    SharedPreferenceProvider(
      builder: (_) => App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PreferenceBuilder<int>(
            prefKey: 'count',
            defaultValue: 0,
            builder: (context, value) {
              return Text('preference_builder value: $value');
            },
          ),
          SimpleStreamBuilder<int>(
            stream: PreferenceProvider.of(context).get<int>('count', 0),
            builder: (context, value) {
              return Text('simple_stream_builder value: $value');
            },
          ),
          AnimatedPreferenceBuilder<int>(
            prefKey: 'count',
            defaultValue: 0,
            duration: Duration(seconds: 1),
            builder: (context, value) {
              Color c = value % 2 == 0 ? Colors.white : Colors.black;
              Color t = value % 2 != 0 ? Colors.white : Colors.black;
              return Container(
                key: Key('$value'),
                color: c,
                child: Text(
                  'animated_preference_builder value: $value',
                  style: TextStyle(
                    color: t,
                  ),
                ),
              );
            },
          ),
          Divider(),
          PreferenceBuilder<bool>(
            prefKey: 'enable',
            defaultValue: true,
            builder: (_, value) {
              return CheckboxListTile(
                title: Text('Enable'),
                value: value,
                subtitle: Text('$value'),
                onChanged: (v) {
                  PreferenceProvider.of(context).set('enable', v);
                },
              );
            },
          ),
          PreferenceMultiBuilder<bool>(
            prefKeys: ['enable', 'enable2'],
            defaultValues: [true, true],
            builder: (_, list) {
              bool enable = list[0];
              bool value = list[1];
              return SwitchListTile(
                title: Text('Enable2'),
                subtitle: Text('$value'),
                value: value,
                onChanged: enable?(v) {
                  PreferenceProvider.of(context).set('enable2', v);
                }:null,
              );

            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          PreferenceProvider.of(context).set(
            'count',
            PreferenceProvider.of(context).getOnce('count', 0) + 1,
          );
        },
      ),
    );
  }
}
