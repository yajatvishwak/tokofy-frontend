import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tokofy/rest/customerREST.dart';

class RetailerLogin extends StatefulWidget {
  const RetailerLogin({Key key}) : super(key: key);

  @override
  _RetailerLoginState createState() => _RetailerLoginState();
}

class _RetailerLoginState extends State<RetailerLogin> {
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  void store(id) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('user_id', id);
    print(prefs.getInt('user_id'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff4A4A4A),
        body: LayoutBuilder(
          builder: (context, constraint) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                    child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "tokofy",
                          style: TextStyle(
                              fontSize: 72, fontWeight: FontWeight.w800),
                        ),
                        Expanded(
                          child: Text(
                            "tokos goes online",
                            style: TextStyle(
                                fontSize: 64,
                                fontWeight: FontWeight.w800,
                                color: Color(0xffF8DB90).withOpacity(0.5)),
                          ),
                        ),
                        Text("seller login",
                            style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.w800,
                                color: Colors.white54)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: TextField(
                              controller: usernameController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  filled: true,
                                  contentPadding: EdgeInsets.all(20),
                                  hintText: "username",
                                  fillColor: Color(0xff5F5F5F)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: TextField(
                              controller: passwordController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  filled: true,
                                  contentPadding: EdgeInsets.all(20),
                                  hintText: "password",
                                  fillColor: Color(0xff5F5F5F)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xffF8DB90), // background
                                onPrimary:
                                    Colors.black.withOpacity(0.5), // foreground
                              ),
                              onPressed: () async {
                                var userId = await customerLogin(
                                    usernameController.text,
                                    passwordController.text);
                                if (userId != null) {
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      "retailer/dashboard", (route) => false);
                                  store(userId);
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          title: Text("authentication failed"),
                                          content: Text(
                                              "please make sure that username/pass are right"),
                                        );
                                      });
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Center(child: Text("login")),
                              )),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  'retailer/signup', (route) => false);
                            },
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(16.0),
                              primary: Colors.white,
                            ),
                            child: Text(
                              "new here? sign up here",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.white54),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed("customer/login");
                            },
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                "customer proceed here",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white54),
                              ),
                            ))
                      ],
                    ),
                  ),
                )),
              ),
            );
          },
        ));
  }
}
