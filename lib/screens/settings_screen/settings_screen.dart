import 'package:countdown/event_data_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../generated/l10n.dart';
import 'event_background_color_tile.dart';
import 'event_date_tile.dart';
import 'event_font_tile.dart';
import 'event_text_color_tile.dart';
import 'event_text_tile.dart';
import 'footer.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var eventColor = ref.watch(eventColorProvider).value;
    DateFormat eventDateFormat =
        DateFormat.yMd(Intl.getCurrentLocale()).add_Hm();

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: eventColor,
        appBar: AppBar(
          backgroundColor: eventColor,
          title: Text(S.of(context).settings),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      EventDateListTile(eventDateFormat),
                      const Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: EventTextListTile()),
                      const Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: EventFontListTile()),
                      const Padding(
                          padding: EdgeInsets.only(top: 16.0),
                          child: FontColorListTile()),
                      if (eventColor != null)
                        BackgroundColorListTile(eventColor)
                    ],
                  ),
                ),
              ),
              Text(
                S.of(context).madeWithBrezelInMunich,
              ),
              const SettingsFooter()
            ],
          ),
        ));
  }
}
