import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import './cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;
  final Text text;

  OrderItem({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime,
    required this.text,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrders(List<CartItem> cartProducts, double total) {
    _orders.insert(
      0,
      OrderItem(
        id: DateTime.now().toString(),
        amount: total,
        dateTime: DateTime.now(),
        products: cartProducts,
        text: Text('Order Now'),
      ),
    );
    notifyListeners();
  }
}
