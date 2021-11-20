import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';

class ProductDetail extends StatefulWidget {
  final String prodID;
  const ProductDetail(this.prodID, {Key key}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        icon: Icon(Icons.chevron_left),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    Text(
                      "product deets",
                      style:
                          TextStyle(fontSize: 36, fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    "https://via.placeholder.com/300",
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "tokofy",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w800,
                    color: Color(0xffF8DB90),
                  ),
                ),
                Text(
                  "tokofy",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: ConfirmationSlider(
                      backgroundColor: Color(0xff5F5F5F),
                      foregroundColor: Color(0xffF8DB90),
                      iconColor: Colors.black,
                      text: "slide to place order",
                      textStyle: TextStyle(
                          color: Color(0xffF8DB90),
                          fontWeight: FontWeight.bold),
                      width: MediaQuery.of(context).size.width - 100,
                      onConfirmation: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                title: Text("order placed"),
                                content: Image.network(
                                    "https://i.imgur.com/9LFgGnd.gif"),
                              );
                            });
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
