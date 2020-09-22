# reactive_preferences

Wrapper for [shared_preferences](https://pub.dev/packages/shared_preferences) which adds the ability to listen to preference changes.

## How to use
- Wrap you root widget in the [PreferenceProvider](lib/pref_provider.dart)
Then You have the following options.
- Use a [preference builder widgets](lib/preference_builder.dart) to listen to changes. 
- use your own stream builder and PreferenceProvider.of(BuildContext context).

See the [example app](/example).

## Import

```
reactive_preferences:
  git:
    url: git://github.com/Johann13/reactive_preferences
```