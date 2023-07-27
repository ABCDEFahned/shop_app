import 'package:flutter/material.dart';
import 'package:flutter_application_5/Widget/order_item.dart';
import 'package:flutter_application_5/providers/orders.dart' show Orders;
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = "/orders";

  @override
  Widget build(BuildContext context) {
    final orderdata = Provider.of<Orders>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Your Order"),
        ),
        body: ListView.builder(
            itemCount: orderdata.orders.length,
            itemBuilder: (context, i) => OrderItem(orderdata.orders[i])));
  }
}
