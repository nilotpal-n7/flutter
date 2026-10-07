import 'package:flutter/material.dart';
import 'package:fshop/components/my_button.dart';
import 'package:fshop/components/my_drawer.dart';
import 'package:fshop/models/product.dart';
import 'package:fshop/models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) =>
        AlertDialog(
          content: Text('Remove this item from your cart'),
          actions: [
            MaterialButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
                context.read<Shop>().addToCart(product);
              },
              child: Text('Yes'),
            ),
          ],
        ),
    );
  }

  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => 
        AlertDialog(
          content: Text('User wants to pay! connect this app to your payment backend'),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        title: const Text('Cart Page'),
      ),
      drawer: MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          Expanded(
            child: cart.isEmpty ? const Center(child: const Text('Your cart is empty...')) : ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final item = cart[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text(item.price.toStringAsFixed(2)),
                  trailing: IconButton(
                    onPressed: () => removeItemFromCart(context, item),
                    icon: Icon(Icons.remove),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(
              onTap: () => payButtonPressed(context),
              child: Text('Pay Now'),
            ),
          ),
        ],
      ),
    );
  }
}
