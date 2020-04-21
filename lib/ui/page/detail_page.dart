import 'package:covid19monitoring/data/provider/country_detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          title: Text(selectedLocation + " Country Detail",
              style: GoogleFonts.rubik(
                textStyle: TextStyle(fontWeight: FontWeight.w500),
              )),
        ),
        body: Center(
          child: Text(countryDetailProvider.countryDetailModel.confirmed.value.toString()),
        ),
      ),
    );
  }
}
