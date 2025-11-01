import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:flutter_minimal_ecommerce_app/pages/cart_page.dart';
import 'package:flutter_minimal_ecommerce_app/models/shop.dart';
import 'package:flutter_minimal_ecommerce_app/themes/theme_provider.dart';
import 'package:flutter_minimal_ecommerce_app/component/theme_switch.dart';

void main() {
  testWidgets('CartPage displays cart items and theme switch works',
      (WidgetTester tester) async {
    final shop = Shop();
    // add first product to cart
    final product = shop.shop.first;
    shop.addToCart(product);

    final themeProvider = ThemeProvider(loadFromPrefs: false);

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<Shop>.value(value: shop),
          ChangeNotifierProvider<ThemeProvider>.value(value: themeProvider),
        ],
        child: const MaterialApp(
          home: CartPage(),
        ),
      ),
    );

    // product should be visible in cart
    expect(find.text(product.name), findsOneWidget);

    // toggling ThemeSwitch updates provider
    expect(themeProvider.isDark, isFalse);
    await tester.tap(find.byType(ThemeSwitch));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));
    expect(themeProvider.isDark, isTrue);
  });
}
