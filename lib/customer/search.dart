import 'package:flutter/material.dart';
import 'package:tokofy/customer/shop_detail.dart';

class CustomerSearch extends StatefulWidget {
  const CustomerSearch({Key key}) : super(key: key);

  @override
  CustomerSearchState createState() => CustomerSearchState();
}

class CustomerSearchState extends State<CustomerSearch> {
  var selected = -1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "search",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.w800),
            ),
            Text(
              "search for tokos",
              style: TextStyle(
                  fontSize: 18,
                  color: Color(0xffF8DB90).withOpacity(0.5),
                  fontWeight: FontWeight.w800),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      filled: true,
                      contentPadding: EdgeInsets.all(20),
                      hintText: "Type in your text",
                      fillColor: Color(0xff5F5F5F)),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Flexible(
                child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      "https://via.placeholder.com/300x100",
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                    )),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text("local toko",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  color: Color(0xffF8DB90),
                                                  fontSize: 24)),
                                          Row(
                                            children: [
                                              Text("data"),
                                              Text("data"),
                                              Text("data"),
                                              Text("data")
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    (selected == index)
                                        ? IconButton(
                                            icon: Icon(
                                                Icons.arrow_upward_rounded),
                                            onPressed: () {
                                              setState(() {
                                                if (selected == index) {
                                                  selected = -1;
                                                  return;
                                                }
                                                selected = index;
                                              });
                                            })
                                        : IconButton(
                                            icon: Icon(
                                                Icons.arrow_downward_rounded),
                                            onPressed: () {
                                              setState(() {
                                                selected = index;
                                              });
                                            }),
                                  ],
                                ),
                                (selected == index)
                                    ? Container(
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w800),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  primary: Color(
                                                      0xffF8DB90), // background
                                                  onPrimary: Colors.black
                                                      .withOpacity(
                                                          0.5), // foreground
                                                ),
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ShopDetails(
                                                                  "broooo")));
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      20.0),
                                                  child: Center(
                                                      child: Text(
                                                          "teleport into shop")),
                                                )),
                                          ],
                                        ),
                                      )
                                    : Text(""),
                              ],
                            ),
                          ));
                    }))
          ],
        ),
      ),
    );
  }
}
