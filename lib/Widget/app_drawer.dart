import 'package:flutter/material.dart';
import 'package:flutter_application_5/screens/order_screen.dart';
import 'package:flutter_application_5/screens/user_product.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        AppBar(
          title: Text("Hello Friend"),
          automaticallyImplyLeading: false,
        ),
        Divider(),
        ListTile(
          title: Text("Shop"),
          leading: Icon(Icons.shop),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        Divider(),
        ListTile(
          title: Text("orders"),
          leading: Icon(Icons.payment),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(OrderScreen.routeName);
          },
        ),
 Divider(),
        ListTile(
          title: Text("Manage Orders"),
          leading: Icon(Icons.edit),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(UserProductScreen.routeName);
          },
        )
      ]),
    );
  }
}
