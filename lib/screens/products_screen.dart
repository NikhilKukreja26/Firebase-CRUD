import 'package:flutter/material.dart';

import 'edit_product_screen.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add, size: 30.0),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => EditProductScreen(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
