import 'package:covid19monitoring/data/model/country_detail_model.dart';
import 'package:covid19monitoring/data/service/api_services.dart';
import 'package:flutter/material.dart';

class CountryDetailProvider with ChangeNotifier{
  var api = ApiServices();
  CountryDetailModel countryDetailModel;

  Future<CountryDetailModel> getCountryDetail(String iso3) async{
    final response = await api.client.get("${api.baseUrl}/api/countries/"+iso3);

    if(response.statusCode == 200){
      var result = countryDetailModelFromJson(response.body);

      countryDetailModel = result;
      notifyListeners();
      return result;
    }else{
      return null;
    }
  }
}