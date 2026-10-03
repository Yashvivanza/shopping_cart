class ProductModel {
  final String id;
  final String categoryId;
  final String name;
  final String imageUrl;
  final double price;
  final double rating;
  final String shortDescription;
  final String detailedDescription;

  const ProductModel({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.rating,
    required this.shortDescription,
    required this.detailedDescription,
  });
}
