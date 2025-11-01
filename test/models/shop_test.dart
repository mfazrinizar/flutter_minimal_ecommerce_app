import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_minimal_ecommerce_app/models/shop.dart';
import 'package:flutter_minimal_ecommerce_app/models/product.dart';

void main() {
  group('Shop model', () {
    late Shop shop;
    final sample = Product(
      name: 'Test',
      price: 10.0,
      description: 'desc',
      imagePath: 'assets/test.png',
    );

    setUp(() {
      shop = Shop();
    });

    test('addToCart increases cart length', () {
      final initial = shop.cart.length;
      shop.addToCart(sample);
      expect(shop.cart.length, initial + 1);
      expect(shop.cart.contains(sample), isTrue);
    });

    test('removeFromCart decreases cart length', () {
      shop.addToCart(sample);
      final afterAdd = shop.cart.length;
      shop.removeFromCart(sample);
      expect(shop.cart.length, afterAdd - 1);
      expect(shop.cart.contains(sample), isFalse);
    });
  });
}
