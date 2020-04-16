import 'package:covid19monitoring/data/provider/global_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
      appBar: AppBar(
        backgroundColor: Color(0xFF001C4A),
        leading: Image.asset(
          'assets/covid_icon.png',
          fit: BoxFit.cover,
          height: 20,
        ),
        elevation: 12,
        title: Text(
          "COVID19",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Spacer(),
              Container(
                margin: EdgeInsets.fromLTRB(0, 12, 12, 8),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.timer,
                      color: Color(0xFF00B39B),
                    ),
                    Consumer<GlobalProvider>(
                      builder:(context, globalProvider, _) => Text((globalProvider.globalModel?.lastUpdate != null)
                          ? f.format(globalProvider?.globalModel.lastUpdate)
                          : "-"),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
