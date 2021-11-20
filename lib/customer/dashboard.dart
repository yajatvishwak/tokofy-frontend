import 'package:flutter/material.dart';
import 'package:tokofy/rest/customerREST.dart';
import 'package:tokofy/customer/orders.dart';
import 'package:tokofy/customer/search.dart';
import 'package:tokofy/customer/settings.dart';
import 'package:tokofy/customer/shop_detail.dart';

class CustomerDashboard extends StatefulWidget {
  const CustomerDashboard({Key key}) : super(key: key);

  @override
  _CustomerDashboardState createState() => _CustomerDashboardState();
}

class _CustomerDashboardState extends State<CustomerDashboard> {
  var barSelected = 0;
  var pageSelector = [
    DashboardWidget(),
    CustomerSearch(),
    CustomerOrders(),
    CustomerSetting()
  ];

  void onItemTapped(int index) {
    setState(() {
      barSelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff4A4A4A),
        bottomNavigationBar: BottomNavigationBar(
          onTap: onItemTapped,
          currentIndex: barSelected,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black87,
          unselectedItemColor: Colors.black38,
          backgroundColor: Color(0xffF8DB90),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: 'orders',
            ),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: 10,
                backgroundImage: NetworkImage("https://via.placeholder.com/23"),
                backgroundColor: Colors.transparent,
              ),
              label: 'profile',
            ),
          ],
        ),
        body: pageSelector[barSelected]);
  }
}

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({Key key}) : super(key: key);
  @override
  _DashboardWidgetState createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  var tokos = [];

  void initToko() async {
    var bro = await getAllTokos();
    setState(() {
      tokos = bro;
    });
  }

  @override
  void initState() {
    super.initState();
    initToko();
  }

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
              "dashboard",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.w800),
            ),
            Text(
              "explore tokos around you",
              style: TextStyle(
                  fontSize: 18,
                  color: Color(0xffF8DB90).withOpacity(0.5),
                  fontWeight: FontWeight.w800),
            ),
            SizedBox(
              height: 30,
            ),
            Flexible(
                child: ListView.builder(
                    itemCount: tokos.length,
                    itemBuilder: (BuildContext context, int index) {
                      print(tokos.length);
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
                                          Text(tokos[index].name,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  color: Color(0xffF8DB90),
                                                  fontSize: 24)),
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8),
                                                child:
                                                    Text(tokos[index].location),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: Container(
                                                  height: 10,
                                                  width: 10,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xff5F5F5F),
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child:
                                                    Text(tokos[index].category),
                                              ),
                                            ],
                                          ),
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
                                              tokos[index].desc,
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
                                                              ShopDetails(tokos[
                                                                      index]
                                                                  .userId
                                                                  .toString())));
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
