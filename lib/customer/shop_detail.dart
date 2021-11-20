import 'package:flutter/material.dart';
import 'package:tokofy/customer/product_detail.dart';
import 'package:tokofy/models/singleTokoModel.dart';
import 'package:tokofy/rest/customerREST.dart';

class ShopDetails extends StatefulWidget {
  final String shopID;
  const ShopDetails(this.shopID, {Key key}) : super(key: key);
  @override
  _ShopDetailsState createState() => _ShopDetailsState();
}

class _ShopDetailsState extends State<ShopDetails> {
  var selected = -1;
  SingleToko t;
  void resolverToko() async {
    var s = await getToko(widget.shopID);
    print(s.shop.items);
    setState(() {
      t = s;
    });
  }

  @override
  void initState() {
    super.initState();
    resolverToko();
  }

  @override
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
                        t.shop.name,
                        style: TextStyle(
                            color: Color(0xffF8DB90),
                            fontSize: 36,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        t.shop.category,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 26,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        t.shop.desc,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "catalog",
                        style: TextStyle(
                            color: Color(0xffF8DB90),
                            fontSize: 36,
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
                        children: t.shop.items
                            .map((e) => Card(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductDetail(
                                                        e.id.toString())));
                                      },
                                      child: Card(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            AspectRatio(
                                              child: Image.network(
                                                'https://images.unsplash.com/photo-1502759683299-cdcd6974244f?auto=format&fit=crop&w=440&h=220&q=60',
                                                fit: BoxFit.cover,
                                              ),
                                              aspectRatio: 2 / 1.5,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                e.name +
                                                    " - " +
                                                    e.price.toString() +
                                                    "rs",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Color(0xffF8DB90),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ))
                            .toList(),
                      )
                    ],
                  ),
                ),
              );
            }));
  }
}
