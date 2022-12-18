import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shooping_app/auth/login.dart';
import 'package:shooping_app/screen/edit_product_screen.dart';
import './providers/cart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import './screen/product_detail_screen.dart';
import 'screen/products_overview_screen.dart';
import 'providers/products.dart';
import './screen/cart_screen.dart';
import './providers/orders.dart';
import './screen/orders_screen.dart';
import './screen/user_products_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return KhaltiScope(
      publicKey: 'test_public_key_9c9c77a92546481a99084130f4e62a5e',
      enabledDebugging: true,
      builder: (context, navkey) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider.value(
              value: Products(),
            ),
            ChangeNotifierProvider.value(
              value: Cart(),
            ),
            ChangeNotifierProvider.value(
              value: Cart(),
            ),
            ChangeNotifierProvider.value(
              value: Orders(),
            ),
          ],
          child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'MyShop',
              theme: ThemeData(
                primarySwatch: Colors.purple,
                accentColor: Colors.deepOrange,
                fontFamily: 'Lato',
              ),
              home: const LoginPage(),
              navigatorKey: navkey,
              localizationsDelegates: const [
                KhaltiLocalizations.delegate
              ],
              routes: {
                ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
                CartScreen.routeName: (ctx) => CartScreen(),
                OrdersScreen.routeName: (ctx) => OrdersScreen(),
                UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
                EditProductScreen.routeName: (ctx) => EditProductScreen(),
              }),
        );
      },
    );
  }
}
