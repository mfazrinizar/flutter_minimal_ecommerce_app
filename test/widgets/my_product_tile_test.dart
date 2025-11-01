import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_minimal_ecommerce_app/component/my_product_tile.dart';
import 'package:flutter_minimal_ecommerce_app/models/product.dart';
import 'package:provider/provider.dart';
import 'package:flutter_minimal_ecommerce_app/models/shop.dart';

void main() {
  testWidgets('MyProductTile renders product info',
      (WidgetTester tester) async {
    final product = Product(
      name: 'Test Product',
      price: 12.34,
      description: 'desc',
      imagePath: 'assets/product_1.jpg',
    );

    final shop = Shop();

    await tester.pumpWidget(
      ChangeNotifierProvider<Shop>.value(
        value: shop,
        child: MaterialApp(
          home: Scaffold(body: MyProductTile(product: product)),
        ),
      ),
    );

    expect(find.text(product.name), findsOneWidget);
    // price may be formatted; ensure the numeric portion exists
    expect(find.textContaining('12'), findsWidgets);
  });
}
