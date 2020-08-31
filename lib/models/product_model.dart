class ProductModel {
  final String productId;
  final double price;
  final String name;

  ProductModel({
    this.productId,
    this.price,
    this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'price': price,
      'name': name,
    };
  }
}
