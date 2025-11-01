import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:flutter_minimal_ecommerce_app/component/theme_switch.dart';
import 'package:flutter_minimal_ecommerce_app/themes/theme_provider.dart';

void main() {
  testWidgets('ThemeSwitch toggles provider and updates icon',
      (WidgetTester tester) async {
    final provider = ThemeProvider(loadFromPrefs: false);

    await tester.pumpWidget(
      ChangeNotifierProvider<ThemeProvider>.value(
        value: provider,
        child: const MaterialApp(
          home: Scaffold(body: Center(child: ThemeSwitch())),
        ),
      ),
    );

    // initially expect sun icon (light mode)
    expect(find.byIcon(Icons.wb_sunny), findsOneWidget);
    expect(provider.isDark, isFalse);

    // tap switch
    await tester.tap(find.byType(ThemeSwitch));
    // allow animation to run
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    // provider should be toggled and icon switched
    expect(provider.isDark, isTrue);
    expect(find.byIcon(Icons.nightlight_round), findsOneWidget);
  });
}
