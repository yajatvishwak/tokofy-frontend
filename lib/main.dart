import 'package:flutter/material.dart';
import 'package:tokofy/router.dart' as router;

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tokofy",
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      onGenerateRoute: router.generateRoute,
      initialRoute: "retailer/dashboard",
    );
  }
}
