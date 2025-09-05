import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          cart.addProduct(product);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${product.title} added to cart')),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) return child;
                      return const Center(child: CircularProgressIndicator());
                    },
                    errorBuilder: (_, __, ___) =>
                        const Icon(Icons.broken_image, size: 48),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                product.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  IconButton(
                    onPressed: () {
                      cart.addProduct(product);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Item added to the cart')),
                      );
                    },
                    icon: const Icon(Icons.add_shopping_cart_outlined),
                    tooltip: 'Add to cart',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
