import 'dart:convert';

import 'package:http/http.dart' as http;

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
