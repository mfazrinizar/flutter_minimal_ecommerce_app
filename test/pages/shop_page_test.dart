import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:flutter_minimal_ecommerce_app/pages/shop_page.dart';
import 'package:flutter_minimal_ecommerce_app/pages/cart_page.dart';
import 'package:flutter_minimal_ecommerce_app/models/shop.dart';
import 'package:flutter_minimal_ecommerce_app/themes/theme_provider.dart';

void main() {
  testWidgets('ShopPage shows products and navigates to cart',
      (WidgetTester tester) async {
    final shop = Shop();
    final themeProvider = ThemeProvider(loadFromPrefs: false);

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<Shop>.value(value: shop),
          ChangeNotifierProvider<ThemeProvider>.value(value: themeProvider),
        ],
        child: MaterialApp(
          routes: {
            '/cart_page': (context) => const CartPage(),
          },
          home: const ShopPage(),
        ),
      ),
    );

    // product list should contain first product name
    expect(find.text(shop.shop.first.name), findsWidgets);

    // tapping cart icon should navigate to CartPage
    await tester.tap(find.byIcon(Icons.shopping_cart));
    await tester.pumpAndSettle();

    expect(find.byType(CartPage), findsOneWidget);
  });
}
