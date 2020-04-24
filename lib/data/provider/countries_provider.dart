

import 'package:covid19monitoring/data/model/countries_model.dart';
import 'package:covid19monitoring/data/service/api_services.dart';
import 'package:flutter/material.dart';

class CountriesProvider with ChangeNotifier{
  
  var api = ApiServices();
  CountriesModel countriesModel;
  
  Future<CountriesModel> getCountries() async{
    final response = await api.client.get("${api.baseUrl}/api/countries/");
    if(response.statusCode == 200){
      var result = countriesModelFromJson(response.body);

      

      countriesModel = result;
      notifyListeners();
      return result;
    }else{
      return null;
    }
  }
      
  
}