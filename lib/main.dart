import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/products_screen.dart';
import 'providers/products_provider.dart';
import 'services/firebase_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _firebaseService = FirebaseService();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductsProvider(),
        ),
        StreamProvider(
          create: (context) => _firebaseService.getProducts(),
        ),
      ],
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
