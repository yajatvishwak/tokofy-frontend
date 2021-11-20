import 'package:flutter/material.dart';
import 'package:tokofy/customer/product_detail.dart';

class ShopDetails extends StatefulWidget {
  final String shopID;
  const ShopDetails(this.shopID, {Key key}) : super(key: key);
  @override
  _ShopDetailsState createState() => _ShopDetailsState();
}

class _ShopDetailsState extends State<ShopDetails> {
  var selected = -1;
  @override
  // use widget.shopID
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff4A4A4A),
        body: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                              icon: Icon(Icons.chevron_left),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                          Text(
                            "shop deets",
                            style: TextStyle(
                                fontSize: 36, fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          "https://via.placeholder.com/330x130",
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "local toko",
                        style: TextStyle(
                            color: Color(0xffF8DB90),
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "category",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat null"),
                      SizedBox(height: 20),
                      Text(
                        "catalog",
                        style: TextStyle(
                            color: Color(0xffF8DB90),
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GridView.count(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        crossAxisCount: 2,
                        childAspectRatio: (1 / 1.2),
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ProductDetail("broooo")));
                              },
                              child: Card(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    AspectRatio(
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1502759683299-cdcd6974244f?auto=format&fit=crop&w=440&h=220&q=60',
                                        fit: BoxFit.cover,
                                      ),
                                      aspectRatio: 2 / 1.5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Vase - Very flowery ',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Color(0xffF8DB90),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }));
  }
}
