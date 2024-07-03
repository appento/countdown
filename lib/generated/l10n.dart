// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Fehler`
  String get error {
    return Intl.message(
      'Fehler',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Schriftart des Textes`
  String get subtextFontFamilyLabel {
    return Intl.message(
      'Schriftart des Textes',
      name: 'subtextFontFamilyLabel',
      desc: '',
      args: [],
    );
  }

  /// `Text`
  String get text {
    return Intl.message(
      'Text',
      name: 'text',
      desc: '',
      args: [],
    );
  }

  /// `Datum`
  String get date {
    return Intl.message(
      'Datum',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Einstellungen`
  String get settings {
    return Intl.message(
      'Einstellungen',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Jahre`
  String get years {
    return Intl.message(
      'Jahre',
      name: 'years',
      desc: '',
      args: [],
    );
  }

  /// `Tage`
  String get days {
    return Intl.message(
      'Tage',
      name: 'days',
      desc: '',
      args: [],
    );
  }

  /// `Stunden`
  String get hours {
    return Intl.message(
      'Stunden',
      name: 'hours',
      desc: '',
      args: [],
    );
  }

  /// `Minuten`
  String get minutes {
    return Intl.message(
      'Minuten',
      name: 'minutes',
      desc: '',
      args: [],
    );
  }

  /// `Sekunden`
  String get seconds {
    return Intl.message(
      'Sekunden',
      name: 'seconds',
      desc: '',
      args: [],
    );
  }

  /// `Hintergrundfarbe`
  String get backgroundColor {
    return Intl.message(
      'Hintergrundfarbe',
      name: 'backgroundColor',
      desc: '',
      args: [],
    );
  }

  /// `Fertig`
  String get done {
    return Intl.message(
      'Fertig',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Made with 🥨 in Munich!`
  String get madeWithBrezelInMunich {
    return Intl.message(
      'Made with 🥨 in Munich!',
      name: 'madeWithBrezelInMunich',
      desc: '',
      args: [],
    );
  }

  /// `Impressum`
  String get imprint {
    return Intl.message(
      'Impressum',
      name: 'imprint',
      desc: '',
      args: [],
    );
  }

  /// `Der Nutzung der in diesem Rahmen veröffentlichten Kontaktdaten durch Dritte zur Übersendung von nicht ausdrücklich angeforderter Werbung und Informationsmaterialien wird hiermit ausdrücklich widersprochen. Die Betreiber der Seiten behalten sich ausdrücklich rechtliche Schritte im Falle der unverlangten Zusendung von Werbeinformationen, etwa durch Spam-Mails, vor.\n\nAngaben gem. § 5 TMG:\n\n{contactAddress}\nE-Mail (bevorzugt): {contactEmail}\nTelefon: {contactPhone}`
  String imprintText(
      Object contactAddress, Object contactEmail, Object contactPhone) {
    return Intl.message(
      'Der Nutzung der in diesem Rahmen veröffentlichten Kontaktdaten durch Dritte zur Übersendung von nicht ausdrücklich angeforderter Werbung und Informationsmaterialien wird hiermit ausdrücklich widersprochen. Die Betreiber der Seiten behalten sich ausdrücklich rechtliche Schritte im Falle der unverlangten Zusendung von Werbeinformationen, etwa durch Spam-Mails, vor.\n\nAngaben gem. § 5 TMG:\n\n$contactAddress\nE-Mail (bevorzugt): $contactEmail\nTelefon: $contactPhone',
      name: 'imprintText',
      desc: '',
      args: [contactAddress, contactEmail, contactPhone],
    );
  }

  /// `Schwarz`
  String get black {
    return Intl.message(
      'Schwarz',
      name: 'black',
      desc: '',
      args: [],
    );
  }

  /// `Weiß`
  String get white {
    return Intl.message(
      'Weiß',
      name: 'white',
      desc: '',
      args: [],
    );
  }

  /// `Textfarbe`
  String get fontColor {
    return Intl.message(
      'Textfarbe',
      name: 'fontColor',
      desc: '',
      args: [],
    );
  }

  /// `Vielen Dank an die Künstler der kostenlosen Schriftarten (inkl. kommerzieller Nutzung):\n\nThe Secret by Vlad Cristea (X/Twitter: @theVladC)\n\nMightype Script by AF Studio (Instagram: @adamfathony)\n\nSetta Script by Ian Mikraz (Dribble: @ianmikraz)\n\nIntuitive by Bruno De Souza Leão (Facebook: @brunosouzaleao)\n\nRujis Handwriting by Ruji C. (X/Twitter: @ruji_says)\n\nAloja Light by Krisjanis Mezulis (Instagram: @krisjanismezulis)\n\nRoboto by Google Fonts\n\nHinweis: Diese App ist komplett kostenlos, werbefrei und nicht gewinnorientiert. Bitte kontaktiert uns bei Lizenz-Problemen! :)`
  String get creditsText {
    return Intl.message(
      'Vielen Dank an die Künstler der kostenlosen Schriftarten (inkl. kommerzieller Nutzung):\n\nThe Secret by Vlad Cristea (X/Twitter: @theVladC)\n\nMightype Script by AF Studio (Instagram: @adamfathony)\n\nSetta Script by Ian Mikraz (Dribble: @ianmikraz)\n\nIntuitive by Bruno De Souza Leão (Facebook: @brunosouzaleao)\n\nRujis Handwriting by Ruji C. (X/Twitter: @ruji_says)\n\nAloja Light by Krisjanis Mezulis (Instagram: @krisjanismezulis)\n\nRoboto by Google Fonts\n\nHinweis: Diese App ist komplett kostenlos, werbefrei und nicht gewinnorientiert. Bitte kontaktiert uns bei Lizenz-Problemen! :)',
      name: 'creditsText',
      desc: '',
      args: [],
    );
  }

  /// `Credits`
  String get creditsLabel {
    return Intl.message(
      'Credits',
      name: 'creditsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Verwendete OSS Bibliotheken <3`
  String get showOSSLibraries {
    return Intl.message(
      'Verwendete OSS Bibliotheken <3',
      name: 'showOSSLibraries',
      desc: '',
      args: [],
    );
  }

  /// `bis Silvester`
  String get defaultSubtext {
    return Intl.message(
      'bis Silvester',
      name: 'defaultSubtext',
      desc: '',
      args: [],
    );
  }

  /// `Um in die Einstellungen zu kommen, halte entweder den Bildschirm gedrückt oder tippe doppelt. Viel Spaß! :)`
  String get howToUseDialogText {
    return Intl.message(
      'Um in die Einstellungen zu kommen, halte entweder den Bildschirm gedrückt oder tippe doppelt. Viel Spaß! :)',
      name: 'howToUseDialogText',
      desc: '',
      args: [],
    );
  }

  /// `So kommst du in die Einstellungen`
  String get howToUseDialogTitle {
    return Intl.message(
      'So kommst du in die Einstellungen',
      name: 'howToUseDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Alles klar!`
  String get howToUseDialogButton {
    return Intl.message(
      'Alles klar!',
      name: 'howToUseDialogButton',
      desc: '',
      args: [],
    );
  }

  /// `Datenschutz`
  String get privacyLinkLabel {
    return Intl.message(
      'Datenschutz',
      name: 'privacyLinkLabel',
      desc: '',
      args: [],
    );
  }

  /// `### **I. Allgemeines**\n\nBei der Verwendung von Minimalist Countdown (nachfolgend auch "App") können personenbezogene Daten verarbeitet werden. Diese Datenschutzerklärung informiert über die genauen Umstände der Verarbeitung.\n\nLaut Art. 4 DSGVO sind personenbezogenene Daten Daten, die sich auf eine identifizierte oder identifizierbare natürliche Person beziehen. Als identifizierbar wird eine natürliche Person (im Folgenden "betroffene Person") angesehen, die direkt oder indirekt, insbesondere mittels Zuordnung zu einer Kennung wie einem Namen, zu einer Kennnummer, zu Standortdaten, zu einer Online-Kennung oder zu einem oder mehreren besonderen Merkmalen, die Ausdruck der physischen, physiologischen, genetischen, psychischen, wirtschaftlichen, kulturellen oder sozialen Identität dieser natürlichen Person sind, identifiziert werden kann.\n\n### **II. Welche personenbezogenen Daten fallen bei der Verwendung der App an?**\n\n- Die Ereignisdaten wie zum Beispiel das Ereignisdatum und der Ereignis-Subtext (Selbstverständlich handelt es sich bei diesen Daten nur um personenbezogene Daten, falls der Nutzer auch personenbezogene Daten, wie zum Beispiel das Datum eines Geburtstages angibt. Es steht den Nutzern frei, wie sie die App verwenden wollen und ob sie dabei personenbezogene Daten angeben.)\n\nDie eben genannten Daten werden ausschließlich lokal gespeichert.\nRechtsgrundlage ist berechtigtes Interesse gemäß Art. 6 Abs. 1 Buchst. f DSGVO.\nZweck der Verarbeitung ist die Ermöglichung der grundlegenden App-Funktionalitäten.\nDie Daten werden bis zu ihrer Änderung auf dem Gerät des Nutzers gespeichert. \nDie Daten können in der App allesamt frei geändert werden. Nutzer können die Daten selbst überschreiben und somit löschen.\nDa die Daten nur lokal auf dem Nutzergerät gespeichert sind, können sie auch über die Geräte-Einstellungen gelöscht werden, indem alle Daten der App gelöscht werden.\n\n### **III. Rechte der betroffenen Person**\n\n#### **Widerruf Ihrer Einwilligung zur Datenverarbeitung**\n\nNur mit Ihrer ausdrücklichen Einwilligung sind einige Vorgänge der Datenverarbeitung möglich. Ein Widerruf Ihrer bereits erteilten Einwilligung ist jederzeit möglich. Für den Widerruf genügt eine formlose Mitteilung per E-Mail. Die Rechtmäßigkeit der bis zum Widerruf erfolgten Datenverarbeitung bleibt vom Widerruf unberührt.\n\n#### **Recht auf Beschwerde bei der zuständigen Aufsichtsbehörde**\n\nAls Betroffener steht Ihnen im Falle eines datenschutzrechtlichen Verstoßes ein Beschwerderecht bei der zuständigen Aufsichtsbehörde zu. Zuständige Aufsichtsbehörde bezüglich datenschutzrechtlicher Fragen ist der Landesdatenschutzbeauftragte des Bundeslandes, in dem sich der Sitz unseres Unternehmens befindet. Der folgende Link stellt eine Liste der Datenschutzbeauftragten sowie deren Kontaktdaten bereit:\n\nhttps://www.bfdi.bund.de/DE/Service/Anschriften/anschriften\_table.html\n\n#### **Recht auf Datenübertragbarkeit**\n\nIhnen steht das Recht zu, Daten, die wir auf Grundlage Ihrer Einwilligung oder in Erfüllung eines Vertrags automatisiert verarbeiten, an sich oder an Dritte aushändigen zu lassen. Die Bereitstellung erfolgt in einem maschinenlesbaren Format. Sofern Sie die direkte Übertragung der Daten an einen anderen Verantwortlichen verlangen, erfolgt dies nur, soweit es technisch machbar ist.\n\n#### **Recht auf Auskunft, Berichtigung, Sperrung, Löschung**\n\nSie haben jederzeit im Rahmen der geltenden gesetzlichen Bestimmungen das Recht auf unentgeltliche Auskunft über Ihre gespeicherten personenbezogenen Daten, Herkunft der Daten, deren Empfänger und den Zweck der Datenverarbeitung und ggf. ein Recht auf Berichtigung, Sperrung oder Löschung dieser Daten. Diesbezüglich und auch zu weiteren Fragen zum Thema personenbezogene Daten können Sie sich jederzeit über die im Impressum aufgeführten Kontaktmöglichkeiten an uns wenden.\n\n### **IV. Bennenung der verantwortlichen Stelle**\n\nDie verantwortliche Person für die Datenverarbeitung auf dieser Website ist: {contactAddress}\nE-Mail (bevorzugt): {contactEmail}\nTelefon: {contactPhone}\n\n### **V. Recht auf Vorbehalt**\n\nDer App-Betreiber behält sich vor, die Datenschutzerklärung im Rahmen der geltenden Datenschutzgesetze zu ändern und gegebenenfalls anzupassen.\n\nQuelle von Teilpassagen dieser Datenschutzerklärung: Datenschutz-Konfigurator von mein-datenschutzbeauftragter.de\n`
  String privacyText(
      Object contactAddress, Object contactEmail, Object contactPhone) {
    return Intl.message(
      '### **I. Allgemeines**\n\nBei der Verwendung von Minimalist Countdown (nachfolgend auch "App") können personenbezogene Daten verarbeitet werden. Diese Datenschutzerklärung informiert über die genauen Umstände der Verarbeitung.\n\nLaut Art. 4 DSGVO sind personenbezogenene Daten Daten, die sich auf eine identifizierte oder identifizierbare natürliche Person beziehen. Als identifizierbar wird eine natürliche Person (im Folgenden "betroffene Person") angesehen, die direkt oder indirekt, insbesondere mittels Zuordnung zu einer Kennung wie einem Namen, zu einer Kennnummer, zu Standortdaten, zu einer Online-Kennung oder zu einem oder mehreren besonderen Merkmalen, die Ausdruck der physischen, physiologischen, genetischen, psychischen, wirtschaftlichen, kulturellen oder sozialen Identität dieser natürlichen Person sind, identifiziert werden kann.\n\n### **II. Welche personenbezogenen Daten fallen bei der Verwendung der App an?**\n\n- Die Ereignisdaten wie zum Beispiel das Ereignisdatum und der Ereignis-Subtext (Selbstverständlich handelt es sich bei diesen Daten nur um personenbezogene Daten, falls der Nutzer auch personenbezogene Daten, wie zum Beispiel das Datum eines Geburtstages angibt. Es steht den Nutzern frei, wie sie die App verwenden wollen und ob sie dabei personenbezogene Daten angeben.)\n\nDie eben genannten Daten werden ausschließlich lokal gespeichert.\nRechtsgrundlage ist berechtigtes Interesse gemäß Art. 6 Abs. 1 Buchst. f DSGVO.\nZweck der Verarbeitung ist die Ermöglichung der grundlegenden App-Funktionalitäten.\nDie Daten werden bis zu ihrer Änderung auf dem Gerät des Nutzers gespeichert. \nDie Daten können in der App allesamt frei geändert werden. Nutzer können die Daten selbst überschreiben und somit löschen.\nDa die Daten nur lokal auf dem Nutzergerät gespeichert sind, können sie auch über die Geräte-Einstellungen gelöscht werden, indem alle Daten der App gelöscht werden.\n\n### **III. Rechte der betroffenen Person**\n\n#### **Widerruf Ihrer Einwilligung zur Datenverarbeitung**\n\nNur mit Ihrer ausdrücklichen Einwilligung sind einige Vorgänge der Datenverarbeitung möglich. Ein Widerruf Ihrer bereits erteilten Einwilligung ist jederzeit möglich. Für den Widerruf genügt eine formlose Mitteilung per E-Mail. Die Rechtmäßigkeit der bis zum Widerruf erfolgten Datenverarbeitung bleibt vom Widerruf unberührt.\n\n#### **Recht auf Beschwerde bei der zuständigen Aufsichtsbehörde**\n\nAls Betroffener steht Ihnen im Falle eines datenschutzrechtlichen Verstoßes ein Beschwerderecht bei der zuständigen Aufsichtsbehörde zu. Zuständige Aufsichtsbehörde bezüglich datenschutzrechtlicher Fragen ist der Landesdatenschutzbeauftragte des Bundeslandes, in dem sich der Sitz unseres Unternehmens befindet. Der folgende Link stellt eine Liste der Datenschutzbeauftragten sowie deren Kontaktdaten bereit:\n\nhttps://www.bfdi.bund.de/DE/Service/Anschriften/anschriften\\_table.html\n\n#### **Recht auf Datenübertragbarkeit**\n\nIhnen steht das Recht zu, Daten, die wir auf Grundlage Ihrer Einwilligung oder in Erfüllung eines Vertrags automatisiert verarbeiten, an sich oder an Dritte aushändigen zu lassen. Die Bereitstellung erfolgt in einem maschinenlesbaren Format. Sofern Sie die direkte Übertragung der Daten an einen anderen Verantwortlichen verlangen, erfolgt dies nur, soweit es technisch machbar ist.\n\n#### **Recht auf Auskunft, Berichtigung, Sperrung, Löschung**\n\nSie haben jederzeit im Rahmen der geltenden gesetzlichen Bestimmungen das Recht auf unentgeltliche Auskunft über Ihre gespeicherten personenbezogenen Daten, Herkunft der Daten, deren Empfänger und den Zweck der Datenverarbeitung und ggf. ein Recht auf Berichtigung, Sperrung oder Löschung dieser Daten. Diesbezüglich und auch zu weiteren Fragen zum Thema personenbezogene Daten können Sie sich jederzeit über die im Impressum aufgeführten Kontaktmöglichkeiten an uns wenden.\n\n### **IV. Bennenung der verantwortlichen Stelle**\n\nDie verantwortliche Person für die Datenverarbeitung auf dieser Website ist: $contactAddress\nE-Mail (bevorzugt): $contactEmail\nTelefon: $contactPhone\n\n### **V. Recht auf Vorbehalt**\n\nDer App-Betreiber behält sich vor, die Datenschutzerklärung im Rahmen der geltenden Datenschutzgesetze zu ändern und gegebenenfalls anzupassen.\n\nQuelle von Teilpassagen dieser Datenschutzerklärung: Datenschutz-Konfigurator von mein-datenschutzbeauftragter.de\n',
      name: 'privacyText',
      desc: '',
      args: [contactAddress, contactEmail, contactPhone],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
