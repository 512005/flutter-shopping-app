class Offer {
  final String id;
  final String title;
  final String imageUrl;
  final String description;

  const Offer({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
  });
}

const demoOffers = <Offer>[
  Offer(
    id: 'o1',
    title: '50% Off Sneakers',
    imageUrl:
        'https://images.unsplash.com/photo-1520975916090-3105956dac38?q=80&w=800&auto=format&fit=crop',
    description: 'Grab your favorite sneakers at half price this week only!',
  ),
  Offer(
    id: 'o2',
    title: 'Headphones Deal',
    imageUrl:
        'https://www.cnet.com/a/img/resize/5b4dc98fa6e7176c960e9c7cceff3f530fc1c69b/hub/2025/02/28/fbe8e7f6-1e4e-4614-bdf1-f34fe11cf5bf/headphone-earbud-deals-commerce-image.png?auto=webp&fit=crop&height=900&width=1200',
    description: 'Crystal-clear sound with a sweet discount.',
  ),
  Offer(
    id: 'o3',
    title: 'Back-to-School Backpack',
    imageUrl:
        'https://media.istockphoto.com/id/1315082374/vector/back-to-school-vector-background-design-welcome-back-to-school-text-with-colorful-educational.jpg?s=612x612&w=0&k=20&c=kTpsXoZSHFtzkZWw-ln6mtF_Mn3s9HefxqLiS0N_CJk=',
    description: 'Durable backpacks with multiple compartments.',
  ),
  Offer(
    id: 'o4',
    title: 'Summer Shades',
    imageUrl:
        'https://static.vecteezy.com/system/resources/thumbnails/069/198/310/small/the-stylish-sunglasses-with-vibrant-reflections-against-a-beautiful-sunset-backdrop-photo.jpeg',
    description: 'Stylish sunglasses to beat the heat.',
  ),
];
