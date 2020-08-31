import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';

class EditProductScreen extends StatefulWidget {
  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
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
              decoration: InputDecoration(
                labelText: 'Enter Name',
              ),
              onChanged: (value) {
                productProvider.changeName(value);
              },
            ),
            TextField(
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
              onPressed: () {},
              child: Text('Delete'),
            ),
          ],
        ),
      ),
    );
  }
}
