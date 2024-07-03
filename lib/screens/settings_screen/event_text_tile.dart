import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../generated/l10n.dart';
import '../../event_data_providers.dart';

class EventTextListTile extends ConsumerStatefulWidget {
  const EventTextListTile({super.key});

  @override
  ConsumerState createState() => _EventTextListTileState();
}

class _EventTextListTileState extends ConsumerState<EventTextListTile> {
  final TextEditingController _eventTextController = TextEditingController();

  @override
  void initState() {
    _eventTextController.text = ref.read(eventTextProvider).asData?.value ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        S.of(context).text,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: TextField(
        controller: _eventTextController,
        onChanged: (String value) {
          ref.read(eventTextProvider.notifier).set(value);
        },
      ),
    );
  }
}
