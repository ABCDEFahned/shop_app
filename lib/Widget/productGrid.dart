import 'package:flutter/material.dart';
import 'package:flutter_application_5/Widget/productitem.dart';
import 'package:flutter_application_5/providers/products.dart';
import 'package:provider/provider.dart';

class ProductsGrig extends StatelessWidget {
  final bool showFavs;
  const ProductsGrig(
    this.showFavs,
  );

  @override
  Widget build(BuildContext context) {
    final productsItem = Provider.of<Products>(context);
    final products =showFavs? productsItem.FavouriItem : productsItem.items;
    return GridView.builder(
      
      itemCount: products.length,
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2),
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
          value: products[index],
          //create: (context) => products[index],
          child: ProductItem(
              ) //   products[index].title, products[index].imageUrl, products[index].id
          ),
    );
  }
}
