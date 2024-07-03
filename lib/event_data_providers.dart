import 'dart:async';

import 'package:countdown/utils/colors.dart';
import 'package:countdown/utils/home_screen_widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_widget/home_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'generated/l10n.dart';

/**
 * The providers for reading and writing the event timestamp, event text, event text font, event text color, and event background color.
 * TODO: this should/could be refactored as there is a lot of code duplication. I already tried to create a generic provider but it didn't work so I took this shortcut for now.
 */

/// A notifier (provider) that reads and writes the event timestamp from/to shared preferences
class EventTimestampNotifier extends AsyncNotifier<DateTime> {
  @override
  FutureOr<DateTime> build() async {
    var sharedPrefs = await SharedPreferences.getInstance();
    var eventTimestamp = sharedPrefs.getString('eventTimestamp');
    if (eventTimestamp != null) {
      return DateTime.parse(eventTimestamp);
    }
    return getDefaultEventTimestamp();
  }

  set(DateTime? value) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      if (value != null) {
        prefs.setString('eventTimestamp', value.toIso8601String());
        HomeWidget.saveWidgetData<String>(
            'eventTimestamp', value.toIso8601String());
      } else {
        prefs.remove('eventTimestamp');
        HomeWidget.saveWidgetData('eventTimestamp', null);
      }
      updateHomeScreenWidget();
      return value ?? getDefaultEventTimestamp();
    });
  }
}

final eventTimestampProvider =
    AsyncNotifierProvider<EventTimestampNotifier, DateTime>(() {
  return EventTimestampNotifier();
});

/// A notifier (provider) that reads and writes the event text from/to shared preferences
class EventTextNotifier extends AsyncNotifier<String> {
  @override
  FutureOr<String> build() async {
    var sharedPrefs = await SharedPreferences.getInstance();
    var eventText = sharedPrefs.getString('eventText');
    if (eventText != null) {
      return eventText;
    }
    return S.current.defaultSubtext;
  }

  set(String? value) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('eventText', value ?? '');
      HomeWidget.saveWidgetData<String>('eventText', value ?? '');
      updateHomeScreenWidget();

      return value ?? '';
    });
  }
}

final eventTextProvider = AsyncNotifierProvider<EventTextNotifier, String>(() {
  return EventTextNotifier();
});

/// A notifier (provider) that reads and writes the event font from/to shared preferences
class EventTextFontNotifier extends AsyncNotifier<String> {
  @override
  FutureOr<String> build() async {
    var sharedPrefs = await SharedPreferences.getInstance();
    var eventText = sharedPrefs.getString('eventTextFont');
    if (eventText != null) {
      return eventText;
    }
    return 'TheSecret';
  }

  set(String? value) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String storedValue = value ?? '';
      prefs.setString('eventTextFont', storedValue);
      return storedValue;
    });
  }
}

final eventTextFontProvider =
    AsyncNotifierProvider<EventTextFontNotifier, String>(() {
  return EventTextFontNotifier();
});

/// A notifier (provider) that reads and writes the event text color from/to shared preferences
class TextColorNotifier extends AsyncNotifier<Color> {
  @override
  FutureOr<Color> build() async {
    var sharedPrefs = await SharedPreferences.getInstance();
    return Color(sharedPrefs.getInt('textColor') ?? getDefaultValue());
  }

  getDefaultValue() {
    return Colors.white.value;
  }

  set(Color? value) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setInt('textColor', value?.value ?? getDefaultValue());
      return value ?? Color(getDefaultValue());
    });
  }
}

final textColorProvider = AsyncNotifierProvider<TextColorNotifier, Color>(() {
  return TextColorNotifier();
});

/// A notifier (provider) that reads and writes the event background color from/to shared preferences
class EventColorNotifier extends AsyncNotifier<Color> {
  @override
  FutureOr<Color> build() async {
    var sharedPrefs = await SharedPreferences.getInstance();
    return Color(sharedPrefs.getInt('eventColor') ?? getDefaultValue());
  }

  getDefaultValue() {
    return ColorConstants.brightPinkCrayola.value;
  }

  set(Color? value) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      int storedValue = value?.value ?? getDefaultValue();
      prefs.setInt('eventColor', storedValue);
      HomeWidget.saveWidgetData<String>(
          'eventColor', '#${storedValue.toRadixString(16).padLeft(6, '0')}');
      updateHomeScreenWidget();
      return value ?? Color(getDefaultValue());
    });
  }
}

final eventColorProvider = AsyncNotifierProvider<EventColorNotifier, Color>(() {
  return EventColorNotifier();
});
