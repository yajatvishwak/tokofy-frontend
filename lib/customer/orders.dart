import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tokofy/models/orderModel.dart';
import 'package:tokofy/rest/customerREST.dart';

class CustomerOrders extends StatefulWidget {
  const CustomerOrders({Key key}) : super(key: key);

  @override
  _CustomerOrdersState createState() => _CustomerOrdersState();
}

class _CustomerOrdersState extends State<CustomerOrders> {
  List<OrderModel> l;
  void resolver() async {
    final prefs = await SharedPreferences.getInstance();

    var l1 = await getAllOrders(prefs.getInt("user_id"));
    setState(() {
      l = l1;
    });
  }

  @override
  void initState() {
    super.initState();
    resolver();
    print(l);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
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
                "orders you've placed",
                style: TextStyle(
                    fontSize: 18,
                    color: Color(0xffF8DB90).withOpacity(0.5),
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                  children: l
                      .map((e) => OrderCard(e.status.toLowerCase(), e.createdAt,
                          e.id.toString(), e.item.name))
                      .toList())
            ],
          ),
        ),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final String id;
  final String name;
  final String date;
  final String status;
  const OrderCard(
    this.status,
    this.date,
    this.id,
    this.name, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
      height: 160,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            (status == "pending")
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15)),
                      color: Color(0xffF8DB90),
                    ),
                    width: 10,
                  )
                : (status == "rejected")
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15)),
                          color: Color(0xffF89090),
                        ),
                        width: 10,
                      )
                    : Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15)),
                          color: Color(0xffB4FF99),
                        ),
                        width: 10,
                      ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(id),
                  Text(
                    name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    DateTime.parse(date).day.toString() +
                        "/" +
                        DateTime.parse(date).month.toString() +
                        "/" +
                        DateTime.parse(date).year.toString(),
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white38,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  (status == "pending")
                      ? Text(
                          "order created",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffF8DB90)),
                        )
                      : (status == "rejected")
                          ? Text(
                              "order rejected",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffF89090)),
                            )
                          : Text(
                              "order fulfilled",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffB4FF99)),
                            )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
