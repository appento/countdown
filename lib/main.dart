import 'package:countdown/screens/home_screen/home_screen.dart';
import 'package:countdown/event_data_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:countdown/provider_info.dart' as provider_info;
import 'package:countdown/provider_info_example.dart' as provider_info_example;

import 'generated/l10n.dart';

void main() {
  if (provider_info.imprintAddress == provider_info_example.imprintAddress ||
      provider_info.privacyContactAddress ==
          provider_info_example.privacyContactAddress) {
    throw Exception("ProviderInfo not set yet (required by (TMG) & GDPR).");
  }

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color? textColor = ref.watch(textColorProvider).value;
    // Force portrait mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Minimalist Countdown',
      // TODO: might need to localize this
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: textColor == Colors.white
            ? const ColorScheme.dark().copyWith(primary: Colors.white)
            : const ColorScheme.light().copyWith(primary: Colors.black),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
