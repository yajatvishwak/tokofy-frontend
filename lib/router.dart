import 'package:flutter/material.dart';
import 'package:tokofy/customer/dashboard.dart';
import 'package:tokofy/customer/login.dart';
import 'package:tokofy/customer/product_detail.dart';
import 'package:tokofy/customer/shop_detail.dart';
import 'package:tokofy/customer/signup.dart';
import 'package:tokofy/retailer/dashboard.dart';
import 'package:tokofy/retailer/login.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case "customer/dashboard":
      return MaterialPageRoute(builder: (context) => CustomerDashboard());
      break;
    case "customer/login":
      return MaterialPageRoute(builder: (context) => CustomerLogin());
      break;
    case "customer/signup":
      return MaterialPageRoute(builder: (context) => CustomerSignup());
      break;
    case "customer/shopdetail":
      return MaterialPageRoute(builder: (context) => ShopDetails("none"));
      break;
    case "customer/proddetail":
      return MaterialPageRoute(builder: (context) => ProductDetail("none"));
      break;
    case "retailer/dashboard":
      return MaterialPageRoute(builder: (context) => RetailerDashboard());
      break;
    case "retailer/login":
      return MaterialPageRoute(builder: (context) => RetailerLogin());
      break;
    default:
      return MaterialPageRoute(builder: (context) => CustomerLogin());
  }
}
