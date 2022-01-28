import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/Providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  //final String title;
  //final bool price;

//   ProductDetailScreen(this.title,
//  //this.price
// );
  static const routName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context).settings.arguments as String; // as id
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
    );
  }
}
