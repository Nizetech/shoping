// ignore_for_file: unused_label

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping/Models/Providers/products.dart';
import 'package:shoping/screens/product_detail_screen.dart';
import './screens/product_overview_screen.dart';
import './Models/Providers/cart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //const name({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My shop',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routName: (ctx) => ProductDetailScreen(),
        },
      ),
    );
  }
}
