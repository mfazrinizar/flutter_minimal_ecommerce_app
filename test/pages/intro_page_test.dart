import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:flutter_minimal_ecommerce_app/pages/intro_page.dart';
import 'package:flutter_minimal_ecommerce_app/models/shop.dart';
import 'package:flutter_minimal_ecommerce_app/themes/theme_provider.dart';

class DummyShopPage extends StatelessWidget {
  const DummyShopPage({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Shop Page')));
}

void main() {
  testWidgets('IntroPage navigates to shop when MyButton tapped',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Shop()),
          ChangeNotifierProvider(
              create: (_) => ThemeProvider(loadFromPrefs: false)),
        ],
        child: MaterialApp(
          routes: {
            '/shop_page': (context) => const DummyShopPage(),
          },
          home: const IntroPage(),
        ),
      ),
    );

    // find the forward icon inside MyButton
    final forward = find.byIcon(Icons.arrow_forward);
    expect(forward, findsOneWidget);

    await tester.tap(forward);
    await tester.pumpAndSettle();

    // after tapping expect DummyShopPage to be displayed
    expect(find.text('Shop Page'), findsOneWidget);
  });
}
