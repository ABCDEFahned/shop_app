import 'package:flutter/material.dart';
import 'package:flutter_application_5/providers/Cart.dart';
import 'package:provider/provider.dart';

class CartItems extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;

  const CartItems(
    this.id,
    this.price,
    this.quantity,
    this.productId,
    this.title,
  );

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.only(right: 10),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Are you sure!"),
            content: Text("Do You Remove The Item From The cart"),
            actions: [
              TextButton(onPressed: () {
                Navigator.of(context).pop(true);
              }, child: Text("Yes")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text("No"))
            ],
          ),
        );
      },
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: FittedBox(child: Text("\$${price}")),
              ),
            ),
            title: Text(title),
            subtitle: Text('Total :\$${(quantity * quantity)}'),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}
