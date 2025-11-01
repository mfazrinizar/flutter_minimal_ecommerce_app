import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_minimal_ecommerce_app/component/my_drawer.dart';

void main() {
  testWidgets('MyDrawer contains Shop and Cart entries',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: MyDrawer(),
        ),
      ),
    );

    // Drawer contains entries with expected labels
    expect(find.text('Shop'), findsOneWidget);
    expect(find.text('Cart'), findsOneWidget);
  });
}
