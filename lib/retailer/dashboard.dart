import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:tokofy/retailer/catalog.dart';
import 'package:tokofy/retailer/orders.dart';
import 'package:tokofy/retailer/settings.dart';

class RetailerDashboard extends StatefulWidget {
  const RetailerDashboard({Key key}) : super(key: key);

  @override
  _RetailerDashboardState createState() => _RetailerDashboardState();
}

class _RetailerDashboardState extends State<RetailerDashboard> {
  int selectedIndex = 0;
  var pageSelector = [
    DashboardWidget(),
    RetailerOrders(),
    RetailerCatalog(),
    RetailerSettings()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4A4A4A),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        currentIndex: selectedIndex,
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
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_business_rounded),
            label: 'catalog',
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
      body: Center(
        child: pageSelector[selectedIndex],
      ),
    );
  }
}

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({Key key}) : super(key: key);

  @override
  _DashboardWidgetState createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "dashboard",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "hello, seller",
                style: TextStyle(
                    fontSize: 24,
                    color: Color(0xffF8DB90).withOpacity(0.5),
                    fontWeight: FontWeight.w800),
              ),
              Text(
                "sales this month have been +40% from last month",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed("retailer/saleforecast");
                },
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "sale forecast" + " (oct)",
                        style: TextStyle(
                            fontSize: 24,
                            color: Color(0xffF8DB90).withOpacity(0.5),
                            fontWeight: FontWeight.w800),
                      ),
                      Text(
                        "sale for this month",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                            padding: EdgeInsets.all(15),
                            decoration:
                                new BoxDecoration(color: Color(0xff5F5F5F)),
                            child: SfSparkLineChart(
                              color: Color(0xffF8DB90),
                              axisLineWidth: 0,
                              marker: SparkChartMarker(
                                  displayMode: SparkChartMarkerDisplayMode.all),
                              trackball: SparkChartTrackball(
                                  activationMode: SparkChartActivationMode.tap),
                              data: [
                                3123,
                                2342,
                                2457,
                                8643,
                                8656,
                                8864,
                                9643,
                                7788
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "reach forecast" + " (oct)",
                style: TextStyle(
                    fontSize: 24,
                    color: Color(0xffF8DB90).withOpacity(0.5),
                    fontWeight: FontWeight.w800),
              ),
              Text(
                "how well did your shop do?",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: new BoxDecoration(color: Color(0xff5F5F5F)),
                    child: SfSparkLineChart(
                      color: Color(0xffF8DB90),
                      axisLineWidth: 0,
                      marker: SparkChartMarker(
                          displayMode: SparkChartMarkerDisplayMode.all),
                      trackball: SparkChartTrackball(
                          activationMode: SparkChartActivationMode.tap),
                      data: [1, 2, 4, 4, 1, 4, 5, 6, 1, 4, 6],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
