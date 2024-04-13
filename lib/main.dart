import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/my_catalog.dart';
import 'screens/my_cart.dart';
import 'screens/my_checkout.dart';
import 'providers/shopping_cart_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ShoppingCartProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CMSC 23 Exercise 6',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/cart": (context) => const MyCart(),
        "/products": (context) => const MyCatalog(),
        "/checkout": (context) => const MyCheckout(),
      },
      home: const MyCatalog(),
    );
  }
}
