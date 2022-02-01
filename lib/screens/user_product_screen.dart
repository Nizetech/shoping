import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/Providers/products.dart';
import '../Widgets/user_product_item.dart';
import 'edit_product_screen.dart';
import '../Widgets/app_drawer.dart';

class UserProductScreen extends StatelessWidget {
  const UserProductScreen({Key key}) : super(key: key);
  static const routeName = '/user-product';

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Products'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemBuilder: (_, i) => UserProductItem(
            productsData.items[i].id,
            productsData.items[i].title,
            productsData.items[i].imageUrl,
          ),
          itemCount: productsData.items.length,
        ),
      ),
    );
  }
}
