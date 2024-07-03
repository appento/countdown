import 'package:countdown/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:home_widget/home_widget.dart';

import '../generated/l10n.dart';

/// Updates the home screen widget. Might not update if called too often.
Future<bool?> updateHomeScreenWidget() async {
  return await HomeWidget.updateWidget(
    qualifiedAndroidName: 'de.appento.countdown.BasicDaysLeftWidget',
  );
}

/// Sets default values for the home screen widget if there are none yet
void storeDefaultHomeScreenValuesFirstTime(BuildContext context) async {
  String defaultSubtitle = S.of(context).defaultSubtext;
  // Set default values for the home screen widget if they don't exist
  if ((await HomeWidget.getWidgetData('eventTimestamp', defaultValue: null)) ==
      null) {
    HomeWidget.saveWidgetData(
        'eventTimestamp', getDefaultEventTimestamp().toIso8601String());
    HomeWidget.saveWidgetData<String>('eventText', defaultSubtitle);
    HomeWidget.saveWidgetData<String>('eventColor',
        '#${ColorConstants.brightPinkCrayola.value.toRadixString(16).padLeft(6, '0')}');
    updateHomeScreenWidget();
  }
}

/// Returns the default event timestamp to use if there is none set
DateTime getDefaultEventTimestamp() {
  // for now just return today in a year
  return DateTime(DateTime.now().year + 1);
}
