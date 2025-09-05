class Product {
  final String id;
  final String title;
  final String imageUrl;
  final double price;

  const Product({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
  });
}

const demoProducts = <Product>[
  Product(
    id: 'p1',
    title: 'Classic Sneakers',
    imageUrl:
        'https://images.unsplash.com/photo-1525966222134-fcfa99b8ae77?q=80&w=800&auto=format&fit=crop',
    price: 690.99,
  ),
  Product(
    id: 'p2',
    title: 'Wireless Headphones',
    imageUrl:
        'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE3fHx8ZW58MHx8fHx8',
    price: 129.00,
  ),
  Product(
    id: 'p3',
    title: 'Backpack',
    imageUrl:
        'https://images.unsplash.com/photo-1622560480605-d83c853bc5c3?q=80&w=1976&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    price: 490.0,
  ),
  Product(
    id: 'p4',
    title: 'Sunglasses',
    imageUrl:
        'https://images.unsplash.com/photo-1502767089025-6572583495f9?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fHN1bmdsYXNzZXN8ZW58MHx8MHx8fDA%3D',
    price: 3900.0,
  ),
];
