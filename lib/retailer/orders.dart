import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class RetailerOrders extends StatefulWidget {
  const RetailerOrders({Key key}) : super(key: key);

  @override
  _RetailerOrdersState createState() => _RetailerOrdersState();
}

class _RetailerOrdersState extends State<RetailerOrders> {
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
                OrderCard("pending"),
                OrderCard("accepted"),
                OrderCard("rejected")
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final String status;
  const OrderCard(
    this.status, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (status == "pending")
        ? Slidable(
            key: const ValueKey(0),
            startActionPane: ActionPane(
              motion: ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (BuildContext context) {
                    print("hawye");
                  },
                  backgroundColor: Color(0xFFFE4A49),
                  foregroundColor: Colors.white,
                  icon: Icons.close,
                  label: 'reject order',
                ),
              ],
            ),
            endActionPane: ActionPane(
              motion: ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (BuildContext context) {
                    print("hello");
                  },
                  backgroundColor: Color(0xFF7BC043),
                  foregroundColor: Colors.white,
                  icon: Icons.check,
                  label: 'fufil order',
                ),
              ],
            ),
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
              padding: const EdgeInsets.only(right: 8.0, left: 8.0),
              height: 200,
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
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
                          Text("Order id"),
                          Text(
                            "order name",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "date",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
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
                                    ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage: NetworkImage(
                                    "https://via.placeholder.com/23"),
                                backgroundColor: Colors.transparent,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "yajat vishwakarma  ",
                                  style: TextStyle(fontSize: 18),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        : Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
            padding: const EdgeInsets.only(right: 8.0, left: 8.0),
            height: 200,
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
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
                        Text("Order id"),
                        Text(
                          "order name",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "date",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
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
                                  ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: NetworkImage(
                                  "https://via.placeholder.com/23"),
                              backgroundColor: Colors.transparent,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "yajat vishwakarma  ",
                                style: TextStyle(fontSize: 18),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
