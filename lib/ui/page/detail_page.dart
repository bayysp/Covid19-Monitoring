import 'package:covid19monitoring/data/provider/country_detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  final String selectedLocation;

  const DetailPage({Key key, this.selectedLocation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CountryDetailProvider>(
      builder: (context, countryDetailProvider, _) => Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF001C4A),
          elevation: 12,
          title: Text(
              (selectedLocation != null)
                  ? selectedLocation + " Country Detail"
                  : "-",
              style: GoogleFonts.rubik(
                textStyle: TextStyle(fontWeight: FontWeight.w500),
              )),
        ),
        body: Container(
          color: Color(0xFF00296B),
          child: ListView(
            children: <Widget>[
              //first children is for pie chart
              //for a pie chart
              Container(
                margin: EdgeInsets.fromLTRB(4, 8, 4, 8),
                child: PieChart(
                  chartValueBackgroundColor: Colors.white,
                  showLegends: true,
                  legendStyle: TextStyle(color: Colors.white),
                  animationDuration: Duration(milliseconds: 2000),
                  dataMap: (countryDetailProvider?.countryDetailModel != null)
                      ? countryDetailProvider.dataMap
                      : zeroMap(),
                  chartRadius: MediaQuery.of(context).size.width / 2.7,
                  colorList: [Colors.white, Colors.greenAccent, Colors.red],
                  chartType: ChartType.ring,
                  chartValueStyle:
                      defaultChartValueStyle.copyWith(color: Colors.white),
                ),
              ),

              //second children for detail with cardview
              Container(
                padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
                width: MediaQuery.of(context).size.width / 1,
                decoration: BoxDecoration(
                    color: Color(0xFF69F0AE).withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xFF69F0AE).withOpacity(0.2),
                          blurRadius: 8.0,
                          spreadRadius: 0.8)
                    ]),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(bottom: 8),
                              child: Text(
                                "Confirmed",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                            ),
                            Text(
                              (countryDetailProvider?.countryDetailModel !=
                                      null)
                                  ? countryDetailProvider
                                      ?.countryDetailModel?.confirmed?.value
                                      ?.toString()
                                  : "-",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 22,
                                  color: Colors.white),
                            ),
                          ],
                        ),

                        // Second Children for recovered Data
                        Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(bottom: 8),
                              child: Text(
                                "Recovered",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                            ),
                            Text(
                              (countryDetailProvider?.countryDetailModel !=
                                      null)
                                  ? countryDetailProvider
                                      ?.countryDetailModel?.recovered?.value
                                      ?.toString()
                                  : "-",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 22,
                                  color: Colors.greenAccent),
                            ),
                          ],
                        ),

                        //third child for deaths data
                        Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(bottom: 8),
                              child: Text(
                                "Deaths",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                            ),
                            Text(
                              (countryDetailProvider?.countryDetailModel !=
                                      null)
                                  ? countryDetailProvider
                                      ?.countryDetailModel?.deaths?.value
                                      ?.toString()
                                  : "-",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 22,
                                  color: Colors.red),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
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
