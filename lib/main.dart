// ignore_for_file: unused_label

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping/Models/Providers/auth.dart';
import 'package:shoping/Models/Providers/products.dart';
import 'package:shoping/screens/cart_screen.dart';
import 'package:shoping/screens/product_detail_screen.dart';
import './screens/product_overview_screen.dart';
import './Models/Providers/cart.dart';
import './Models/Providers/orders.dart';
import './screens/orders_Screen.dart';
import './screens/user_product_screen.dart';
import 'screens/edit_product_screen.dart';
import './screens/auth_screen.dart';
import './screens/272 splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //const name({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
          update: (ctx, auth, previousProducts) => Products(
            auth.token,
            auth.userId,
            previousProducts == null ? [] : previousProducts.items,
          ),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
          update: (ctx, auth, previousOrders) => Orders(
            auth.token,
            auth.userId,
            previousOrders == null ? [] : previousOrders.orders,
          ),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'My shop',
          theme: ThemeData(
            primarySwatch: Colors.orange,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
          ),
          home: auth.isAuth
              ? ProductOverviewScreen()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (ctx, authResultSnapshot) =>
                      authResultSnapshot.connectionState ==
                              ConnectionState.waiting
                          ? SplashScreen()
                          : AuthScreen(),
                ),
          routes: {
            ProductDetailScreen.routName: (ctx) => ProductDetailScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
            OrdersScreen.routeName: (ctx) => OrdersScreen(),
            UserProductScreen.routeName: (ctx) => UserProductScreen(),
            EditProductScreen.routeName: (ctx) => EditProductScreen(),
          },
        ),
      ),
    );
  }
}
