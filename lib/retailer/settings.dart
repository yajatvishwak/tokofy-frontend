import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RetailerSettings extends StatefulWidget {
  const RetailerSettings({Key key}) : super(key: key);

  @override
  RetailerSettingsState createState() => RetailerSettingsState();
}

class RetailerSettingsState extends State<RetailerSettings> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage:
                        NetworkImage("https://via.placeholder.com/150"),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Welcome, seller",
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.w800),
                ),
                Text(
                  "control your settings here",
                  style: TextStyle(fontSize: 36, color: Colors.white38),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "change credentials",
                  style: TextStyle(fontSize: 24),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: TextField(
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          filled: true,
                          contentPadding: EdgeInsets.all(20),
                          hintText: "location",
                          fillColor: Color(0xff5F5F5F)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          filled: true,
                          contentPadding: EdgeInsets.all(20),
                          hintText: "description",
                          fillColor: Color(0xff5F5F5F)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xffF8DB90), // background
                        onPrimary: Colors.black.withOpacity(0.5), // foreground
                      ),
                      onPressed: () async {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                title: Text("changed credentials"),
                                content: Text("changed creds successfully"),
                              );
                            });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(child: Text("change")),
                      )),
                ),
                SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red, // background
                        onPrimary: Colors.white, // foreground
                      ),
                      onPressed: () async {
                        final pref = await SharedPreferences.getInstance();
                        pref.setString("user_id", "");
                        Navigator.pushNamed(context, "/");
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(child: Text("logout")),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
