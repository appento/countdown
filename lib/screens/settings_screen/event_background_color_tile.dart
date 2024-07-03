import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../generated/l10n.dart';
import '../../event_data_providers.dart';
import 'color_picker_row.dart';

class BackgroundColorListTile extends ConsumerWidget {
  const BackgroundColorListTile(this.selectedColor, {super.key});

  final Color selectedColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(
        S.of(context).backgroundColor,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: ColorPickerRow(
          onColorChanged: (Color color) {
            ref.read(eventColorProvider.notifier).set(color);
          },
          selectedColor: selectedColor,
        ),
      ),
    );
  }
}
