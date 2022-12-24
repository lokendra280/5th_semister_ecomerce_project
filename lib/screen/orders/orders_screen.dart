import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:provider/provider.dart';
import '../../widget/app_drawer.dart';
import '../../providers/orders.dart' show Orders;
import '../../widget/orders_item.dart';
import 'package:khalti/khalti.dart';
import 'dart:convert';

class OrdersScreen extends StatefulWidget {
  static const routeName = '/orders';

  OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  String referenceId = "";
  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) {
      Provider.of<Orders>(context, listen: false).fetchAndSetOrder();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              payWithKhaltiInApp();
            },
            icon: Icon(Icons.save),
          )
        ],
      ),
      drawer: AppDrawe(),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (ctx, i) => OrderItem(orderData.orders[i]),
      ),
    );
  }

  payWithKhaltiInApp() {
    KhaltiScope.of(context).pay(
        config: PaymentConfig(
            amount: 1000,
            productIdentity: "product id",
            productName: "product name"),
        preferences: [
          PaymentPreference.khalti,
          PaymentPreference.connectIPS,
          PaymentPreference.eBanking,
          PaymentPreference.mobileBanking,
        ],
        onSuccess: onSucess,
        onFailure: onFailure);
  }

  void onSucess(PaymentSuccessModel successModel) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Payment sucessfull"),
            actions: [
              SimpleDialogOption(
                child: const Text("ok"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  void onFailure(PaymentFailureModel failure) {
    debugPrint(failure.toString());
  }
}
