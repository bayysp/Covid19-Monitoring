import 'dart:ui';

import 'package:covid19monitoring/data/provider/global_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String dateTime = '9-29-2020';
  DateFormat fn = DateFormat("M-dd-yyyy");
  String _selectedLocation = "ID";

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();

    //declare provider
    Provider.of<GlobalProvider>(context, listen: false).getGlobalProvider();

    setState(() {
      dateTime = fn.format(DateTime(now.year, now.month, now.day - 1));
    });
  }

  @override
  Widget build(BuildContext context) {
    DateFormat f = DateFormat("yyyy-MM-dd HH:mm:ss");
    final nf = NumberFormat("#,###");

    return Scaffold(
      backgroundColor: Color(0xFF00296B),
      appBar: AppBar(
        backgroundColor: Color(0xFF001C4A),
        leading: Image.asset(
          'assets/covid_icon.png',
          fit: BoxFit.cover,
          height: 20,
        ),
        elevation: 12,
        title: Text("COVID19",
            style: GoogleFonts.rubik(
              textStyle: TextStyle(fontWeight: FontWeight.w500),
            )),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(12, 12, 12, 8),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                //FIRST CHILDREN -> lastUpdate data
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Spacer(),
                      Icon(
                        Icons.timer,
                        color: Color(0xFF00B39B),
                      ),
                      Consumer<GlobalProvider>(
                        builder: (context, globalProvider, _) => Text(
                          (globalProvider.globalModel?.lastUpdate != null)
                              ? " Last Update at : "+f.format(globalProvider.globalModel?.lastUpdate)
                              : "-",
                          style: GoogleFonts.robotoSlab(
                              textStyle: TextStyle(color: Colors.white)),
                        ),
                      )
                    ],
                  ),
                ),

                //SECOND CHILDREN -> Global Data
                Consumer<GlobalProvider>(
                  builder: (context, globalProvider, _) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      //global data value
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Confirmed",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            (globalProvider.globalModel?.confirmed != null)
                                ? nf
                                    .format(globalProvider
                                        .globalModel?.confirmed?.value)
                                    .toString()
                                : "-",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Recovered",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            (globalProvider.globalModel?.recovered != null)
                                ? nf
                                    .format(globalProvider
                                        .globalModel?.recovered?.value)
                                    .toString()
                                : "-",
                            style: TextStyle(
                              color: Colors.greenAccent,
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "Deaths",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            (globalProvider.globalModel?.deaths != null)
                                ? nf
                                    .format(globalProvider
                                        .globalModel?.deaths?.value)
                                    .toString()
                                : "-",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),

                      //for a pie chart
                      PieChart(
                        chartValueBackgroundColor: Colors.white,
                        showLegends: false,
                        animationDuration: Duration(milliseconds: 2000),
                        dataMap: (globalProvider?.dataMap != null)
                            ? globalProvider.dataMap
                            : zeroMap(),
                        chartRadius: MediaQuery.of(context).size.width / 2.7,
                        colorList: [
                          Colors.white,
                          Colors.greenAccent,
                          Colors.red
                        ],
                        chartType: ChartType.ring,
                        chartValueStyle: defaultChartValueStyle.copyWith(
                          color: Colors.white
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Map<String, double> zeroMap() {
  Map<String, double> res = Map();
  res.putIfAbsent("Confirmed", () => 1);
  res.putIfAbsent("Recovered", () => 1);
  res.putIfAbsent("Deaths", () => 1);
  return res;
}
