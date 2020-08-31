import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';
import '../models/product_model.dart';

class EditProductScreen extends StatefulWidget {
  final ProductModel productModel;

  EditProductScreen([this.productModel]);

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final nameController = TextEditingController();
  final priceController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    priceController.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (widget.productModel == null) {
      nameController.text = '';
      priceController.text = '';
      final productProvider =
          Provider.of<ProductsProvider>(context, listen: false);
      productProvider.loadValues(ProductModel());
    } else {
      nameController.text = widget.productModel.name;
      priceController.text = widget.productModel.price.toString();
      // Update State
      final productProvider =
          Provider.of<ProductsProvider>(context, listen: false);
      productProvider.loadValues(widget.productModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Enter Name',
              ),
              onChanged: (value) {
                productProvider.changeName(value);
              },
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(
                labelText: 'Enter Price',
              ),
              onChanged: (value) {
                productProvider.changePrice(value);
              },
            ),
            const SizedBox(height: 20.0),
            FlatButton(
              textColor: Colors.green,
              onPressed: () {
                productProvider.saveProduct();
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
            FlatButton(
              textColor: Colors.red,
              onPressed: () {
                productProvider.removeProduct(widget.productModel.productId);
                Navigator.of(context).pop();
              },
              child: Text('Delete'),
            ),
          ],
        ),
      ),
    );
  }
}
