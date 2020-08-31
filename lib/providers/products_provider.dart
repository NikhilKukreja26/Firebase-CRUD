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

  void loadValues(ProductModel productModel) {
    _name = productModel.name;
    _price = productModel.price;
    _productId = productModel.productId;
  }

  void saveProduct() {
    if (_productId == null) {
      final newProduct = ProductModel(
        name: name,
        price: price,
        productId: uuid.v4(),
      );
      firebaseService.saveProduct(newProduct);
    } else {
      final updateProduct = ProductModel(
        name: name,
        price: price,
        productId: _productId,
      );
      firebaseService.saveProduct(updateProduct);
    }
  }

  void removeProduct(String productId) {
    firebaseService.removeProduct(productId);
  }
}
