import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_minimal_ecommerce_app/component/my_list_tile.dart';

void main() {
  testWidgets('MyListTile renders text, icon and handles tap',
      (WidgetTester tester) async {
    var tapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MyListTile(
            text: 'Shop',
            icon: Icons.home,
            onTap: () {
              tapped = true;
            },
          ),
        ),
      ),
    );

    // verify text and icon exist
    expect(find.text('Shop'), findsOneWidget);
    expect(find.byIcon(Icons.home), findsOneWidget);

    // tap the tile and verify callback invoked
    await tester.tap(find.text('Shop'));
    await tester.pumpAndSettle();
    expect(tapped, isTrue);
  });
}
