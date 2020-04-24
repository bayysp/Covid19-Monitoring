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
          title: Text((selectedLocation != null) ? selectedLocation + " Country Detail" : "-",
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
                  legendStyle: TextStyle(
                    color: Colors.white
                  ),
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
