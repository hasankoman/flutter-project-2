class Product {
  final String id;
  final String name;
  final int price;
  final String imageUrl;
  final String category;
  final String description;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.description,
  });

  factory Product.fromMap(Map<String, dynamic> data) {
    return Product(
      id: data['id'],
      name: data['name'],
      price: data['price'],
      imageUrl: data['imageUrl'],
      category: data['category'],
      description: data['description'],
    );
  }
}
