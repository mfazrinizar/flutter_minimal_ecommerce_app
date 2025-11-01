import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_minimal_ecommerce_app/themes/theme_provider.dart';

void main() {
  const prefKey = 'isDarkMode';

  setUp(() {
    // ensure shared prefs mock cleared before each test
    SharedPreferences.setMockInitialValues(<String, Object>{});
  });

  test('ThemeProvider toggle updates isDark and persists value', () async {
    final provider = ThemeProvider(loadFromPrefs: false);

    expect(provider.isDark, isFalse);

    provider.toggle();
    expect(provider.isDark, isTrue);

    // give async save a moment to complete
    await Future<void>.delayed(const Duration(milliseconds: 20));
    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getBool(prefKey), isTrue);
  });

  test('ThemeProvider setDark updates value and persists', () async {
    final provider = ThemeProvider(loadFromPrefs: false);

    provider.setDark(true);
    expect(provider.isDark, isTrue);

    await Future<void>.delayed(const Duration(milliseconds: 20));
    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getBool(prefKey), isTrue);

    // setting same value should do nothing (no crash)
    provider.setDark(true);
    expect(provider.isDark, isTrue);
  });
}
