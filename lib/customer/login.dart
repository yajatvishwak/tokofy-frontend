import 'package:flutter/material.dart';
import 'package:tokofy/rest/customerREST.dart';

class CustomerLogin extends StatefulWidget {
  const CustomerLogin({Key key}) : super(key: key);

  @override
  _CustomerLoginState createState() => _CustomerLoginState();
}

class _CustomerLoginState extends State<CustomerLogin> {
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
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
                        Text("login",
                            style: TextStyle(
                                fontSize: 64,
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
                                if (await customerLogin(usernameController.text,
                                    passwordController.text)) {
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      "customer/dashboard", (route) => false);
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
                                  'customer/signup', (route) => false);
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
                              Navigator.of(context).pushNamed("retailer/login");
                            },
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                "sellers proceed here",
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
