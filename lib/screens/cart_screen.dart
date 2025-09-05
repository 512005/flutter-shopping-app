import 'package:flutter/material.dart';
import 'package:flutter_application_1/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final strings = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(strings.cart)),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: cart.items.isEmpty
            ? Center(child: Text(strings.cartEmpty))
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cart.items.length,
                      itemBuilder: (context, index) {
                        final entry = cart.items.values.toList()[index];
                        final product = entry.product;
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    product.imageUrl,
                                    width: 64,
                                    height: 64,
                                    fit: BoxFit.cover,
                                    errorBuilder: (_, __, ___) =>
                                        const Icon(Icons.broken_image),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.title,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.titleMedium,
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        '\$${product.price.toStringAsFixed(2)}',
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () =>
                                          cart.decreaseQuantity(product.id),
                                      icon: const Icon(
                                        Icons.remove_circle_outline,
                                      ),
                                    ),
                                    Text(entry.quantity.toString()),
                                    IconButton(
                                      onPressed: () =>
                                          cart.increaseQuantity(product.id),
                                      icon: const Icon(
                                        Icons.add_circle_outline,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        strings.total,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        '\$${cart.totalAmount.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // For now, just clear the cart and show dialog
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Text(strings.orderPlaced),
                            content: Text(strings.orderSuccess),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  cart.clear();
                                  Navigator.of(context).pop();
                                },
                                child: Text(strings.ok),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Text(strings.checkout),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
