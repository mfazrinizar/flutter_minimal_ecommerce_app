import 'package:flutter/material.dart';
import '../component/my_button.dart';
import '../component/my_drawer.dart';
import '../models/product.dart';
import '../models/shop.dart';
import 'package:provider/provider.dart';

import '../component/theme_switch.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("Remove this item from your cart?"),
        actions: [
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);

              context.read<Shop>().removeFromCart(product);
            },
            child: const Text("Confirm"),
          )
        ],
      ),
    );
  }

  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content: Text("User wants to pay! Connect this app to your backend!"),
      ),
    );
  }

  double totalPrice(BuildContext context) {
    final cart = context.read<Shop>().cart;

    double total = 0;
    for (var item in cart) {
      total += item.price;
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Cart Page"),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: ThemeSwitch(),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: const MyDrawer(),
      body: Column(
        children: [
          Expanded(
            child: cart.isEmpty
                ? const Center(
                    child: Text(
                      "Your cart is empty.\nStart shopping!",
                      textAlign: TextAlign.center,
                    ),
                  )
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final item = cart[index];

                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text(item.price.toStringAsFixed(2)),
                        trailing: IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () => removeItemFromCart(context, item)),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: MyButton(
                onTap: () => payButtonPressed(context),
                child: Text("Pay \$${totalPrice(context)}")),
          )
        ],
      ),
    );
  }
}
