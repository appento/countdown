# Minimalist Countdown

> Weddings, birthdays, anniversaries, Christmas, New Year's Eve or an important deadline. We all
> have events and dates that we look forward to for a long time. With our beautiful minimalistic
> countdown app, you always know exactly how much time is left.

Minimalist Countdown is a simple flutter app that lets you look forward to long-awaited events. It
aims to be simple, beautiful and easy to use.

[Download on Google Play](https://play.google.com/store/apps/details?id=de.appento.countdown)

## Development Setup

The app is built with Flutter and Dart. To get started, you need to have Flutter installed on your
machine. You can find the installation
instructions [here](https://flutter.dev/docs/get-started/install).

1. Clone the repo
2. Run `flutter pub get` to install dependencies
3. Copy `provider_info_example.dart` to `provider_info.dart` and update the values
3. Run `flutter run` to start the app

## Contributing

Any contributions are **greatly appreciated**. You can either open an issue or create a pull
request.

### Pull Requests

**Please remember that this project aims for minimalism and should not be cluttered with features.  
For this reason, please open an issue before starting to work on a new feature so we can discuss the
changes.**
Of course, you don't have to create an issue to fix a bug/typo, add a new language or improve the
codebase :)

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

For typos / translation improvements, you can directly edit the file and create a pull request with
the in-built GitHub web editor.

### Translations

New languages are always welcome! If you want to add a new language, please create a new file in
the `lib/l10n` directory with the language code (e.g. `intl_de.arb` for German) and copy the content
of `intl_en.arb` into it. Then, translate the strings and create a pull request. Please also
translate
the [play store medatata](https://play.google.com/store/apps/details?id=de.appento.countdown) (
title, description, screenshot texts etc.) and add them in plain text as a comment to your pull
request :)

## License

[MIT](/LICENSE)  
[Summary by TL;DR Legal](https://www.tldrlegal.com/license/mit-license)