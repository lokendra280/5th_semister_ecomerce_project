import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shooping_app/screen/edit_product_screen.dart';
import '../providers/products.dart';
import '../widget/user_products_item.dart';
import '../widget/app_drawer.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products';
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Products'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          ),
        ],
      ),
      drawer: AppDrawe(),
      body: ListView.builder(
        itemCount: productsData.items.length,
        itemBuilder: (_, i) => Card(
          child: Column(
            children: [
              UserProductItem(
                productsData.items[i].id,
                productsData.items[i].title,
                productsData.items[i].imageUrl,
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
