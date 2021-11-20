import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tokofy/models/itemModel.dart';
import 'package:tokofy/models/orderModel.dart';
import 'package:tokofy/models/singleTokoModel.dart';
import 'package:tokofy/models/tokoModel.dart';

Future<int> customerLogin(String username, String password) async {
  print("clicked");
  final res = await http.post(
    Uri.parse("http://172.19.0.1:3000/api/auth/buyerlogin"),
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
    if (result == "User not in DB") return null;
    if (result["message"] == "success") {
      return result["user"]["user_id"];
    } else {
      return null;
    }
  }
  return null;
}

Future<List<Toko>> getAllTokos() async {
  print("getting");
  final res = await http.get(
    Uri.parse("http://172.19.0.1:3000/api/buyer/allshops"),
  );
  if (res.statusCode == 200) {
    final result = jsonDecode(res.body);
    Iterable list = result;
    //print(list);
    return list.map((item) => Toko.fromJson(item)).toList();
  }
  return null;
}

Future<List<OrderModel>> getAllOrders(id) async {
  print("getting");
  final res = await http.get(
    Uri.parse("http://172.19.0.1:3000/api/buyer/myorders/" + id.toString()),
  );
  if (res.statusCode == 200) {
    final result = jsonDecode(res.body);
    Iterable list = result["orders"];
    return list.map((item) => OrderModel.fromJson(item)).toList();
  }
  return null;
}

Future<SingleToko> getToko(String id) async {
  final res = await http.get(
    Uri.parse("http://172.19.0.1:3000/api/buyer/viewshop/" + id),
  );
  if (res.statusCode == 200) {
    final result = jsonDecode(res.body);
    print(result);
    return SingleToko.fromJson(result);
  }
  return null;
}

Future<ItemModel> getItem(String id) async {
  final res = await http.get(
    Uri.parse("http://172.19.0.1:3000/api/buyer/viewitem/" + id),
  );
  if (res.statusCode == 200) {
    final result = jsonDecode(res.body);
    print(result);
    return ItemModel.fromJson(result);
  }
  return null;
}

Future<int> confirmOrder(String userId, String itemId, String sellerId) async {
  print("clicked");
  final res = await http.post(
    Uri.parse("http://172.19.0.1:3000/api/buyer/placeorder"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'user_id': userId,
      'item_id': itemId,
      'seller_id': sellerId,
    }),
  );
  if (res.statusCode == 200) {
    final result = jsonDecode(res.body);
    print(result);
    if (result == "User not in DB") return null;
    if (result["message"] == "success") {
      return result["order"]["id"];
    } else {
      return null;
    }
  }
  return null;
}
