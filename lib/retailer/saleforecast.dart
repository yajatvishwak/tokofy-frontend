import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class RetailerSaleForecast extends StatefulWidget {
  const RetailerSaleForecast({Key key}) : super(key: key);

  @override
  _RetailerSaleForecastState createState() => _RetailerSaleForecastState();
}

class _RetailerSaleForecastState extends State<RetailerSaleForecast> {
  var chosenValue = "jan";
  List<List<int>> values = [
    [4234, 6633, 6673, 2367, 2356, 3246],
    [7456, 4456, 2378, 8673, 2346, 8456],
    [8678, 4564, 7453, 8357, 3467, 4563],
    [4234, 6633, 6673, 2367, 2356, 3246],
    [7456, 4456, 2378, 8673, 2346, 8456],
    [8678, 4564, 7453, 8357, 3467, 4563],
    [4234, 6633, 6673, 2367, 2356, 3246],
    [7456, 4456, 2378, 8673, 2346, 8456],
    [8678, 4564, 7453, 8357, 3467, 4563],
    [3123, 2342, 2457, 8643, 8656, 8864],
    [7456, 4456, 2378, 8673, 2346, 8456],
    [8678, 4564, 7453, 8357, 3467, 4563],
  ];
  var chosenData = [];

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
                      var months = [
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
                      ];
                      chosenValue = value;
                      chosenData = values[months.indexOf(value)];
                      print(chosenData);
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
                        data: List<num>.from(chosenData),
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
                          DataCell(Text("Croissant")),
                          DataCell(Text("7804"))
                        ]),
                        DataRow(cells: [
                          DataCell(Text("Bread")),
                          DataCell(Text("4554"))
                        ]),
                        DataRow(cells: [
                          DataCell(Text("Garlic Bread")),
                          DataCell(Text("3221"))
                        ]),
                        DataRow(cells: [
                          DataCell(Text("Veg puff")),
                          DataCell(Text("1885"))
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
                          DataCell(Text("Croissant")),
                          DataCell(Text("7851"))
                        ]),
                        DataRow(cells: [
                          DataCell(Text("Bread")),
                          DataCell(Text("5025"))
                        ]),
                        DataRow(cells: [
                          DataCell(Text("Garlic Bread")),
                          DataCell(Text("3102"))
                        ]),
                        DataRow(cells: [
                          DataCell(Text("Veg puff")),
                          DataCell(Text("1896"))
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
