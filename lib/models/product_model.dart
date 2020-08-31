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

  ProductModel.fromFirestore(Map<String, dynamic> firestore)
      : productId = firestore['productId'],
        name = firestore['name'],
        price = firestore['price'];
}
