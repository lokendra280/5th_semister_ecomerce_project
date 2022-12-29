import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import './cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> fetchAndSetOrder() async {
    final response = await http.get(Uri.parse(
        'https://shoping-app-6158c-default-rtdb.firebaseio.com/orders.json'));
    final List<OrderItem> loadedOrders = [];

    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    extractedData.forEach((orderId, orderData) {
      if (extractedData == null) {
        return;
      }
      loadedOrders.add(
        OrderItem(
          id: orderId,
          amount: orderData['amount'],
          dateTime: DateTime.parse(orderData['dateTime']),
          products: (orderData['products'] as List<dynamic>)
              .map(
                (item) => CartItem(
                    id: item['id'],
                    title: item['title'],
                    price: item['price'],
                    quantity: item['quantity']),
              )
              .toList(),
        ),
      );
    });
    _orders = loadedOrders.reversed.toList();
    notifyListeners();
  }

  Future<void> addOrders(List<CartItem> cartProducts, double total) async {
    final timestamp = DateTime.now();
    final response = await http.post(
      Uri.parse(
          'https://shoping-app-6158c-default-rtdb.firebaseio.com/orders.json'),
      body: json.encode({
        'amount': total,
        'dateTime': timestamp.toIso8601String(),
        'products': cartProducts
            .map((cp) => {
                  'id': cp.id,
                  'title': cp.title,
                  'quantity': cp.quantity,
                  'price': cp.price,
                })
            .toList(),
      }),
    );
    _orders.insert(
      0,
      OrderItem(
        id: DateTime.now().toString(),
        amount: total,
        dateTime: timestamp,
        products: cartProducts,
      ),
    );
    notifyListeners();
  }
}
