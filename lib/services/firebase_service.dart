import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/product_model.dart';

class FirebaseService {
  final _db = Firestore.instance;

  Future<void> saveProduct(ProductModel productModel) async {
    await _db
        .collection('products')
        .document(productModel.productId)
        .setData(productModel.toMap());
  }

  Stream<List<ProductModel>> getProducts() {
    return _db.collection('products').snapshots().map((snapshot) => snapshot
        .documents
        .map((document) => ProductModel.fromFirestore(document.data))
        .toList());
  }
}
