import 'package:countdown/utils/font_utils.dart';
import 'package:countdown/event_data_providers.dart';
import 'package:countdown/screens/settings_screen/settings_screen.dart';
import 'package:countdown/screens/home_screen/time_column.dart';
import 'package:countdown/utils/home_screen_widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/colors.dart';
import '../../generated/l10n.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  Color backgroundColor = Colors.deepPurple;
  Stream<DateTime> timeStream = Stream<DateTime>.periodic(
    const Duration(seconds: 1),
    (x) => DateTime.now(),
  );

  openSettings() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const SettingsScreen(),
    ));
  }

  @override
  void initState() {
    showHowToUseDialogOnlyFirstTime(context);
    storeDefaultHomeScreenValuesFirstTime(context);
    super.initState();
  }

  /// opens a material dialog that explains how to use the app in case the user hasn't seen it yet
  showHowToUseDialogOnlyFirstTime(BuildContext context) async {
    var sharedPrefs = await SharedPreferences.getInstance();
    var showHowToUseDialog = sharedPrefs.getBool('showHowToUseDialog') ?? true;
    if (showHowToUseDialog && context.mounted) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(S.of(context).howToUseDialogTitle),
            content: Text(S.of(context).howToUseDialogText),
            actions: [
              TextButton(
                  onPressed: () {
                    sharedPrefs.setBool('showHowToUseDialog', false);
                    Navigator.of(context).pop();
                  },
                  child: Text(S.of(context).howToUseDialogButton)),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var eventTimestampFuture = ref.watch(eventTimestampProvider);
    var eventTextFuture = ref.watch(eventTextProvider);
    var eventColor =
        ref.watch(eventColorProvider).value ?? ColorConstants.brightPinkCrayola;
    var eventTextFont = ref.watch(eventTextFontProvider).value;

    return Scaffold(
      backgroundColor: eventColor,
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onLongPress: () => openSettings(),
          onDoubleTap: () => openSettings(),
          onForcePressStart: (_) => openSettings(),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 16),
            // this stream builder updates every second to show the current time
            child: StreamBuilder(
                stream: timeStream,
                builder: (context, currentDate) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /*
                       * TimeColumn with days, hours, minutes, seconds
                       * and optional years, indicating the time left until the event
                       */
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 8),
                            child: eventTimestampFuture.when(
                                data: (eventTimestamp) => TimeColumn(
                                      eventTimestamp: eventTimestamp,
                                      now: DateTime.now(),
                                    ),
                                error: (object, stacktrace) =>
                                    Text(S.of(context).error),
                                loading: () =>
                                    const CircularProgressIndicator()),
                          ),
                        ),
                      ),
                      /*
                       * event text with custom font
                       */
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 16),
                          child: eventTextFuture.when(
                              data: (text) => Text(
                                    text,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize:
                                            FontUtils.getScaleFactorByFont(
                                                    eventTextFont) *
                                                45,
                                        height: 1.1,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: eventTextFont),
                                  ),
                              error: (object, stacktrace) =>
                                  Text(S.of(context).error),
                              loading: () =>
                                  const CircularProgressIndicator())),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
