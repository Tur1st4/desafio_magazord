class Product {
  late final String title;
  late final String description;
  late final double price;
  late final String image;

  Product({
    required this.title,
    required this.description,
    required this.price,
    required this.image,
  });

  Product.fromJson(Map<String, Object?> json) {
    title = json["title"] as String;
    description = json["description"] as String;
    price = json["price"] as double;
    image = json["image"] as String;
  }
}
