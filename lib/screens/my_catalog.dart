import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cmsc_23_exercise_6/models/item.dart';
import 'package:cmsc_23_exercise_6/providers/shopping_cart_provider.dart';

class MyCatalog extends StatefulWidget {
  const MyCatalog({super.key});

  @override
  State<MyCatalog> createState() => _MyCatalogState();
}

class _MyCatalogState extends State<MyCatalog> {
  List<Item> productsCatalog = [
    Item("Shampoo", 10.00, 2),
    Item("Soap", 12, 3),
    Item("Toothpaste", 40, 3),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("My Catalog"),
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Icon(Icons.star, color: Colors.grey.shade600),
                title: Text(
                    "${productsCatalog[index].name} - ${productsCatalog[index].price}"),
                trailing: TextButton(
                  child:
                      const Text("Add", style: TextStyle(color: Colors.blue)),
                  onPressed: () {
                    context
                        .read<ShoppingCartProvider>()
                        .addItem(productsCatalog[index]);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("${productsCatalog[index].name} added!"),
                      duration: const Duration(seconds: 1, milliseconds: 100),
                    ));
                  },
                ),
              );
            },
            itemCount: productsCatalog.length),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          shape: const CircleBorder(),
          child: const Icon(Icons.shopping_cart, color: Colors.white),
          onPressed: () {
            Navigator.pushNamed(context, "/cart");
          },
        ));
  }
}
