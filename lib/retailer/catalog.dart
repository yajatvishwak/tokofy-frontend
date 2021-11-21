import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tokofy/rest/retailerREST.dart';

class RetailerCatalog extends StatefulWidget {
  const RetailerCatalog({Key key}) : super(key: key);

  @override
  RetailerCatalogState createState() => RetailerCatalogState();
}

class RetailerCatalogState extends State<RetailerCatalog> {
  TextEditingController titleController = new TextEditingController();
  TextEditingController priceController = new TextEditingController();
  TextEditingController descController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4A4A4A),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "catalog",
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.w800),
                ),
                Text(
                  "add items catalog",
                  style: TextStyle(
                      fontSize: 18,
                      color: Color(0xffF8DB90).withOpacity(0.5),
                      fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          filled: true,
                          contentPadding: EdgeInsets.all(20),
                          hintText: "Title",
                          fillColor: Color(0xff5F5F5F)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: TextField(
                      controller: priceController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          filled: true,
                          contentPadding: EdgeInsets.all(20),
                          hintText: "Price",
                          fillColor: Color(0xff5F5F5F)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: TextField(
                      controller: descController,
                      keyboardType: TextInputType.multiline,
                      maxLines: 10,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          filled: true,
                          contentPadding: EdgeInsets.all(20),
                          hintText: "Description",
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
                          hintText: "upload product image",
                          fillColor: Color(0xff5F5F5F)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xffF8DB90), // background
                        onPrimary: Colors.black, // foreground
                      ),
                      onPressed: () async {
                        final pref = await SharedPreferences.getInstance();
                        addItemRetailer(
                          pref.getInt("user_id").toString(),
                          descController.text,
                          titleController.text,
                          priceController.text,
                        );

                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                title: Text("item added"),
                                content: Text(
                                    "item added to your catalog sucessfully"),
                              );
                            });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(child: Text("add item to catalog")),
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
