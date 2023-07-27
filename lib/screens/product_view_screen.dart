import 'package:flutter/material.dart';
import 'package:flutter_application_5/Widget/bledg.dart';
import 'package:flutter_application_5/providers/Cart.dart';
import 'package:flutter_application_5/screens/cart_screen.dart';

import 'package:provider/provider.dart';

import '../Widget/app_drawer.dart';
import '../Widget/productGrid.dart';

enum FilterOption { All, Favorites }

class ProductViewScreen extends StatefulWidget {
  @override
  State<ProductViewScreen> createState() => _ProductViewScreenState();
}

class _ProductViewScreenState extends State<ProductViewScreen> {
  bool _showOnlyFavourit = false;
  @override
  Widget build(BuildContext context) {
    //final productscontainers = Provider.of<Products>(context);
    return Scaffold(
        appBar: AppBar(
            title: Text(
              "MyShop",
              style: TextStyle(fontSize: 20),
            ),
            actions: <Widget>[
              PopupMenuButton(
                onSelected: (FilterOption selectedValue) {
                  setState(() {
                    if (selectedValue == FilterOption.Favorites) {
                      //     productscontainers.showfavoritesOnly();
                      _showOnlyFavourit = true;
                    } else {
                      //     productscontainers.showAll();
                      _showOnlyFavourit = false;
                    }
                  });
                },
                icon: Icon(Icons.more_vert),
                itemBuilder: (_) => [
                  PopupMenuItem(
                    child: Text("Only Favorite"),
                    value: FilterOption.Favorites,
                  ),
                  PopupMenuItem(
                    child: Text("Show All"),
                    value: FilterOption.All,
                  )
                ],
              ),
              Consumer<Cart>(
                  builder: (_, cart, child) =>
                      soltan(child: child!, value: cart.itemcount.toString()),
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(CartScreen.routeNmae);
                      },
                      icon: Icon(Icons.shopping_cart))),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(CartScreen.routeNmae);
                  },
                  icon: Icon(Icons.shopping_cart))
            ]),
            drawer: AppDrawer(),
        body: ProductsGrig(_showOnlyFavourit));
  }
}
  /*Consumer<Cart>(
                  builder: (context, cart, child) => soltan(
                        child: child!,
                        value: cart.itemcount.toString(),
                      )),
                  child:*/