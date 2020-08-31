import 'package:flutter/widgets.dart';
import 'package:uuid/uuid.dart';

import '../services/firebase_service.dart';
import '../models/product_model.dart';

class ProductsProvider extends ChangeNotifier {
  final firebaseService = FirebaseService();

  String _name;
  double _price;
  String _productId;
  final uuid = Uuid();

  // Getters
  String get name => _name;

  double get price => _price;

  // Setters
  void changeName(String value) {
    _name = value;
    notifyListeners();
  }

  void changePrice(String value) {
    _price = double.parse(value);
    notifyListeners();
  }

  void saveProduct() {
    final productModel = ProductModel(
      name: name,
      price: price,
      productId: uuid.v4(),
    );
    firebaseService.saveProduct(productModel);
  }
}
