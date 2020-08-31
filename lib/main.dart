import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/products_screen.dart';
import 'providers/products_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductsProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: ProductsScreen(),
      ),
    );
  }
}
