import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../generated/l10n.dart';
import '../../event_data_providers.dart';

class EventDateListTile extends ConsumerWidget {
  const EventDateListTile(this._dateFormat, {super.key});

  final DateFormat _dateFormat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var eventTimestamp = ref.watch(eventTimestampProvider);

    return ListTile(
        title: Text(
          S.of(context).date,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: DateTimeField(
          initialValue: eventTimestamp.value,
          format: _dateFormat,
          resetIcon: null,
          onChanged: (DateTime? value) {
            ref.read(eventTimestampProvider.notifier).set(value);
          },
          onShowPicker: (context, currentValue) async {
            return await showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100),
            ).then((DateTime? date) async {
              if (date != null) {
                final time = await showTimePicker(
                  context: context,
                  initialTime:
                      TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                );
                return DateTimeField.combine(date, time);
              } else {
                return currentValue;
              }
            });
          },
        ));
  }
}
