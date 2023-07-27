import 'package:flutter/material.dart';
import 'package:flutter_application_5/Widget/cart_item.dart';
import 'package:flutter_application_5/providers/Cart.dart' show Cart;
import 'package:flutter_application_5/providers/orders.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeNmae = '/cart';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
        appBar: AppBar(title: Text("your cart")),
        body: Column(
          children: [
            Card(
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                    
                    label: Text(
                      "\$${cart.Amountitem.toStringAsFixed(2)}",
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  TextButton(
                      onPressed: () {
                        Provider.of<Orders>(context, listen: false).addorder(
                            cart.items.values.toList(), cart.Amountitem);

                        cart.clearItem();
                      },
                      child: Text(
                        "ORDER NOW",
                        style: TextStyle(color: Colors.blue),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) => CartItems(
                          cart.items.values.toList()[index].id,
                          cart.items.values.toList()[index].price,
                          cart.items.values.toList()[index].quantity,
                          cart.items.keys.toList()[index],
                          cart.items.values.toList()[index].title,
                        )))
          ],
        ));
  }
}
