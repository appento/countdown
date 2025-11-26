# Minimalist Countdown - AI Coding Instructions

## Project Overview
A minimalistic Flutter countdown app for tracking important events. Published on Google Play. Philosophy: **simplicity over features** - avoid feature bloat.

## Architecture

### State Management: Riverpod AsyncNotifiers
All app state uses `AsyncNotifier` providers in `lib/event_data_providers.dart` that persist to SharedPreferences:
- `eventTimestampProvider` - target date/time
- `eventTextProvider` - custom event text
- `eventTextFontProvider` - font family selection
- `textColorProvider` / `eventColorProvider` - colors
- `countUpModeProvider` - count up vs countdown mode

Pattern for new providers:
```dart
class MyNotifier extends AsyncNotifier<T> {
  @override
  FutureOr<T> build() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.get('key') ?? defaultValue;
  }
  set(T value) async { /* save to prefs, update HomeWidget */ }
}
```

### Screen Structure
- `lib/screens/home_screen/` - Main countdown display (long-press/double-tap opens settings)
- `lib/screens/settings_screen/` - Configuration tiles for all customization options
- Each settings tile is a separate widget file (`event_*_tile.dart`, `*_color_tile.dart`)

### Android Home Widget Integration
Uses `home_widget` package. When state changes, also update widget data:
```dart
HomeWidget.saveWidgetData<String>('eventTimestamp', value.toIso8601String());
updateHomeScreenWidget(); // from lib/utils/home_screen_widget_utils.dart
```
Widget layout: `android/app/src/main/res/layout/basic_days_left_widget.xml`

## Development Setup

### Required Before Running
1. Copy `lib/provider_info_example.dart` → `lib/provider_info.dart`
2. Fill in legal contact info (required by German TMG & GDPR)
3. App crashes on startup if these values are not changed from defaults

### Commands
```bash
flutter pub get                          # Install dependencies
flutter run                              # Run app
dart run icons_launcher:create           # Generate app icons
dart run flutter_native_splash:create    # Generate splash screen
flutter gen-l10n                         # Regenerate localizations (if flutter_intl not auto)
```

## Localization (i18n)
- Source files: `lib/l10n/intl_de.arb` (main), `intl_en.arb`
- Generated: `lib/generated/l10n.dart` - DO NOT EDIT manually
- Access strings: `S.of(context).keyName` or `S.current.keyName`
- Main locale is German (`de`), add translations to both .arb files

## Custom Fonts
Fonts in `fonts/` directory, registered in `pubspec.yaml`. Each font needs a scale factor in `lib/utils/font_utils.dart`:
```dart
case 'NewFont':
  return 1.2; // Adjust to align visual size with other fonts
```

## Key Patterns

### Color Handling
Use `ColorConstants` from `lib/utils/colors.dart`. Default brand color: `ColorConstants.brightPinkCrayola` (#EF476F)

### Theme Switching
Theme adapts to text color choice (dark theme for white text, light for black) - see `main.dart`

### Async Provider Usage
Always use `.when()` pattern for async providers:
```dart
ref.watch(eventTextProvider).when(
  data: (text) => Text(text),
  error: (_, __) => Text(S.of(context).error),
  loading: () => CircularProgressIndicator(),
)
```

## Linting
Uses `flutter_lints`, `custom_lint`, and `riverpod_lint`. Run `flutter analyze` before committing.

## Contributing Guidelines
- Open an issue before adding features (minimalism philosophy)
- Bug fixes/translations don't need prior discussion
- When adding translations, also translate Play Store metadata
