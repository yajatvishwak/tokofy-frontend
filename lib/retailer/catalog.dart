import 'package:flutter/material.dart';

class RetailerCatalog extends StatefulWidget {
  const RetailerCatalog({Key key}) : super(key: key);

  @override
  RetailerCatalogState createState() => RetailerCatalogState();
}

class RetailerCatalogState extends State<RetailerCatalog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4A4A4A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "orders",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w800),
              ),
              Text(
                "open orders",
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
            ],
          ),
        ),
      ),
    );
  }
}
