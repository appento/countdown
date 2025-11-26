import 'dart:async';

import 'package:countdown/utils/colors.dart';
import 'package:countdown/utils/home_screen_widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_widget/home_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'generated/l10n.dart';

/// Cached SharedPreferences instance
Future<SharedPreferences> get _prefs => SharedPreferences.getInstance();

class EventTimestampNotifier extends AsyncNotifier<DateTime> {
  @override
  FutureOr<DateTime> build() async {
    final value = (await _prefs).getString('eventTimestamp');
    return value != null ? DateTime.parse(value) : getDefaultEventTimestamp();
  }

  Future<void> set(DateTime value) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      (await _prefs).setString('eventTimestamp', value.toIso8601String());
      HomeWidget.saveWidgetData<String>(
          'eventTimestamp', value.toIso8601String());
      updateHomeScreenWidget();
      return value;
    });
  }
}

final eventTimestampProvider =
    AsyncNotifierProvider<EventTimestampNotifier, DateTime>(
        EventTimestampNotifier.new);

class EventTextNotifier extends AsyncNotifier<String> {
  @override
  FutureOr<String> build() async =>
      (await _prefs).getString('eventText') ?? S.current.defaultSubtext;

  Future<void> set(String value) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      (await _prefs).setString('eventText', value);
      HomeWidget.saveWidgetData<String>('eventText', value);
      updateHomeScreenWidget();
      return value;
    });
  }
}

final eventTextProvider =
    AsyncNotifierProvider<EventTextNotifier, String>(EventTextNotifier.new);

class EventTextFontNotifier extends AsyncNotifier<String> {
  @override
  FutureOr<String> build() async =>
      (await _prefs).getString('eventTextFont') ?? 'TheSecret';

  Future<void> set(String value) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      (await _prefs).setString('eventTextFont', value);
      return value;
    });
  }
}

final eventTextFontProvider =
    AsyncNotifierProvider<EventTextFontNotifier, String>(
        EventTextFontNotifier.new);

class TextColorNotifier extends AsyncNotifier<Color> {
  static const _default = Colors.white;

  @override
  FutureOr<Color> build() async =>
      Color((await _prefs).getInt('textColor') ?? _default.toARGB32());

  Future<void> set(Color value) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      (await _prefs).setInt('textColor', value.toARGB32());
      return value;
    });
  }
}

final textColorProvider =
    AsyncNotifierProvider<TextColorNotifier, Color>(TextColorNotifier.new);

class EventColorNotifier extends AsyncNotifier<Color> {
  static const _default = ColorConstants.brightPinkCrayola;

  @override
  FutureOr<Color> build() async =>
      Color((await _prefs).getInt('eventColor') ?? _default.toARGB32());

  Future<void> set(Color value) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      (await _prefs).setInt('eventColor', value.toARGB32());
      HomeWidget.saveWidgetData<String>('eventColor',
          '#${value.toARGB32().toRadixString(16).padLeft(6, '0')}');
      updateHomeScreenWidget();
      return value;
    });
  }
}

final eventColorProvider =
    AsyncNotifierProvider<EventColorNotifier, Color>(EventColorNotifier.new);

class CountUpModeNotifier extends AsyncNotifier<bool> {
  @override
  FutureOr<bool> build() async =>
      (await _prefs).getBool('countUpMode') ?? false;

  Future<void> set(bool value) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      (await _prefs).setBool('countUpMode', value);
      HomeWidget.saveWidgetData<bool>('countUpMode', value);
      updateHomeScreenWidget();
      return value;
    });
  }
}

final countUpModeProvider =
    AsyncNotifierProvider<CountUpModeNotifier, bool>(CountUpModeNotifier.new);
