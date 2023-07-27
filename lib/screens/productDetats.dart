import 'package:flutter/material.dart';
import 'package:flutter_application_5/providers/products.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatelessWidget {
  //final String title;
//const ProductDetails(this.title);
  static const roueName = '/product-Details';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final loadedID =
        Provider.of<Products>(context, listen: true).findById(productId);
    //  firstWhere((prod) =>prod.id == productId );
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedID.title),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              loadedID.imageUrl,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "\$${loadedID.price}",
            style: TextStyle(color: Colors.grey, fontSize: 20),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            child: Text(
              loadedID.description,
              textAlign: TextAlign.center,
              softWrap: false,
            ),
          )
        ],
      )),
    );
  }
}
