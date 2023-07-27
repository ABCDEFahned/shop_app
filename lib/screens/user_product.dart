import 'package:flutter/material.dart';
import 'package:flutter_application_5/Widget/app_drawer.dart';
import 'package:flutter_application_5/Widget/user_product_items.dart';
import 'package:flutter_application_5/providers/product.dart';
import 'package:flutter_application_5/providers/products.dart';
import 'package:flutter_application_5/screens/editproduct_screenText.dart';
import 'package:provider/provider.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = '/user-product';

  const UserProductScreen({super.key, });

  @override
  Widget build(BuildContext context) {
    final ProductData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("your product"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(EditeProductScreen.routeName);
              },
              icon:const Icon(Icons.add))
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
            itemCount: ProductData.items.length,
            itemBuilder: (context, i) => Column(
                  children: [
                    UserProductItem(
                        ProductData.items[i].id,
                        ProductData.items[i].title,
                        ProductData.items[i].imageUrl),
                    Divider()
                  ],
                )),
      ),
    );
  }
}
