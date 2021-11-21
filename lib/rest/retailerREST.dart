import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tokofy/models/reatilerOrder.dart';

Future<bool> retailerLogin(String username, String password) async {
  print("clicked");
  final res = await http.post(
    Uri.parse("http://172.19.0.1:3000/api/auth/sellerlogin"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'password': password,
    }),
  );
  if (res.statusCode == 200) {
    final result = jsonDecode(res.body);
    print(result);
    if (result == "User not in DB") return false;
    if (result["message"] == "success") {
      return true;
    } else {
      return false;
    }
  }
  return false;
}

Future<List<RetailerOrder>> getAllOrdersRetailer(String id) async {
  final res = await http.get(
    Uri.parse("http://172.19.0.1:3000/api/seller/allorders/" + id),
  );
  if (res.statusCode == 200) {
    final result = jsonDecode(res.body);
    Iterable list = result["orders"];
    print(result);
    return list.map((item) => RetailerOrder.fromJson(item)).toList();
  }

  return null;
}

//  pref.getInt("user_id"),
//                           descController.text,
//                           titleController.text,
//                           priceController.text,

Future<bool> addItemRetailer(
    String userId, String desc, String name, String price) async {
  final res = await http.post(
    Uri.parse("http://172.19.0.1:3000/api/seller/additem"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      "name": name,
      "desc": desc,
      "price": price,
      "user_id": userId
    }),
  );
  if (res.statusCode == 200) {
    final result = jsonDecode(res.body);
    print(result);
    if (result["message"] == "success") {
      return true;
    } else {
      return false;
    }
  }
  return false;
}

Future<bool> acceptStatus(String orderID) async {
  final res = await http.post(
    Uri.parse("http://172.19.0.1:3000/api/seller/order-status"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body:
        jsonEncode(<String, String>{"order_id": orderID, "action": "Accepted"}),
  );
  if (res.statusCode == 200) {
    final result = jsonDecode(res.body);
    print(result);
    if (result["message"] == "success") {
      return true;
    } else {
      return false;
    }
  }
  return false;
}

Future<bool> rejectedStatus(String orderID) async {
  final res = await http.post(
    Uri.parse("http://172.19.0.1:3000/api/seller/order-status"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body:
        jsonEncode(<String, String>{"order_id": orderID, "action": "Rejected"}),
  );
  if (res.statusCode == 200) {
    final result = jsonDecode(res.body);
    print(result);
    if (result["message"] == "success") {
      return true;
    } else {
      return false;
    }
  }
  return false;
}
