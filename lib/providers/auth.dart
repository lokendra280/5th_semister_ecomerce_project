import 'dart:convert';
import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  late String _token;
  late DateTime _expiryDate;
  late String _userId;

  // Future<void> signup(String email, String password) async {
  //   final response = await http.post(
  //     Uri.parse(
  //         'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBIpRsB__8aOggAV9V4zH1VY4V1y-9XlTA'),
  //     body: json.encode(
  //       {'email': email, 'password': password, 'returnSecureToken': true},
  //     ),
  //   );
  //   print(json.decode(response.body));
  // }

  // Future<void> login(String email, String password) async {
  //   final response = await http.post(
  //     Uri.parse(
  //         'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBIpRsB__8aOggAV9V4zH1VY4V1y-9XlTA'),
  //     body: json.encode(
  //       {'email': email, 'password': password, 'returnSecureToken': true},
  //     ),
  //   );
  //   print(json.decode(response.body));
  // }

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    final url = Uri.parse(
        'https://www.googleapis.com/identitytoolkit/v3/relyingparty/$urlSegment?key=AIzaSyBIpRsB__8aOggAV9V4zH1VY4V1y-9XlTA');
    final response = await http.post(
      url,
      body: json.encode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    );
    print(json.decode(response.body));
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, 'signupNewUser');
  }

  Future<void> login(String email, String password) async {
    // try {
    //   final credential = await FirebaseAuth.instance
    //       .signInWithEmailAndPassword(email: email, password: password);
    // } on FirebaseAuthException catch (e) {
    //   if (e.code == 'user-not-found') {
    //     print('No user found for that email.');
    //   } else if (e.code == 'wrong-password') {
    //     print('Wrong password provided for that user.');
    //   }
    // }
    return _authenticate(email, password, 'verifyPassword ');
  }
}
