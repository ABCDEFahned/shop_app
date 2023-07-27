import 'package:flutter/material.dart';
import 'package:flutter_application_5/providers/Cart.dart';
import 'package:flutter_application_5/providers/orders.dart';
import 'package:flutter_application_5/providers/products.dart';
import 'package:flutter_application_5/screens/cart_screen.dart';
import 'package:flutter_application_5/screens/editproduct_screenText.dart';
import 'package:flutter_application_5/screens/order_screen.dart';
import 'package:flutter_application_5/screens/productDetats.dart';
import 'package:flutter_application_5/screens/product_view_screen.dart';
import 'package:flutter_application_5/screens/user_product.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create:(context) =>  Prodt initucts(),
        ),
        ChangeNotifierProvider(
         create:(ctx)=>Cart()
        ),
            ChangeNotifierProvider(
          create:(ctx)=>Orders()
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "myshop",
        theme: ThemeData(
          errorColor: Colors.red,
            primarySwatch: Colors.purple,
            primaryColor: Colors.deepOrange,
          
            fontFamily: 'Lato'),
        home: ProductViewScreen(),
        routes: {ProductDetails.roueName: (context) => ProductDetails(),
        CartScreen.routeNmae:(context) => CartScreen(),
        OrderScreen.routeName:(context)=> OrderScreen(),
        UserProductScreen.routeName:(context)=>UserProductScreen(),
        
        EditeProductScreen.routeName:(context)=>EditeProductScreen()
        },
      ),
    );
  }
}
