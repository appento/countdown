/// Contains utility functions for the displayed event fonts.
class FontUtils {
  /// Returns the scale factor for the given font.
  /// Needed to align the sizes of the different fonts with each other
  static double getScaleFactorByFont(String? font) {
    switch (font) {
      case 'TheSecret':
        return 1.6;
      case 'MightypeScript':
        return 1.3;
      case 'AlojaLight':
        return 0.85;
      case 'SettaScript':
        return 1.7;
      case 'Roboto':
        return 1;
      case 'Intuitive':
        return 1.1;
      case 'RujisHandwriting':
        return 1;
      default:
        return 1;
    }
  }
}