import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tokofy/models/tokoModel.dart';

Future<bool> customerLogin(String username, String password) async {
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
    if (result == "User not in DB") return false;
    if (result["message"] == "success") {
      return true;
    } else {
      return false;
    }
  }
  return false;
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
