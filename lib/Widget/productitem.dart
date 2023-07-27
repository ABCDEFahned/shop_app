
import 'package:flutter/material.dart';
import 'package:flutter_application_5/providers/product.dart';
import 'package:flutter_application_5/screens/productDetats.dart';
import 'package:provider/provider.dart';

import '../providers/Cart.dart';

class ProductItem extends StatelessWidget {
  //final String id;
  //final String imgeUrl;
  //final String title;

  //const ProductItem(this.title, this.imgeUrl, this.id);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    print('products rebuilds');
    return Scaffold(
      body: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed(ProductDetails.roueName, arguments: product.id);
            },
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.fill,
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black,
            leading: Consumer<Product>(
              builder: (context, product, child) => IconButton(
                onPressed: () {
                  product.toggleFavoritStatus();
                },
                icon: Icon(product.isfavourit
                    ? Icons.favorite
                    : Icons.favorite_border),
                color: Colors.red,
              ),
              child: Text("never changes"),
            ),
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                       SnackBar(
                    content: Text("Add Item to cart"),
                    duration: Duration(seconds: 2),
                    action: SnackBarAction(
                        label: "UNDO",
                        onPressed: () {
                          cart.removingSingleItem(product.id);
                        }),
                  
                  ));
                  cart.additem(product.id, product.title, product.price);
                  //  Scaffold.of(context).openDrawer();
               
                },
                icon: Icon(Icons.shopping_cart)),
          ),
        ),
      ),
    );
  }
}
