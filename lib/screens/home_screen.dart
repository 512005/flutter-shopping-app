import 'package:flutter/material.dart';
import 'package:flutter_application_1/l10n/app_localizations.dart';
import 'package:flutter_application_1/widgets/product_cart.dart';
import 'package:provider/provider.dart';


import '../models/product.dart';
import '../models/offer.dart';
import '../widgets/product_cart.dart';
import '../widgets/offer_item.dart';
import '../providers/cart_provider.dart';
import '../providers/locale_provider.dart';
import 'cart_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget _cartBadge(BuildContext context, int count) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const Icon(Icons.shopping_cart_outlined),
        if (count > 0)
          Positioned(
            right: -6,
            top: -6,
            child: CircleAvatar(
              radius: 8,
              backgroundColor: Colors.red,
              child: Text(
                count.toString(),
                style: const TextStyle(fontSize: 10, color: Colors.white),
              ),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context)!;
    final cart = Provider.of<CartProvider>(context);
    final localeProvider = Provider.of<LocaleProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(strings.ourProducts),
        actions: [
          IconButton(
            onPressed: () {
              localeProvider.toggle();
            },
            tooltip: 'Toggle language',
            icon: const Icon(Icons.language),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const CartScreen()));
            },
            icon: _cartBadge(context, cart.itemCount),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 180,
              child: PageView.builder(
                controller: PageController(viewportFraction: 0.88),
                itemCount: demoProducts.length,
                itemBuilder: (context, index) {
                  final p = demoProducts[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 10,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            p.imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => const ColoredBox(
                              color: Colors.black12,
                              child: Icon(Icons.broken_image),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              color: Colors.black45,
                              child: Text(
                                p.title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(12.0),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                final p = demoProducts[index];
                return ProductCard(product: p);
              }, childCount: demoProducts.length),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.74,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8,
              ),
              child: Text(
                strings.hotOffers,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          SliverList.builder(
            itemBuilder: (context, index) {
              final o = demoOffers[index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 6,
                ),
                child: OfferItem(offer: o),
              );
            },
            itemCount: demoOffers.length,
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }
}
