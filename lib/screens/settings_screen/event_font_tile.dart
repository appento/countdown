import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../generated/l10n.dart';
import '../../event_data_providers.dart';
import '../../utils/font_utils.dart';

class EventFontListTile extends ConsumerWidget {
  const EventFontListTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var eventTextFont = ref.watch(eventTextFontProvider).value;

    return ListTile(
      title: Text(
        S.of(context).subtextFontFamilyLabel,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            value: eventTextFont,
            onChanged: (String? font) {
              ref.read(eventTextFontProvider.notifier).set(font);
            },
            items: [
              ...const <({String font, String? text})>[
                (font: 'TheSecret', text: 'The Secret'),
                (font: 'MightypeScript', text: 'Mightype Script'),
                (font: 'SettaScript', text: 'Setta Script'),
                (font: 'Intuitive', text: null),
                (font: 'RujisHandwriting', text: 'Rujis Handwriting'),
                (font: 'AlojaLight', text: 'Aloja Light'),
                (font: 'Roboto', text: null),
              ].map((e) => buildDropdownItem(e.font, e.text ?? e.font))
            ],
          ),
        ),
      ),
    );
  }

  buildDropdownItem(String value, String text) {
    return DropdownMenuItem(
      value: value,
      child: Text(text,
          style: TextStyle(
              fontFamily: value,
              fontWeight: FontWeight.bold,
              fontSize: FontUtils.getScaleFactorByFont(value) * 18)),
    );
  }
}
