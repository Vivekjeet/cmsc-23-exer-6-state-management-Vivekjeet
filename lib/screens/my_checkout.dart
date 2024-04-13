import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cmsc_23_exercise_6/models/item.dart';
import 'package:cmsc_23_exercise_6/providers/shopping_cart_provider.dart';

class MyCheckout extends StatelessWidget {
  const MyCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    List<Item> products = context.watch<ShoppingCartProvider>().cart;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Checkout"),
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: products.isEmpty
            ? const Column(
                children: [
                  Text(
                    "Item Details",
                    textAlign: TextAlign.center,
                  ),
                  Divider(height: 4, color: Colors.black),
                  Text('No items to checkout!')
                ],
              )
            : Column(
                children: [
                  const Text(
                    "Item Details",
                    textAlign: TextAlign.center,
                  ),
                  const Divider(height: 4, color: Colors.black),
                  Expanded(
                      child: Column(
                    children: [
                      Flexible(
                          child: ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text(products[index].name),
                            trailing: Text('${products[index].price}',
                                style: const TextStyle(fontSize: 14)),
                          );
                        },
                      )),
                    ],
                  )),
                  const Divider(height: 4, color: Colors.black),
                  Consumer<ShoppingCartProvider>(
                      builder: (context, cart, child) {
                    return Text("Total Cost to Pay: ${cart.cartTotal}");
                  }),
                  Flexible(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      child: const Text(
                        'Pay Now!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () {
                        context.read<ShoppingCartProvider>().removeAll();
                        Navigator.popUntil(context, ModalRoute.withName('/'));
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Payment Successful!"),
                          duration: Duration(seconds: 1, milliseconds: 100),
                        ));
                      },
                    ),
                  ),
                ],
              ));
  }
}
