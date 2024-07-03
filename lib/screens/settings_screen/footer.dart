import 'package:countdown/provider_info.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import 'hyperlink_button.dart';

class SettingsFooter extends StatelessWidget {
  const SettingsFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      HyperlinkButton(
        text: S.of(context).imprint,
        onTap: () => showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return Center(
              child: ListView(
                padding: const EdgeInsets.all(32.0),
                children: [
                  Text(S.of(context).imprint,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  Text(S
                      .of(context)
                      .imprintText(imprintAddress, imprintEmail, imprintPhone)),
                ],
              ),
            );
          },
        ),
      ),
      HyperlinkButton(
        text: S.of(context).privacyLinkLabel,
        onTap: () => showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return Center(
              child: ListView(
                padding: const EdgeInsets.all(32.0),
                children: [
                  Text(S.of(context).privacyLinkLabel,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  Text(S.of(context).privacyText(privacyContactAddress,
                      privacyContactEmail, privacyContactPhone))
                ],
              ),
            );
          },
        ),
      ),
      HyperlinkButton(
        text: 'Credits',
        onTap: () => showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return Center(
              child: ListView(
                padding: const EdgeInsets.all(32.0),
                children: [
                  Text(S.of(context).creditsLabel,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        showLicensePage(context: context);
                      },
                      child: Text(S.of(context).showOSSLibraries)),
                  const SizedBox(height: 20),
                  Text(S.of(context).creditsText),
                ],
              ),
            );
          },
        ),
      )
    ]);
  }
}
