import 'package:flutter/material.dart';
import 'package:flutter_application_5/providers/products.dart';

import 'package:flutter_application_5/screens/editproduct_screenText.dart';
import 'package:provider/provider.dart';

class UserProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imgURL;

  const UserProductItem(
    this.id,
    this.title,
    this.imgURL,
  );

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imgURL),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(EditeProductScreen.routeName, arguments: id);
              },
              icon: Icon(Icons.edit),
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              onPressed: () {
                Provider.of<Products>(context, listen: false).deleteProduct(id);
              },
              icon: Icon(Icons.delete),
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
