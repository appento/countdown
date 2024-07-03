import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../generated/l10n.dart';
import '../../event_data_providers.dart';

class FontColorListTile extends ConsumerWidget {
  const FontColorListTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var textColor = ref.watch(textColorProvider).value;

    return ListTile(
      title: Text(
        S.of(context).fontColor,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: DropdownButtonHideUnderline(
        child: DropdownButton<Color>(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          value: textColor,
          onChanged: (Color? color) {
            if (color != null) {
              ref.read(textColorProvider.notifier).set(color);
            }
          },
          items: [
            DropdownMenuItem(
                value: Colors.black, child: Text(S.of(context).black)),
            DropdownMenuItem(
                value: Colors.white, child: Text(S.of(context).white)),
          ],
        ),
      ),
    );
  }
}
