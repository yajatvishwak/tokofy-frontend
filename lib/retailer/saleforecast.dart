import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class RetailerSaleForecast extends StatefulWidget {
  const RetailerSaleForecast({Key key}) : super(key: key);

  @override
  _RetailerSaleForecastState createState() => _RetailerSaleForecastState();
}

class _RetailerSaleForecastState extends State<RetailerSaleForecast> {
  var chosenValue = "jan";
  var classes = ["jan", "feb"];

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
                      "sale forecast",
                      style:
                          TextStyle(fontSize: 36, fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
                DropdownButton<String>(
                  value: chosenValue,
                  items: <String>[
                    "jan",
                    "feb",
                    "mar",
                    "apr",
                    "may",
                    "jun",
                    "jul",
                    "aug",
                    "sep",
                    "oct",
                    "nov",
                    "dec"
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      chosenValue = value;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
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
                SizedBox(
                  height: 10,
                ),
                Text(
                  "sales this month have been +40% from last month",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 30,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: double.infinity,
                    decoration: new BoxDecoration(color: Colors.black12),
                    child: DataTable(
                      columns: [
                        DataColumn(label: Text("item name")),
                        DataColumn(label: Text("sales"))
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(Text("item name blaadf asf sdf ")),
                          DataCell(Text("broooo"))
                        ])
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "predicted sales forecast",
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 30,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: double.infinity,
                    decoration: new BoxDecoration(color: Colors.black12),
                    child: DataTable(
                      columns: [
                        DataColumn(label: Text("item name")),
                        DataColumn(label: Text("sales"))
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(Text("item name blaadf asf sdf ")),
                          DataCell(Text("broooo"))
                        ])
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
