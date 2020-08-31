import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'edit_product_screen.dart';
import '../models/product_model.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<List<ProductModel>>(context);

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
      body: (products != null)
          ? ListView.builder(
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EditProductScreen(
                          products[index],
                        ),
                      ),
                    );
                  },
                  title: Text(products[index].name),
                  trailing: Text('${products[index].price}'),
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
